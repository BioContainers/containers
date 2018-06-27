#!/usr/bin/env perl

=head1 NAME

iprscan5_xmlcompile.pl

=head1 DESCRIPTION

InterProScan 5 (SOAP) web service Perl client using L<XML::Compile::SOAP>.

Tested with:

=over

=item *
L<XML::Compile::SOAP> 0.78, L<XML::Compile> 0.96 and Perl 5.8.8 (Ubuntu 8.04 LTS)

=item *
L<XML::Compile::SOAP> 2.19, L<XML::Compile> 1.19 and Perl 5.10.1 (Ubuntu 10.04 LTS)

=back

For further information see:

=over

=item *
L<http://www.ebi.ac.uk/Tools/webservices/services/pfa/iprscan5_soap>

=item *
L<http://www.ebi.ac.uk/Tools/webservices/tutorials/perl>

=back

=head1 LICENSE

Copyright 2012-2014 EMBL - European Bioinformatics Institute

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=head1 VERSION

$Id$

=cut

# ======================================================================
# Enable Perl warnings
use strict;
use warnings;

# Load libraries
use XML::Compile;
use XML::Compile::WSDL11;
use XML::Compile::SOAP11;
use XML::Compile::Transport::SOAPHTTP;
use Getopt::Long qw(:config no_ignore_case bundling);
use File::Basename qw(basename);
use MIME::Base64;
use Data::Dumper;

# WSDL URL for service
my $WSDL = 'http://www.ebi.ac.uk/Tools/services/soap/iprscan5?wsdl';

# Set interval for checking status
my $checkInterval = 3;

# Output level
my $outputLevel = 1;

# Process command-line options
my $numOpts = scalar(@ARGV);
my %params = ( 'debugLevel' => 0 );

# Default parameter values (should get these from the service)
my %tool_params = ();
GetOptions(

	# Tool specific options
	'appl=s'     => \$params{'appl'},          # Signature methods.
	'goterms'    => \$params{'goterms'},       # Enable Gene Ontology terms.
	'nogoterms'  => \$params{'nogoterms'},     # Disable Gene Ontology terms.
	'pathways'   => \$params{'pathways'},      # Enable pathway terms.
	'nopathways' => \$params{'nopathways'},    # Disable pathway terms.
	'sequence=s' => \$params{'sequence'},      # Input sequence(s).
	'multifasta' => \$params{'multifasta'},    # Multiple fasta input

	# Compatability options (old command-line)
	'app=s'   => \$params{'app'},              # Signature methods.
	'crc'     => \$params{'crc'},              # Enable CRC look-up (ignored).
	'nocrc'   => \$params{'nocrc'},            # Disable CRC look-up (ignored).
	
	# Generic options
	'email=s'       => \$params{'email'},          # User e-mail address
	'title=s'       => \$params{'title'},          # Job title
	'outfile=s'     => \$params{'outfile'},        # Output file name
	'outformat=s'   => \$params{'outformat'},      # Output file type
	'jobid=s'       => \$params{'jobid'},          # JobId
	'help|h'        => \$params{'help'},           # Usage help
	'async'         => \$params{'async'},          # Asynchronous submission
	'polljob'       => \$params{'polljob'},        # Get results
	'resultTypes'   => \$params{'resultTypes'},    # Get result types
	'status'        => \$params{'status'},         # Get status
	'params'        => \$params{'params'},         # List input parameters
	'paramDetail=s' => \$params{'paramDetail'},    # Get details for parameter
	'quiet'         => \$params{'quiet'},          # Decrease output level
	'verbose'       => \$params{'verbose'},        # Increase output level
	'debugLevel=i'  => \$params{'debugLevel'},     # Debug output level
	'trace'         => \$params{'trace'},          # SOAP message debug
	'WSDL=s'        => \$WSDL,                     # WSDL URL for service
);
if ( $params{'verbose'} ) { $outputLevel++ }
if ( $params{'quiet'} )  { $outputLevel-- }

# Debug mode: XML::Compile::SOAP version
&print_debug_message( 'MAIN',
	'XML::Compile::SOAP::VERSION: ' . $XML::Compile::SOAP::VERSION, 1 );

