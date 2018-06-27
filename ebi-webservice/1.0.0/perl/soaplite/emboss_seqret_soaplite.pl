#!/usr/bin/env perl

=head1 NAME

emboss_seqret_soaplite.pl

=head1 DESCRIPTION

EMBOSS seqret (SOAP) web service Perl client using L<SOAP::Lite>.

Tested with:

=over

=item *
L<SOAP::Lite> 0.60 and Perl 5.8.3

=item *
L<SOAP::Lite> 0.69 and Perl 5.8.8 (Ubuntu 8.04 LTS)

=item *
L<SOAP::Lite> 0.710.10 and Perl 5.10.1 (Ubuntu 10.04 LTS)

=item *
L<SOAP::Lite> 0.714 and Perl 5.14.2 (Ubuntu 12.04 LTS)

=back

For further information see:

=over

=item *
L<http://www.ebi.ac.uk/Tools/webservices/services/sfc/emboss_seqret_soap>

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
use English;
use SOAP::Lite;
use LWP;
use Getopt::Long qw(:config no_ignore_case bundling);
use File::Basename;
use MIME::Base64;
use Data::Dumper;

# Maximum connection retries.
use constant MAX_RETRIES => 3;

# WSDL URL for service
my $WSDL = 'http://www.ebi.ac.uk/Tools/services/soap/emboss_seqret?wsdl';

# Set interval for checking status
my $checkInterval = 3;

# Output level
my $outputLevel = 1;

# Process command-line options
my $numOpts = scalar(@ARGV);
my %params = ( 
	'debugLevel' => 0, 
	'maxJobs'    => 1
);

# Default parameter values (should get these from the service)
my %tool_params = ();
GetOptions(

	# Tool specific options
	'stype=s'        => \$tool_params{'stype'}, # Sequence type.
	'inputformat=s'  => \$tool_params{'inputformat'}, # Input data format.  
	'outputformat=s' => \$tool_params{'outputformat'}, # Output data format.  
	'feature'        => \$params{'feature'}, # Use feature info.
	'nofeature'      => \$params{'nofeature'}, # Don't use feature info.
	'firstonly'      => \$params{'firstonly'}, # Process first sequence only.
	'nofirstonly'    => \$params{'nofirstonly'}, # Process all sequences.
	'reverse'        => \$params{'reverse'}, # Reverse-complement nucleotide sequence.
	'noreverse'      => \$params{'noreverse'}, # Don't reverse-complement sequence.
	'outputcase=s'   => \$tool_params{'outputcase'}, # Case of output sequence.
	'sequence=s'     => \$params{'sequence'},        # Input sequence data.
	'multifasta'     => \$params{'multifasta'}, # Multiple fasta sequence input.
	
	# Generic options
	'email=s'       => \$params{'email'},          # User e-mail address
	'title=s'       => \$params{'title'},          # Job title
	'outfile=s'     => \$params{'outfile'},        # Output file name
	'useSeqId'      => \$params{'useSeqId'},       # Seq Id file name
	'maxJobs=i'     => \$params{'maxJobs'},        # Max. parallel jobs
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
	'endpoint=s'    => \$params{'endpoint'},       # SOAP service endpoint
	'namespace=s'   => \$params{'namespace'},      # SOAP service namespace
	'WSDL=s'        => \$WSDL,                     # SOAP service WSDL
);
if ( $params{'verbose'} ) { $outputLevel++ }
if ( $params{'quiet'} )  { $outputLevel-- }

# Debug mode: SOAP::Lite version
&print_debug_message( 'MAIN', 'SOAP::Lite::VERSION: ' . $SOAP::Lite::VERSION,
	1 );

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

# If required enable SOAP message trace
if ( $params{'trace'} ) {
	print STDERR "Tracing active\n";
	SOAP::Lite->import( +trace => 'debug' );
}

# Debug mode: show the WSDL, service endpoint and namespace being used.
&print_debug_message( 'MAIN', 'WSDL: ' . $WSDL, 1 );

# For a document/literal service which has types with repeating elements
# namespace and endpoint need to be used instead of the WSDL. By default
# these are extracted from the WSDL.
my ( $serviceEndpoint, $serviceNamespace ) = &from_wsdl($WSDL);