# Debug mode: print the input parameters
&print_debug_message( 'MAIN', "params:\n" . Dumper( \%params ),           11 );
&print_debug_message( 'MAIN', "tool_params:\n" . Dumper( \%tool_params ), 11 );

# Get the script filename for use in usage messages
my $scriptName = basename( $0, () );

# Print usage and exit if requested
if ( $params{'help'} || $numOpts == 0 ) {
	&usage();
	exit(0);
}

# Debug mode: show the WSDL being used.
&print_debug_message( 'MAIN', 'WSDL: ' . $WSDL, 1 );

# Create service proxy for web service
&print_debug_message( 'MAIN', 'Create service proxy', 11 );
my $wsdlXml = XML::LibXML->new->parse_file($WSDL);
my $soapSrv = XML::Compile::WSDL11->new($wsdlXml);

# Compile service methods
&print_debug_message( 'MAIN', 'Compile operations from WSDL', 11 );
my (%soapOps);
foreach my $soapOp ( $soapSrv->operations ) {

	# XML::Compile::SOAP 2.x
	if ( $XML::Compile::SOAP::VERSION > 1.99 ) {
		&print_debug_message( 'MAIN', 'Operation: ' . $soapOp->name, 12 );

		# Allow nil elements to be skipped (needed for submission)
		$soapOps{ $soapOp->name } = $soapSrv->compileClient( $soapOp->name,
			interpret_nillable_as_optional => 1 );
	}

	# XML::Compile::SOAP 0.7x
	else {
		&print_debug_message( 'MAIN', 'Operation: ' . $soapOp->{operation},
			12 );
		$soapOps{ $soapOp->{operation} } =
		  $soapSrv->compileClient( $soapOp->{operation},
			interpret_nillable_as_optional => 1 );
	}
}

if (
	!(
		   $params{'polljob'}
		|| $params{'resultTypes'}
		|| $params{'status'}
		|| $params{'params'}
		|| $params{'paramDetail'}
	)
	&& !( defined( $ARGV[0] ) || defined( $params{'sequence'} ) )
  )
{

	# Bad argument combination, so print error message and usage
	print STDERR 'Error: bad option combination', "\n";
	&usage();
	exit(1);
}

# Get parameters list
elsif ( $params{'params'} ) {
	&print_tool_params();
}

# Get parameter details
elsif ( $params{'paramDetail'} ) {
	&print_param_details( $params{'paramDetail'} );
}

# Job status
elsif ( $params{'status'} && defined( $params{'jobid'} ) ) {
	&print_job_status( $params{'jobid'} );
}

# Result types
elsif ( $params{'resultTypes'} && defined( $params{'jobid'} ) ) {
	&print_result_types( $params{'jobid'} );
}

# Poll job and get results
elsif ( $params{'polljob'} && defined( $params{'jobid'} ) ) {
	&get_results( $params{'jobid'} );
}

# Submit a job
else {
	# Multiple input sequence mode, assume fasta format.
	if ( $params{'multifasta'} ) {
		&multi_submit_job();
	}

	# Entry identifier list file.
	elsif (( defined( $params{'sequence'} ) && $params{'sequence'} =~ m/^\@/ )
		|| ( defined( $ARGV[0] ) && $ARGV[0] =~ m/^\@/ ) )
	{
		my $list_filename = $params{'sequence'} || $ARGV[0];
		$list_filename =~ s/^\@//;
		&list_file_submit_job($list_filename);
	}

	# Default: single sequence/identifier.
	else {

		# Load the sequence data and submit.
		&submit_job( &load_data() );
	}
}

=head1 FUNCTIONS

=cut

### Wrappers for SOAP operations ###

=head2 soap_request()

Generic wrapper for SOAP requests.

If SOAP trace ($params{'trace'}) is enabled the details of the SOAP messages 
exchanged will be output using &print_soap_trace().

  my $response = soap_request($service_method, \%method_params);

=cut

sub soap_request {
	&print_debug_message( 'soap_request', 'Begin', 11 );
	my $service_method = shift;    # Method name
	my $service_params = shift;    # Method parameters
	&print_debug_message( 'soap_request', 'service_method: ' . $service_method,
		12 );
	&print_debug_message( 'soap_request',
		'service_params: ' . Dumper($service_params), 21 );

	# Call the method
	my ( $response, $trace ) =
	  $soapOps{$service_method}->( 'parameters' => $service_params );
	if ( $params{'trace'} ) {
		&print_soap_trace($trace);
	}                              # SOAP message trace
	if ( $response->{'Fault'} ) {  # Check for server/SOAP fault
		die "Server fault: " . $response->{'Fault'}->{'faultstring'};
	}
	&print_debug_message( 'soap_request', 'response: ' . Dumper($response),
		21 );
	&print_debug_message( 'soap_request', 'End', 11 );
	return $response;
}

=head2 print_soap_trace()

Print SOAP request/response trace obtained when making a service request.

  &print_soap_trace($trace);

=cut

sub print_soap_trace {
	&print_debug_message( 'print_soap_trace', 'Begin', 11 );
	my $trace = shift;
	$trace->printTimings;
	$trace->printRequest;
	$trace->printResponse;
	&print_debug_message( 'print_soap_trace', 'End', 11 );
}

=head2 soap_get_parameters()

Get a list of tool parameter names.

  my (@param_name_list) = &soap_get_parameters();

=cut

sub soap_get_parameters {
	&print_debug_message( 'soap_get_parameters', 'Begin', 1 );
	my $response = &soap_request( 'getParameters', {} );
	my $paramNameListRef = $response->{'parameters'}->{'parameters'}->{'id'};
	die "Error: undefined parameter name list returned by service"
	  if ( !defined($paramNameListRef) );
	&print_debug_message( 'soap_get_parameters', 'End', 1 );
	return @$paramNameListRef;
}

=head2 soap_get_parameter_details();

Get detailed information about a tool parameter. Includes a description 
suitable for use in user help, and details of valid values. 

  my $param_detail = &soap_get_parameter_details($param_name);

=cut

sub soap_get_parameter_details {
	&print_debug_message( 'soap_get_parameter_details', 'Begin', 1 );
	my $parameterId = shift;
	&print_debug_message( 'soap_get_parameter_details',
		'parameterId: ' . $parameterId, 1 );
	my $response =
	  &soap_request( 'getParameterDetails', { 'parameterId' => $parameterId } );
	my $paramDetail = $response->{'parameters'}->{'parameterDetails'};
	die "Error: undefined parameter details returned by service"
	  if ( !defined($paramDetail) );
	&print_debug_message( 'soap_get_parameter_details', 'End', 1 );
	return $paramDetail;
}

=head2 soap_run()

Submit a job to the service.

  my $job_id = &soap_run($email, $title, \%params);

=cut

sub soap_run {
	&print_debug_message( 'soap_run', 'Begin', 1 );
	my $email     = shift;
	my $title     = shift;
	my $paramsRef = shift;
	&print_debug_message( 'soap_run', 'email: ' . $email, 1 );
	if ( defined($title) ) {
		&print_debug_message( 'soap_run', 'title: ' . $title, 1 );
	}
	my %params = %{$paramsRef};

	# Set NIL for empty elements.
	foreach my $paramName ( keys(%params) ) {
		if ( !defined( $params{$paramName} ) ) {
			$params{$paramName} = 'NIL';
		}
	}
	my $response = &soap_request(
		'run',
		{
			'email'      => $email,
			'title'      => $title,
			'parameters' => \%params
		}
	);
	my $job_id = $response->{'parameters'}->{'jobId'};
	die "Error: undefined job identifier returned by service."
	  if ( !defined($job_id) );
	&print_debug_message( 'soap_run', 'End', 1 );
	return $job_id;
}

=head2 soap_get_status()

Get the status of a submitted job.

  my $status = &soap_get_status($job_id);

=cut