# User specified endpoint and namespace
$serviceEndpoint  = $params{'endpoint'}  if ( $params{'endpoint'} );
$serviceNamespace = $params{'namespace'} if ( $params{'namespace'} );

# Debug mode: show the WSDL, service endpoint and namespace being used.
&print_debug_message( 'MAIN', 'endpoint: ' . $serviceEndpoint,   11 );
&print_debug_message( 'MAIN', 'namespace: ' . $serviceNamespace, 11 );

# Create the service interface, setting the fault handler to throw exceptions
my $soap = SOAP::Lite->proxy(
	$serviceEndpoint,
	timeout => 6000,    # HTTP connection timeout
	#proxy => ['http' => 'http://your.proxy.server/'], # HTTP proxy
	options => {
		# HTTP compression (requires Compress::Zlib)
		compress_threshold => 100000000, # Prevent request compression.
	},
  )->uri($serviceNamespace)->on_fault(

	# Map SOAP faults to Perl exceptions (i.e. die).
	sub {
		my $soap = shift;
		my $res  = shift;
		if ( ref($res) eq '' ) {
			die($res);
		}
		else {
			die( $res->faultstring );
		}
		return new SOAP::SOM;
	}
  );
# Modify the user-agent to add a more specific prefix (see RFC2616 section 14.43)
$soap->transport->agent(&get_agent_string() . $soap->transport->agent());
&print_debug_message( 'MAIN', 'user-agent: ' . $soap->transport->agent(), 11 );

# Check that arguments include required parameters
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

		# Warn for invalid batch only option use.
		if ( $params{'useSeqId'} ) {
			print STDERR "Warning: --useSeqId option ignored.\n";
			delete $params{'useSeqId'};
		}
		if ( $params{'maxJobs'} != 1 ) {
			print STDERR "Warning: --maxJobs option ignored.\n";
			$params{'maxJobs'} = 1;
		}

		# Load the sequence data and submit.
		&submit_job( &load_data() );
	}
}

=head1 FUNCTIONS

=cut

=head2 get_agent_string()

Get the user agent string for the client.

  my $agent_str = &get_agent_string();

=cut

sub get_agent_string {
	print_debug_message( 'get_agent_string', 'Begin', 11 );
	my $clientVersion = '0';
	if('$Revision$' =~ m/(\d+)/) { # SCM revision tag.
		$clientVersion = $1;
	}
	my $agent_str = "EBI-Sample-Client/$clientVersion ($scriptName; $OSNAME) ";
	print_debug_message( 'get_agent_string', 'End', 11 );
	return 	$agent_str;
}

### Wrappers for SOAP operations ###

=head2 soap_get_parameters()

Get a list of tool parameter names.

  my (@param_name_list) = &soap_get_parameters();

=cut

sub soap_get_parameters {
	print_debug_message( 'soap_get_parameters', 'Begin', 1 );
	my $ret = $soap->getParameters();
	print_debug_message( 'soap_get_parameters', 'End', 1 );
	return $ret->valueof('//parameters/id');
}

=head2 soap_get_parameter_details();

Get detailed information about a tool parameter. Includes a description 
suitable for use in user help, and details of valid values. 

  my $paramDetail = &soap_get_parameter_details($paramName);

=cut

sub soap_get_parameter_details {
	print_debug_message( 'soap_get_parameter_details', 'Begin', 1 );
	my $parameterId = shift;
	print_debug_message( 'soap_get_parameter_details',
		'parameterId: ' . $parameterId, 1 );
	my $ret = $soap->getParameterDetails(
		SOAP::Data->name( 'parameterId' => $parameterId )
		  ->attr( { 'xmlns' => '' } ) );
	my $paramDetail = $ret->valueof('//parameterDetails');
	# Convert parameter values into a list.
	my (@paramValueList) = $ret->valueof('//parameterDetails/values/value');
	# Convert WsProperties for each value into a list.
	for(my $i = 0; $i < scalar(@paramValueList); $i++) {
		my (@propertyList) = $ret->valueof('//parameterDetails/values/[' . ($i + 1) . ']/properties/property');
		$paramValueList[$i]->{'properties'} = \@propertyList;
	}
	$paramDetail->{'values'} = \@paramValueList;
	print_debug_message( 'soap_get_parameter_details', 'End', 1 );
	return $paramDetail;
}