sub soap_get_status {
	&print_debug_message( 'soap_get_status', 'Begin', 1 );
	my $jobid = shift;
	&print_debug_message( 'soap_get_status', 'jobid: ' . $jobid, 2 );
	my $response = &soap_request( 'getStatus', { 'jobId' => $jobid } );
	my $status_str = $response->{'parameters'}->{'status'};
	die "Error: undefined job status returned by service."
	  if ( !defined($status_str) );
	&print_debug_message( 'soap_get_status', 'status_str: ' . $status_str, 2 );
	&print_debug_message( 'soap_get_status', 'End', 1 );
	return $status_str;
}

=head2 soap_get_result_types()

Get list of available result types for a finished job.

  my (@result_types) = soap_get_result_types($job_id);

=cut

sub soap_get_result_types {
	&print_debug_message( 'soap_get_result_types', 'Begin', 1 );
	my $jobid = shift;
	&print_debug_message( 'soap_get_result_types', 'jobid: ' . $jobid, 2 );
	my $response = &soap_request( 'getResultTypes', { 'jobId' => $jobid } );
	my $resultTypes = $response->{'parameters'}->{'resultTypes'}->{'type'};
	die "Error: undefined result type list returned by service."
	  if ( !defined($resultTypes) );
	&print_debug_message( 'soap_get_result_types',
		scalar(@$resultTypes) . ' result types', 2 );
	&print_debug_message( 'soap_get_result_types', 'End', 1 );
	return (@$resultTypes);
}

=head2 soap_get_result()

Get result data of a specified type for a finished job.

  my $result = &soap_get_result($job_id, $result_type);

=cut

sub soap_get_result {
	&print_debug_message( 'soap_get_result', 'Begin', 1 );
	my $jobid = shift;
	my $type  = shift;
	&print_debug_message( 'soap_get_result', 'jobid: ' . $jobid, 1 );
	&print_debug_message( 'soap_get_result', 'type: ' . $type,   1 );
	my $response = &soap_request(
		'getResult',
		{
			'jobId'      => $jobid,
			'type'       => $type,
			'parameters' => 'NIL'
		}
	);
	my $result = $response->{'parameters'}->{'output'};
	die "Error: undefined result returned by service." if ( !defined($result) );
	&print_debug_message( 'soap_get_result', length($result) . ' characters',
		1 );
	&print_debug_message( 'soap_get_result', 'End', 1 );
	return $result;
}

### Service actions and utility functions ###

=head2 print_debug_message()

Print a debug message at the specified debug level.

  &print_debug_message($function_name, $message, $level);

=cut

sub print_debug_message {
	my $function_name = shift;
	my $message       = shift;
	my $level         = shift;
	if ( $level <= $params{'debugLevel'} ) {
		print STDERR '[', $function_name, '()] ', $message, "\n";
	}
}

=head2 print_tool_params()

Print the list of tool parameter names.

  &print_tool_params();

=cut

sub print_tool_params {
	&print_debug_message( 'print_tool_params', 'Begin', 1 );
	my (@paramList) = &soap_get_parameters();
	foreach my $param (@paramList) {
		print $param, "\n";
	}
	&print_debug_message( 'print_tool_params', 'End', 1 );
}

=head2 print_param_details()

Print detail information about a tool parameter.

  &print_param_details($param_name);

=cut

sub print_param_details {
	&print_debug_message( 'print_param_details', 'Begin', 1 );
	my $paramName = shift;
	&print_debug_message( 'print_param_details', 'paramName: ' . $paramName,
		2 );
	my $paramDetail = &soap_get_parameter_details($paramName);
	&print_debug_message( 'print_param_details',
		"paramDetail:\n" . Dumper($paramDetail), 3 );
	print $paramDetail->{'name'}, "\t", $paramDetail->{'type'}, "\n";
	print $paramDetail->{'description'}, "\n";
	foreach my $value ( @{ $paramDetail->{'values'}->{'value'} } ) {
		print $value->{'value'};
		if (   $value->{'defaultValue'} eq 'true'
			|| $value->{'defaultValue'} == 1 )
		{
			print "\t", 'default';
		}
		print "\n";
		print "\t", $value->{'label'}, "\n";
		if(defined($value->{'properties'})) {
			foreach my $wsProperty (@{$value->{'properties'}{'property'}}) {
				print "\t", $wsProperty->{'key'}, "\t", $wsProperty->{'value'}, "\n";
			}
		}
	}
	&print_debug_message( 'print_param_details', 'End', 1 );
}

=head2  print_job_status()

Print the status of a submitted job.

  &print_job_status($job_id);

=cut

sub print_job_status {
	&print_debug_message( 'print_job_status', 'Begin', 1 );
	my $jobid = shift;
	&print_debug_message( 'print_job_status', 'jobid: ' . $jobid, 1 );
	if ( $outputLevel > 0 ) {
		print STDERR 'Getting status for job ', $jobid, "\n";
	}
	my $result = &soap_get_status($jobid);
	print "$result\n";
	if ( $result eq 'FINISHED' && $outputLevel > 0 ) {
		print STDERR "To get results: $scriptName --polljob --jobid " . $jobid
		  . "\n";
	}
	&print_debug_message( 'print_job_status', 'End', 1 );
}

=head2 print_result_types()

Print available result types for a finished job.

  &print_result_types($job_id);

=cut

sub print_result_types {
	&print_debug_message( 'print_result_types', 'Begin', 1 );
	my $jobid = shift;
	&print_debug_message( 'print_result_types', 'jobid: ' . $jobid, 1 );
	if ( $outputLevel > 0 ) {
		print STDERR 'Getting result types for job ', $jobid, "\n";
	}
	my $status = &soap_get_status($jobid);
	if ( $status eq 'PENDING' || $status eq 'RUNNING' ) {
		print STDERR 'Error: Job status is ', $status,
		  '. To get result types the job must be finished.', "\n";
	}
	else {
		my (@resultTypes) = &soap_get_result_types($jobid);
		if ( $outputLevel > 0 ) {
			print STDOUT 'Available result types:', "\n";
		}
		foreach my $resultType (@resultTypes) {
			print STDOUT $resultType->{'identifier'}, "\n";
			if ( defined( $resultType->{'label'} ) ) {
				print STDOUT "\t", $resultType->{'label'}, "\n";
			}
			if ( defined( $resultType->{'description'} ) ) {
				print STDOUT "\t", $resultType->{'description'}, "\n";
			}
			if ( defined( $resultType->{'mediaType'} ) ) {
				print STDOUT "\t", $resultType->{'mediaType'}, "\n";
			}
			if ( defined( $resultType->{'fileSuffix'} ) ) {
				print STDOUT "\t", $resultType->{'fileSuffix'}, "\n";
			}
		}
		if ( $status eq 'FINISHED' && $outputLevel > 0 ) {
			print STDERR "\n", 'To get results:', "\n",
			  "  $scriptName --polljob --jobid " . $params{'jobid'} . "\n",
			  "  $scriptName --polljob --outformat <type> --jobid "
			  . $params{'jobid'} . "\n";
		}
	}
	&print_debug_message( 'print_result_types', 'End', 1 );
}

=head2 submit_job()

Submit a job to the service.

  &submit_job($seq);

=cut

sub submit_job {
	&print_debug_message( 'submit_job', 'Begin', 1 );

	# Set input sequence
	$tool_params{'sequence'} = shift;

	# Load parameters
	&load_params();

	# Submit the job
	my $jobid = &soap_run( $params{'email'}, $params{'title'}, \%tool_params );

	# Simulate sync/async mode
	if ( defined( $params{'async'} ) ) {
		print STDOUT $jobid, "\n";
		if ( $outputLevel > 0 ) {
			print STDERR
			  "To check status: $scriptName --status --jobid $jobid\n";
		}
	}
	else {
		if ( $outputLevel > 0 ) {
			print STDERR "JobId: $jobid\n";
		}
		sleep 1;
		&get_results($jobid);
	}
	&print_debug_message( 'submit_job', 'End', 1 );
}

=head2 multi_submit_job()

Submit multiple jobs assuming input is a collection of fasta formatted sequences.

  &multi_submit_job();

=cut