=head2 soap_run()

Submit a job to the service.

  my $job_id = &soap_run($email, $title, \%params);

=cut

sub soap_run {
	print_debug_message( 'soap_run', 'Begin', 1 );
	my $email  = shift;
	my $title  = shift;
	my $params = shift;
	$email = '' if(!$email);
	print_debug_message( 'soap_run', 'email: ' . $email, 1 );
	if ( defined($title) ) {
		print_debug_message( 'soap_run', 'title: ' . $title, 1 );
	}

	my (@paramsList) = ();
	foreach my $key ( keys(%$params) ) {
		if ( defined( $params->{$key} ) && $params->{$key} ne '' ) {
			push @paramsList,
			  SOAP::Data->name( $key => $params->{$key} )
			  ->attr( { 'xmlns' => '' } );
		}
	}
	my $ret = $soap->run(
		SOAP::Data->name( 'email' => $email )->attr( { 'xmlns' => '' } ),
		SOAP::Data->name( 'title' => $title )->attr( { 'xmlns' => '' } ),
		SOAP::Data->name( 'parameters' => \SOAP::Data->value(@paramsList) )
		  ->attr( { 'xmlns' => '' } )
	);
	print_debug_message( 'soap_run', 'End', 1 );
	return $ret->valueof('//jobId');
}

=head2 soap_get_status()

Get the status of a submitted job.

  my $status = &soap_get_status($job_id);

=cut

sub soap_get_status {
	print_debug_message( 'soap_get_status', 'Begin', 1 );
	my $jobid = shift;
	print_debug_message( 'soap_get_status', 'jobid: ' . $jobid, 2 );
	my $res = $soap->getStatus(
		SOAP::Data->name( 'jobId' => $jobid )->attr( { 'xmlns' => '' } ) );
	my $status_str = $res->valueof('//status');
	print_debug_message( 'soap_get_status', 'status_str: ' . $status_str, 2 );
	print_debug_message( 'soap_get_status', 'End', 1 );
	return $status_str;
}

=head2 soap_get_result_types()

Get list of available result types for a finished job.

  my (@resultTypes) = soap_get_result_types($job_id);

=cut

sub soap_get_result_types {
	print_debug_message( 'soap_get_result_types', 'Begin', 1 );
	my $jobid = shift;
	print_debug_message( 'soap_get_result_types', 'jobid: ' . $jobid, 2 );
	my $resultTypesXml = $soap->getResultTypes(
		SOAP::Data->name( 'jobId' => $jobid )->attr( { 'xmlns' => '' } ) );
	my (@resultTypes) = $resultTypesXml->valueof('//resultTypes/type');
	print_debug_message( 'soap_get_result_types',
		scalar(@resultTypes) . ' result types', 2 );
	print_debug_message( 'soap_get_result_types', 'End', 1 );
	return (@resultTypes);
}

=head2 soap_get_result()

Get result data of a specified type for a finished job.

  my $result = &soap_get_result($job_id, $result_type);

=cut