sub multi_submit_job {
	print_debug_message( 'multi_submit_job', 'Begin', 1 );
	my $jobIdForFilename = 1;
	$jobIdForFilename = 0 if ( defined( $params{'outfile'} ) );
	my (@filename_list) = ();

	# Query sequence
	if ( defined( $ARGV[0] ) ) {    # Bare option
		if ( -f $ARGV[0] || $ARGV[0] eq '-' ) {    # File
			push( @filename_list, $ARGV[0] );
		}
	}
	if ( $params{'sequence'} ) {                   # Via --sequence
		if ( -f $params{'sequence'} || $params{'sequence'} eq '-' ) {    # File
			push( @filename_list, $params{'sequence'} );
		}
	}

	$/ = '>';
	foreach my $filename (@filename_list) {
		open( my $INFILE, '<', $filename )
		  or die "Error: unable to open file $filename ($!)";
		while (<$INFILE>) {
			my $seq = $_;
			$seq =~ s/>$//;
			if ( $seq =~ m/\w+/ ) {
				$seq = '>' . $seq;
				&print_debug_message( 'multi_submit_job', $seq, 11 );
				&submit_job($seq);
				$params{'outfile'} = undef if ( $jobIdForFilename == 1 );
			}
		}
		close $INFILE;
	}
	print_debug_message( 'multi_submit_job', 'End', 1 );
}

=head2 list_file_submit_job()

Submit multiple jobs using a file containing a list of entry identifiers as 
input.

  &list_file_submit_job($list_filename)

=cut

sub list_file_submit_job {
	my $filename         = shift;
	my $jobIdForFilename = 1;
	$jobIdForFilename = 0 if ( defined( $params{'outfile'} ) );

	# Iterate over identifiers, submitting each job
	open( my $LISTFILE, '<', $filename )
	  or die 'Error: unable to open file ' . $filename . ' (' . $! . ')';
	while (<$LISTFILE>) {
		my $line = $_;
		chomp($line);
		if ( $line ne '' ) {
			&print_debug_message( 'list_file_submit_job', 'line: ' . $line, 2 );
			if ( $line =~ m/\w:\w/ ) {    # Check this is an identifier
				print STDERR "Submitting job for: $line\n"
				  if ( $outputLevel > 0 );
				&submit_job($line);
			}
			else {
				print STDERR
"Warning: line \"$line\" is not recognised as an identifier\n";
			}
		}
		$params{'outfile'} = undef if ( $jobIdForFilename == 1 );
	}
	close $LISTFILE;
}

=head2 load_data()

Load sequence data, from file or direct specification of input data with 
command-line option.

  my $data = load_data();

=cut

sub load_data {
	&print_debug_message( 'load_data', 'Begin', 1 );
	my $retSeq;

	# Query sequence
	if ( defined( $ARGV[0] ) ) {    # Bare option
		if ( -f $ARGV[0] || $ARGV[0] eq '-' ) {    # File
			$retSeq = &read_file( $ARGV[0] );
		}
		else {                                     # DB:ID or sequence
			$retSeq = $ARGV[0];
		}
	}
	if ( $params{'sequence'} ) {                   # Via --sequence
		if ( -f $params{'sequence'} || $params{'sequence'} eq '-' ) {    # File
			$retSeq = &read_file( $params{'sequence'} );
		}
		else {    # DB:ID or sequence
			$retSeq = $params{'sequence'};
		}
	}
	&print_debug_message( 'load_data', 'End', 1 );
	return $retSeq;
}

=head2 load_params()

Load job parameters into input structure.

Since most of the loading is done when processing the command-line options, 
this function only provides additional processing required from some options.

  &load_params();

=cut