sub soap_get_result {
	print_debug_message( 'soap_get_result', 'Begin', 1 );
	my $jobid = shift;
	my $type  = shift;
	print_debug_message( 'soap_get_result', 'jobid: ' . $jobid, 1 );
	print_debug_message( 'soap_get_result', 'type: ' . $type,   1 );
	my $res = $soap->getResult(
		SOAP::Data->name( 'jobId' => $jobid )->attr( { 'xmlns' => '' } ),
		SOAP::Data->name( 'type'  => $type )->attr(  { 'xmlns' => '' } )
	);
	my $result = decode_base64( $res->valueof('//output') );
	print_debug_message( 'soap_get_result', length($result) . ' characters',
		1 );
	print_debug_message( 'soap_get_result', 'End', 1 );
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

=head2 from_wsdl()

Extract the service namespace and endpoint from the service WSDL document 
for use when creating the service interface.

This function assumes that the WSDL contains a single service using a single
namespace and endpoint.

The namespace and endpoint are required to create a service interface, using 
SOAP::Lite->proxy(), that supports repeating elements (maxOcurrs > 1) as used 
in many document/literal services. Using SOAP::Lite->service() with the WSDL
gives an interface where the data structures returned by the service are 
mapped into hash structures and repeated elements are collapsed to a single
instance.

Note: rpc/encoded services are handled  as expected by SOAP::Lite->service() 
since repeating data structures are encoded using arrays by the service.  

  my ($serviceEndpoint, $serviceNamespace) = &from_wsdl($WSDL);

=cut

sub from_wsdl {
	&print_debug_message( 'from_wsdl', 'Begin', 1 );
	my (@retVal) = ();
	my $wsdlStr;
	my $fetchAttemptCount = 0;
	# Create a user agent
	my $ua = LWP::UserAgent->new();
	$ua->agent( &get_agent_string() . $ua->agent() ); # User-agent.
	$ua->env_proxy; # HTTP proxy.
	my $can_accept; # Available message encodings.
	eval {
	    $can_accept = HTTP::Message::decodable();
	};
	$can_accept = '' unless defined($can_accept);
	while(scalar(@retVal) != 2 && $fetchAttemptCount < MAX_RETRIES) {
		# Fetch WSDL document.
		my $response = $ua->get($WSDL, 
			'Accept-Encoding' => $can_accept, # HTTP compression.
		);
		if ( $params{'trace'} ) { # Request/response trace.
			print( $response->request()->as_string(), "\n" );
			print( $response->as_string(), "\n" );
		}
		# Unpack possibly compressed response.
		if ( defined($can_accept) && $can_accept ne '') {
	    	$wsdlStr = $response->decoded_content();
		}
		# If unable to decode use orginal content.
		$wsdlStr = $response->content() if (!defined($wsdlStr));
		$fetchAttemptCount++;
		if(defined($wsdlStr) && $wsdlStr ne '') {
			# Extract service endpoint.
			if ( $wsdlStr =~ m/<(\w+:)?address\s+location=["']([^'"]+)['"]/ ) {
				$retVal[0] = $2;
			}
			# Extract service namespace.
			if ( $wsdlStr =~
				m/<(\w+:)?definitions\s*[^>]*\s+targetNamespace=['"]([^"']+)["']/ )
			{
				$retVal[1] = $2;
			}
		}
	}
	# Check endpoint and namespace have been obtained.
	if(scalar(@retVal) != 2 || $retVal[0] eq '' || $retVal[1] eq '') {
		die "Error: Unable to determine service endpoint and namespace for requests.";
	}
	&print_debug_message( 'from_wsdl', 'End', 1 );
	return @retVal;
}

=head2 print_tool_params()

Print the list of tool parameter names.

  &print_tool_params();

=cut

sub print_tool_params {
	print_debug_message( 'print_tool_params', 'Begin', 1 );
	my (@paramList) = &soap_get_parameters();
	foreach my $param (@paramList) {
		print $param, "\n";
	}
	print_debug_message( 'print_tool_params', 'End', 1 );
}

=head2 print_param_details()

Print detail information about a tool parameter.

  &print_param_details($param_name);

=cut

sub print_param_details {
	print_debug_message( 'print_param_details', 'Begin', 1 );
	my $paramName = shift;
	print_debug_message( 'print_param_details', 'paramName: ' . $paramName, 2 );
	my $paramDetail = &soap_get_parameter_details($paramName);
	print $paramDetail->{'name'}, "\t", $paramDetail->{'type'}, "\n";
	print $paramDetail->{'description'}, "\n";
	foreach my $value ( @{ $paramDetail->{'values'} } ) {
		print $value->{'value'};
		if ( $value->{'defaultValue'} eq 'true' ) {
			print "\t", 'default';
		}
		print "\n";
		print "\t", $value->{'label'}, "\n";
		if(defined($value->{'properties'})) {
			foreach my $wsProperty (@{$value->{'properties'}}) {
				print "\t", $wsProperty->{'key'},
					"\t", $wsProperty->{'value'}, "\n";
			}
		}
	}
	print_debug_message( 'print_param_details', 'End', 1 );
}

=head2  print_job_status()

Print the status of a submitted job.

  &print_job_status($job_id);

=cut

sub print_job_status {
	print_debug_message( 'print_job_status', 'Begin', 1 );
	my $jobid = shift;
	print_debug_message( 'print_job_status', 'jobid: ' . $jobid, 1 );
	if ( $outputLevel > 0 ) {
		print STDERR 'Getting status for job ', $jobid, "\n";
	}
	my $status = &soap_get_status($jobid);
	print "$status\n";
	if ( $status eq 'FINISHED' && $outputLevel > 0 ) {
		print STDERR "To get available result types:\n",
		  "  $scriptName --resultTypes --jobid $jobid\n";
	}
	print_debug_message( 'print_job_status', 'End', 1 );
}

=head2 print_result_types()

Print available result types for a finished job.

  &print_result_types($job_id);

=cut

sub print_result_types {
	print_debug_message( 'print_result_types', 'Begin', 1 );
	my $jobid = shift;
	print_debug_message( 'print_result_types', 'jobid: ' . $jobid, 1 );
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
	print_debug_message( 'print_result_types', 'End', 1 );
}

=head2 submit_job()

Submit a job to the service.

  &submit_job($seq);

=cut

sub submit_job {
	print_debug_message( 'submit_job', 'Begin', 1 );

	# Set input sequence
	$tool_params{'sequence'} = shift;
	my $seq_id = shift;
	print_debug_message( 'submit_job', 'seq_id: ' . $seq_id, 1 ) if($seq_id);

	# Load parameters
	&load_params();

	# Submit the job
	my $jobid = &soap_run( $params{'email'}, $params{'title'}, \%tool_params );

	# Asychronus submission.
	if ( defined( $params{'async'} ) ) {
		print STDOUT $jobid, "\n";
		if ( $outputLevel > 0 ) {
			print STDERR
			  "To check status: $scriptName --status --jobid $jobid\n";
		}
	}

	# Parallel submission mode.
	elsif ( $params{'maxJobs'} > 1 ) {
		if ( $outputLevel > 0 ) {
			print STDERR "JobId: $jobid\n";
		}
		select( undef, undef, undef, 0.25 );    # 0.25 second sleep.
	}

	# Simulate synchronous submission serial mode.
	else {
		if ( $outputLevel > 0 ) {
			print STDERR "JobId: $jobid\n";
		}
		select( undef, undef, undef, 0.5 );     # 0.5 second sleep.
		# Check status, and wait if not finished
		&client_poll($jobid);

		# Get results.
		&get_results($jobid, $seq_id);
	}
	print_debug_message( 'submit_job', 'End', 1 );
	return $jobid;
}

=head2 multi_submit_job()

Submit multiple jobs assuming input is a collection of fasta formatted sequences.

  &multi_submit_job();

=cut

sub multi_submit_job {
	print_debug_message( 'multi_submit_job', 'Begin', 1 );
	my (@filename_list) = ();

	# Query/input sequence
	if ( defined( $ARGV[0] ) ) {    # Bare option
		if ( -f $ARGV[0] || $ARGV[0] eq '-' ) {    # File
			push( @filename_list, $ARGV[0] );
		}
		else {
			warn 'Warning: Input file "' . $ARGV[0] . '" does not exist';
		}
	}
	if ( $params{'sequence'} ) {                   # Via --sequence
		if ( -f $params{'sequence'} || $params{'sequence'} eq '-' ) {    # File
			push( @filename_list, $params{'sequence'} );
		}
		else {
			warn 'Warning: Input file "'
			  . $params{'sequence'}
			  . '" does not exist';
		}
	}

	# Job identifier tracking for parallel execution.
	my @jobid_list = ();
	my $job_number = 0;
	$/ = '>';
	foreach my $filename (@filename_list) {
		my $INFILE;
		if ( $filename eq '-' ) {    # STDIN.
			open( $INFILE, '<-' )
			  or die 'Error: unable to STDIN (' . $! . ')';
		}
		else {                       # File.
			open( $INFILE, '<', $filename )
			  or die 'Error: unable to open file '
			  . $filename . ' ('
			  . $! . ')';
		}
		while (<$INFILE>) {
			my $seq = $_;
			$seq =~ s/>$//;
			if ( $seq =~ m/(\S+)/ ) {
				my $seq_id = $1;
				print STDERR "Submitting job for: $seq_id\n"
				  if ( $outputLevel > 0 );
				$seq = '>' . $seq;
				&print_debug_message( 'multi_submit_job', $seq, 11 );
				$job_number++;
				my $job_id = &submit_job($seq, $seq_id);
				my $job_info_str =
				  sprintf( '%s %s %d %d', $job_id, $seq_id, 0, $job_number );
				push( @jobid_list, $job_info_str );
			}

			# Parallel mode, wait for job(s) to finish to free slots.
			while ( $params{'maxJobs'} > 1
				&& scalar(@jobid_list) >= $params{'maxJobs'} )
			{
				&_job_list_poll( \@jobid_list );
				print_debug_message( 'multi_submit_job',
					'Remaining jobs: ' . scalar(@jobid_list), 1 );
			}
		}
		close $INFILE;
	}

	# Parallel mode, wait for remaining jobs to finish.
	while ( $params{'maxJobs'} > 1 && scalar(@jobid_list) > 0 ) {
		&_job_list_poll( \@jobid_list );
		print_debug_message( 'multi_submit_job',
			'Remaining jobs: ' . scalar(@jobid_list), 1 );
	}
	print_debug_message( 'multi_submit_job', 'End', 1 );
}

=head2 _job_list_poll()

Poll the status of a list of jobs and fetch results for finished jobs.

  while(scalar(@jobid_list) > 0) {
    &_job_list_poll(\@jobid_list);
  }

=cut

sub _job_list_poll {
	print_debug_message( '_job_list_poll', 'Begin', 11 );
	my $jobid_list = shift;
	print_debug_message( '_job_list_poll', 'Num jobs: ' . scalar(@$jobid_list),
		12 );

	# Loop though job Id list polling job status.
	for ( my $jobNum = ( scalar(@$jobid_list) - 1 ) ; $jobNum > -1 ; $jobNum-- )
	{
		my ( $jobid, $seq_id, $error_count, $job_number ) =
		  split( /\s+/, $jobid_list->[$jobNum] );
		print_debug_message( '_job_list_poll', 'jobNum: ' . $jobNum, 12 );
		print_debug_message( '_job_list_poll',
			'Job info: ' . $jobid_list->[$jobNum], 12 );

		# Get job status.
		my $job_status = &soap_get_status($jobid);
		print_debug_message( '_job_list_poll', 'Status: ' . $job_status, 12 );

		# Fetch results and remove finished/failed jobs from list.
		if (
			!(
				   $job_status eq 'RUNNING'
				|| $job_status eq 'PENDING'
				|| (   $job_status eq 'ERROR'
					&& $error_count < MAX_RETRIES )
			)
		  )
		{
			if ( $job_status eq 'ERROR' || $job_status eq 'FAILED' ) {
				print STDERR
"Warning: job $jobid failed for sequence $job_number: $seq_id\n";
			}
			&get_results( $jobid, $seq_id );
			splice( @$jobid_list, $jobNum, 1 );
		}
		else {

			# Update error count, increment for new error or clear old errors.
			if ( $job_status eq 'ERROR' ) {
				$error_count++;
			}
			elsif ( $error_count > 0 ) {
				$error_count--;
			}

			# Update job tracking info.
			my $job_info_str = sprintf( '%s %s %d %d',
				$jobid, $seq_id, $error_count, $job_number );
			$jobid_list->[$jobNum] = $job_info_str;
		}
	}
	print_debug_message( '_job_list_poll', 'Num jobs: ' . scalar(@$jobid_list),
		12 );
	print_debug_message( '_job_list_poll', 'End', 11 );
}

=head2 list_file_submit_job()

Submit multiple jobs using a file containing a list of entry identifiers as 
input.

  &list_file_submit_job($list_filename)

=cut

sub list_file_submit_job {
	print_debug_message( 'list_file_submit_job', 'Begin', 1 );
	my $filename = shift;

	# Open the file of identifiers.
	my $LISTFILE;
	if ( $filename eq '-' ) {    # STDIN.
		open( $LISTFILE, '<-' )
		  or die 'Error: unable to STDIN (' . $! . ')';
	}
	else {                       # File.
		open( $LISTFILE, '<', $filename )
		  or die 'Error: unable to open file ' . $filename . ' (' . $! . ')';
	}

	# Job identifier tracking for parallel execution.
	my @jobid_list = ();
	my $job_number = 0;

	# Iterate over identifiers, submitting each job
	while (<$LISTFILE>) {
		my $line = $_;
		chomp($line);
		if ( $line ne '' ) {
			&print_debug_message( 'list_file_submit_job', 'line: ' . $line, 2 );
			if ( $line =~ m/\w:\w/ ) {    # Check this is an identifier
				my $seq_id = $line;
				print STDERR "Submitting job for: $seq_id\n"
				  if ( $outputLevel > 0 );
				$job_number++;
				my $job_id = &submit_job($seq_id, $seq_id);
				my $job_info_str =
				  sprintf( '%s %s %d %d', $job_id, $seq_id, 0, $job_number );
				push( @jobid_list, $job_info_str );
			}
			else {
				print STDERR
"Warning: line \"$line\" is not recognised as an identifier\n";
			}

			# Parallel mode, wait for job(s) to finish to free slots.
			while ( $params{'maxJobs'} > 1
				&& scalar(@jobid_list) >= $params{'maxJobs'} )
			{
				&_job_list_poll( \@jobid_list );
				print_debug_message( 'list_file_submit_job',
					'Remaining jobs: ' . scalar(@jobid_list), 1 );
			}
		}
	}
	close $LISTFILE;

	# Parallel mode, wait for remaining jobs to finish.
	while ( $params{'maxJobs'} > 1 && scalar(@jobid_list) > 0 ) {
		&_job_list_poll( \@jobid_list );
		print_debug_message( 'list_file_submit_job',
			'Remaining jobs: ' . scalar(@jobid_list), 1 );
	}
	print_debug_message( 'list_file_submit_job', 'End', 1 );
}

=head2 load_data()

Load sequence data, from file or direct specification of input data with 
command-line option.

  my $data = load_data();

=cut

sub load_data {
	print_debug_message( 'load_data', 'Begin', 1 );
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
	print_debug_message( 'load_data', 'End', 1 );
	return $retSeq;
}

=head2 load_params()

Load job parameters into input structure.

Since most of the loading is done when processing the command-line options, 
this function only provides additional processing required from some options.

  &load_params();

=cut

sub load_params {
	print_debug_message( 'load_params', 'Begin', 1 );
	
	# -firstonly: process only first sequence
	if ( $params{'firstonly'} ) {
		$tool_params{'firstonly'} = 1;
	}
	elsif ( $params{'nofirstonly'} ) {
		$tool_params{'firstonly'} = 0;
	}
	
	# -feature: use feature information
	if ( $params{'feature'} ) {
		$tool_params{'feature'} = 1;
	}
	elsif ( $params{'nofeature'} ) {
		$tool_params{'feature'} = 0;
	}
	
	# -reverse: reverse complement input sequence
	if ( $params{'reverse'} ) {
		$tool_params{'reverse'} = 1;
	}
	elsif ( $params{'noreverse'} ) {
		$tool_params{'reverse'} = 0;
	}
	
	print_debug_message( 'load_params',
		"tool_params:\n" . Dumper( \%tool_params ), 2 );
	print_debug_message( 'load_params', 'End', 1 );
}

=head2 client_poll()

Client-side job polling.

  my $status = &client_poll($job_id);

=cut

sub client_poll {
	print_debug_message( 'client_poll', 'Begin', 1 );
	my $jobid  = shift;
	my $status = 'PENDING';

	# Check status and wait if not finished. Terminate if MAX_RETRIES attempts get "ERROR".
	my $errorCount = 0;
	while ($status eq 'RUNNING'
		|| $status eq 'PENDING'
		|| ( $status eq 'ERROR' && $errorCount < MAX_RETRIES ) )
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
	print_debug_message( 'client_poll', 'End', 1 );
	return $status;
}

=head2 get_results()

Get the results for a jobid.

  &get_results($job_id);

=cut

sub get_results {
	print_debug_message( 'get_results', 'Begin', 1 );
	my $jobid  = shift;
	my $seq_id = shift;
	print_debug_message( 'get_results', 'jobid: ' . $jobid, 1 );
	print_debug_message( 'get_results', 'seq_id: ' . $seq_id, 1 ) if($seq_id);
	my $output_basename = $jobid;

	# Verbose
	if ( $outputLevel > 1 ) {
		print 'Getting results for job ', $jobid, "\n";
	}

	# Default output file names use JobId, however the name can be specified...
	if ( defined( $params{'outfile'} ) ) {
		$output_basename = $params{'outfile'};
	}

	# Or use sequence identifer.
	elsif ( defined( $params{'useSeqId'} && defined($seq_id) && $seq_id ne '') ) {
		$output_basename = $seq_id;

		# Make safe to use as a file name.
		$output_basename =~ s/\W/_/g;
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
			if ( defined( $params{'outfile'} ) && $params{'outfile'} eq '-' ) {
				write_file( $params{'outfile'}, $result );
			}
			else {
				write_file(
					$output_basename . '.'
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
			if ( defined( $params{'outfile'} ) && $params{'outfile'} eq '-' ) {
				write_file( $params{'outfile'}, $result );
			}
			else {
				write_file(
					$output_basename . '.'
					  . $resultType->{'identifier'} . '.'
					  . $resultType->{'fileSuffix'},
					$result
				);
			}
		}
	}
	print_debug_message( 'get_results', 'End', 1 );
}

=head2 read_file()

Read all data from a file. The special filename '-' can be used to read from 
standard input.

  my $data = &read_file($filename);

=cut

sub read_file {
	print_debug_message( 'read_file', 'Begin', 1 );
	my $filename = shift;
	print_debug_message( 'read_file', 'filename: ' . $filename, 2 );
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
	print_debug_message( 'read_file', 'End', 1 );
	return $content;
}

=head2 write_file()

Write data to a file. The special filename '-' can be used to write to 
standard output.

  &write_file($filename, $data);

=cut

sub write_file {
	print_debug_message( 'write_file', 'Begin', 1 );
	my ( $filename, $data ) = @_;
	print_debug_message( 'write_file', 'filename: ' . $filename, 2 );
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
	print_debug_message( 'write_file', 'End', 1 );
}

=head2 usage()

Print program usage.

  &usage();

=cut

sub usage {
	print STDERR <<EOF
EMBOSS seqret
=============

Manipulate and reformat sequence data.

[Required]

  seqFile            : file : query sequence ("-" for STDIN, \@filename for
                              identifier list file)
     --stype         : str  : sequence type, see --paramDetail stype.

[Optional]
     --inputformat   : str  : input data sequence format, see --paramDetail 
                              inputformat
     --outputformat  : str  : output data sequence format, see --paramDetail 
                              outputformat
     --firstonly     :      : process only the first input sequence
     --nofirstonly   :      : process all input sequences
     --feature       :      : enable use of feature information in input.
     --nofeature     :      : disable use of feature information in input.
     --reverse       :      : reverse-complement input nucleotide sequence.
     --noreverse     :      : do not reverse-complement input nucleotide 
                              sequence.
     --outputcase    : str  : output sequence case, see --paramDetail 
                              outputcase.
     --multifasta    :      : treat input as a set of fasta formatted 
                              sequences submitting a job for each sequence

[General]

  -h, --help         :      : prints this help text
      --async        :      : forces to make an asynchronous query
      --email        : str  : e-mail address
      --title        : str  : title for job
      --status       :      : get job status
      --resultTypes  :      : get available result types for job
      --polljob      :      : poll for the status of a job
      --jobid        : str  : jobid that was returned when an asynchronous job 
                              was submitted.
      --outfile      : str  : file name for results (default is jobid;
                              "-" for STDOUT)
      --useSeqId     :      : use sequence identifiers for output filenames. 
                              Only available in multifasta or list file modes.
      --maxJobs      : int  : maximum number of concurrent jobs. Only 
                              available in multifasta or list file modes.
      --outformat    : str  : result format to retrieve
      --params       :      : list input parameters
      --paramDetail  : str  : display details for input parameter
      --quiet        :      : decrease output
      --verbose      :      : increase output
      --trace        :      : show SOAP messages being interchanged 

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

  http://www.ebi.ac.uk/Tools/webservices/services/sfc/emboss_seqret_soap
  http://www.ebi.ac.uk/Tools/webservices/tutorials/perl

Support/Feedback:

  http://www.ebi.ac.uk/support/
EOF
}

=head1 FEEDBACK/SUPPORT

Please contact us at L<http://www.ebi.ac.uk/support/> if you have any 
feedback, suggestions or issues with the service or this client.

=cut