sub load_params {
	&print_debug_message( 'load_params', 'Begin', 1 );

	# Compatability options, old command-line
	# --app vs. --appl
	if ( !defined( $params{'appl'} ) && defined( $params{'app'} ) ) {
		$params{'appl'} = $params{'app'};
	}

	# --crc vs. --nocrc (ignored)

	# --goterms vs. --nogoterms
	if ( $params{'nogoterms'} ) {
		$tool_params{'goterms'} = 'false';
	}
	elsif ( $params{'goterms'} ) {
		$tool_params{'goterms'} = 'true';
	}
	
	# --pathways vs. --nopathways
	if ( $params{'nopathways'} ) {
		$tool_params{'pathways'} = 'false';
	}
	elsif ( $params{'pathways'} ) {
		$tool_params{'pathways'} = 'true';
	}

	# Signature methods to use.
	if ( defined( $params{'appl'} ) ) {
		my (@applList) = split /[ ,]/, $params{'appl'};
		$tool_params{'appl'}{'string'} = \@applList;
	}
	else { # XML::Compile::SOAP 0.78 needs empty list
		$tool_params{'appl'} = {};
	}
	&print_debug_message( 'load_params',
		"tool_params:\n" . Dumper( \%tool_params ), 2 );
	&print_debug_message( 'load_params', 'End', 1 );
}

=head2 client_poll()

Client-side job polling.

  my $status = &client_poll($job_id);

=cut

sub client_poll {
	&print_debug_message( 'client_poll', 'Begin', 1 );
	my $jobid  = shift;
	my $status = 'PENDING';

	# Check status and wait if not finished. If 'ERROR' status is obtained
	# three times terminate.
	my $errorCount = 0;
	while ($status eq 'RUNNING'
		|| $status eq 'PENDING'
		|| ( $status eq 'ERROR' && $errorCount < 2 ) )
	{
		$status = soap_get_status($jobid);
		print STDERR "$status\n" if ( $outputLevel > 0 );
		if ( $status eq 'ERROR' ) {
			$errorCount++;
		}
		elsif ( $errorCount > 0 ) {
			$errorCount--;
		}
		if (   $status eq 'RUNNING'
			|| $status eq 'PENDING'
			|| $status eq 'ERROR' )
		{

			# Wait before polling again.
			sleep $checkInterval;
		}
	}
	&print_debug_message( 'client_poll', 'End', 1 );
	return $status;
}

=head2 get_results()

Get the results for a jobid.

  &get_results($job_id);

=cut

sub get_results {
	&print_debug_message( 'get_results', 'Begin', 1 );
	my $jobid = shift;
	&print_debug_message( 'get_results', 'jobid: ' . $jobid, 1 );

	# Verbose
	if ( $outputLevel > 1 ) {
		print 'Getting results for job ', $jobid, "\n";
	}

	# Check status, and wait if not finished
	client_poll($jobid);

	# Use JobId if output file name is not defined
	unless ( defined( $params{'outfile'} ) ) {
		$params{'outfile'} = $jobid;
	}

	# Get list of data types
	my (@resultTypes) = soap_get_result_types($jobid);

	# Get the data and write it to a file
	if ( defined( $params{'outformat'} ) ) {    # Specified data type
		my $selResultType;
		foreach my $resultType (@resultTypes) {
			if ( $resultType->{'identifier'} eq $params{'outformat'} ) {
				$selResultType = $resultType;
			}
		}
		if ( defined($selResultType) ) {
			my $result =
			  soap_get_result( $jobid, $selResultType->{'identifier'} );
			if ( $params{'outfile'} eq '-' ) {
				write_file( $params{'outfile'}, $result );
			}
			else {
				write_file(
					$params{'outfile'} . '.'
					  . $selResultType->{'identifier'} . '.'
					  . $selResultType->{'fileSuffix'},
					$result
				);
			}
		}
		else {
			die 'Error: unknown result format "' . $params{'outformat'} . '"';
		}
	}
	else {    # Data types available
		      # Write a file for each output type
		for my $resultType (@resultTypes) {
			if ( $outputLevel > 1 ) {
				print STDERR 'Getting ', $resultType->{'identifier'}, "\n";
			}
			my $result = soap_get_result( $jobid, $resultType->{'identifier'} );
			if ( $params{'outfile'} eq '-' ) {
				write_file( $params{'outfile'}, $result );
			}
			else {
				write_file(
					$params{'outfile'} . '.'
					  . $resultType->{'identifier'} . '.'
					  . $resultType->{'fileSuffix'},
					$result
				);
			}
		}
	}
	&print_debug_message( 'get_results', 'End', 1 );
}

=head2 read_file()

Read all data from a file. The special filename '-' can be used to read from 
standard input.

  my $data = &read_file($filename);

=cut

sub read_file {
	&print_debug_message( 'read_file', 'Begin', 1 );
	my $filename = shift;
	my ( $content, $buffer );
	if ( $filename eq '-' ) {
		while ( sysread( STDIN, $buffer, 1024 ) ) {
			$content .= $buffer;
		}
	}
	else {    # File
		open( my $FILE, '<', $filename )
		  or die "Error: unable to open input file $filename ($!)";
		while ( sysread( $FILE, $buffer, 1024 ) ) {
			$content .= $buffer;
		}
		close($FILE);
	}
	&print_debug_message( 'read_file', 'End', 1 );
	return $content;
}

=head2 write_file()

Write data to a file. The special filename '-' can be used to write to 
standard output.

  &write_file($filename, $data);

=cut

sub write_file {
	&print_debug_message( 'write_file', 'Begin', 1 );
	my ( $filename, $data ) = @_;
	if ( $outputLevel > 0 ) {
		print STDERR 'Creating result file: ' . $filename . "\n";
	}
	if ( $filename eq '-' ) {
		print STDOUT $data;
	}
	else {
		open( my $FILE, '>', $filename )
		  or die "Error: unable to open output file $filename ($!)";
		syswrite( $FILE, $data );
		close($FILE);
	}
	&print_debug_message( 'write_file', 'End', 1 );
}

=head2 usage()

Print program usage.

  &usage();

=cut

sub usage {
	print STDERR <<EOF
InterProScan 5
==============

Identify protein family, domain and signal signatures in a protein sequence.

For more information on InterProScan refer to 
http://www.ebi.ac.uk/Tools/pfa/iprscan5

[Required]

  seqFile            : file : query sequence ("-" for STDIN, \@filename for
                              identifier list file)

[Optional]

      --appl         : str  : Comma separated list of signature methods to run,
                              see --paramDetail appl. 
      --goterms      :      : retrieve GO terms
      --nogoterms    :      : do not retrieve GO terms
      --pathways     :      : retrieve pathway terms
      --nopathways   :      : do not retrieve pathway terms
      --multifasta   :      : treat input as a set of fasta formatted sequences
 
[General]

  -h, --help        :      : prints this help text
      --async       :      : forces to make an asynchronous query
      --email	    : str  : e-mail address
      --title       : str  : title for job
      --status      :      : get job status
      --resultTypes :      : get available result types for job
      --polljob     :      : poll for the status of a job
      --jobid       : str  : jobid that was returned when an asynchronous job 
                             was submitted.
      --outfile     : str  : file name for results (default is jobid;
                             "-" for STDOUT)
      --outformat   : str  : result format to retrieve
      --params      :      : list input parameters
      --paramDetail : str  : display details for input parameter
      --quiet       :      : decrease output
      --verbose     :      : increase output
      --trace	    :      : show SOAP messages being interchanged 
   
Synchronous job:

  The results/errors are returned as soon as the job is finished.
  Usage: $scriptName --email <your\@email> [options...] seqFile
  Returns: results as an attachment

Asynchronous job:

  Use this if you want to retrieve the results at a later time. The results 
  are stored for up to 24 hours. 	
  Usage: $scriptName --async --email <your\@email> [options...] seqFile
  Returns: jobid

  Use the jobid to query for the status of the job. If the job is finished, 
  it also returns the results/errors.
  Usage: $scriptName --polljob --jobid <jobId> [--outfile string]
  Returns: string indicating the status of the job and if applicable, results 
  as an attachment.

Further information:

  http://www.ebi.ac.uk/Tools/webservices/services/pfa/iprscan5_soap
  http://www.ebi.ac.uk/Tools/webservices/tutorials/perl

Support/Feedback:

  http://www.ebi.ac.uk/support/
EOF
}

=head1 FEEDBACK/SUPPORT

Please contact us at L<http://www.ebi.ac.uk/support/> if you have any 
feedback, suggestions or issues with the service or this client.

=cut
