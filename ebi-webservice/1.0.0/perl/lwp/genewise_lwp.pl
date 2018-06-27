#!/usr/bin/env perl

=head1 NAME

genewise_lwp.pl

=head1 DESCRIPTION

GeneWise (REST) web service Perl client using <LWP>.

Tested with:

=over

=item *
L<LWP> 5.79, L<XML::Simple> 2.12 and Perl 5.8.3

=item *
L<LWP> 5.808, L<XML::Simple> 2.18 and Perl 5.8.8 (Ubuntu 8.04 LTS)

=item *
L<LWP> 5.834, L<XML::Simple> 2.18 and Perl 5.10.1 (Ubuntu 10.04 LTS)

=item *
L<LWP> 6.03, L<XML::Simple> 2.18 and Perl 5.14.2 (Ubuntu 12.04 LTS)

=back

For further information see:

=over

=item *
L<http://www.ebi.ac.uk/Tools/webservices/services/psa/genewise_rest>

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
use LWP;
use XML::Simple;
use Getopt::Long qw(:config no_ignore_case bundling);
use File::Basename;
use Data::Dumper;

# Base URL for service
my $baseUrl = 'http://www.ebi.ac.uk/Tools/services/rest/genewise';

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
    'para'           => \$params{'para'},         # Show parameters in output alignmment
    'nopara'         => \$params{'nopara'},       # Don't show parameters in output alignmment
    'pretty'         => \$params{'pretty'},       # Show pretty ASCII alignment viewing
    'nopretty'       => \$params{'nopretty'},     # Don't show pretty ASCII alignment viewing
    'genes'          => \$params{'genes'},        # Show gene structure
    'nogenes'        => \$params{'nogenes'},      # Don't show gene structure
    'trans'          => \$params{'trans'},        # Show protein translation, breaking at frameshifts
    'notrans'        => \$params{'notrans'},      # Don't show protein translation, breaking at frameshifts
    'cdna'           => \$params{'cdna'},         # Show cDNA
    'nocdna'         => \$params{'nocdna'},       # Don't show cDNA
    'embl'           => \$params{'embl'},         # EMBL feature table format with CDS key
    'noembl'         => \$params{'noembl'},       # Don't output EMBL feature table format with CDS key
    'ace'            => \$params{'ace'},          # Show Ace file gene structure
    'noace'          => \$params{'noace'},        # Don't show Ace file gene structure
    'gff'            => \$params{'gff'},          # Show Gene Feature Format file
    'nogff'          => \$params{'nogff'},        # Don't show Gene Feature Format file
    'diana'          => \$params{'diana'},        # Show EMBL FT format suitable for diana
    'nodiana'        => \$params{'nodiana'},      # Don't show EMBL FT format suitable for diana
    'init=s'         => \$tool_params{'init'},    # Model in local/global mode
    'splice=s'       => \$tool_params{'splice'},  # Splice site
    'random=s'       => \$tool_params{'random'},  # Random (Null) Model
    'alg=s'          => \$tool_params{'alg'},     # Algorithm
    'asequence=s'    => \$params{'asequence'},    # First input protein sequence
    'bsequence=s'    => \$params{'bsequence'},    # Second input DNA sequence

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
	'baseUrl=s'     => \$baseUrl,                  # Base URL for service.
);
if ( $params{'verbose'} ) { $outputLevel++ }
if ( $params{'quiet'} )  { $outputLevel-- }

# Debug mode: LWP version
&print_debug_message( 'MAIN', 'LWP::VERSION: ' . $LWP::VERSION,
	1 );

# Debug mode: print the input parameters
&print_debug_message( 'MAIN', "params:\n" . Dumper( \%params ),           11 );
&print_debug_message( 'MAIN', "tool_params:\n" . Dumper( \%tool_params ), 11 );

# LWP UserAgent for making HTTP calls (initialised when required).
my $ua;

# Get the script filename for use in usage messages
my $scriptName = basename( $0, () );

# Print usage and exit if requested
if ( $params{'help'} || $numOpts == 0 ) {
	&usage();
	exit(0);
}

# Debug mode: show the base URL
&print_debug_message( 'MAIN', 'baseUrl: ' . $baseUrl, 1 );

if (
	!(
		   $params{'polljob'}
		|| $params{'resultTypes'}
		|| $params{'status'}
		|| $params{'params'}
		|| $params{'paramDetail'}
	)
	&& !( ( defined( $ARGV[0] ) && defined( $ARGV[1] ) ) ||
		  ( defined( $params{'asequence'} ) && defined( $params{'bsequence'} ) ) )
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

	# Load the sequence data and submit.
	&submit_job( &load_data() );
}

=head1 FUNCTIONS

=cut

### Wrappers for REST resources ###

=head2 rest_user_agent()

Get a LWP UserAgent to use to perform REST requests.

  my $ua = &rest_user_agent();

=cut

sub rest_user_agent() {
	print_debug_message( 'rest_user_agent', 'Begin', 21 );
	# Create an LWP UserAgent for making HTTP calls.
	my $ua = LWP::UserAgent->new();
	# Set 'User-Agent' HTTP header to identifiy the client.
	my $revisionNumber = 0;	
	$revisionNumber = $1 if('$Revision$' =~ m/(\d+)/);	
	$ua->agent("EBI-Sample-Client/$revisionNumber ($scriptName; $OSNAME) " . $ua->agent());
	# Configure HTTP proxy support from environment.
	$ua->env_proxy;
	print_debug_message( 'rest_user_agent', 'End', 21 );
	return $ua;
}

=head2 rest_error()

Check a REST response for an error condition. An error is mapped to a die.

  &rest_error($response, $content_data);

=cut

sub rest_error() {
	print_debug_message( 'rest_error', 'Begin', 21 );
	my $response = shift;
	my $contentdata;
	if(scalar(@_) > 0) {
		$contentdata = shift;
	}
	if(!defined($contentdata) || $contentdata eq '') {
		$contentdata = $response->content();
	}
	# Check for HTTP error codes
	if ( $response->is_error ) {
		my $error_message = '';
		# HTML response.
		if(	$contentdata =~ m/<h1>([^<]+)<\/h1>/ ) {
			$error_message = $1;
		}
		#  XML response.
		elsif($contentdata =~ m/<description>([^<]+)<\/description>/) {
			$error_message = $1;
		}
		die 'http status: ' . $response->code . ' ' . $response->message . '  ' . $error_message;
	}
	print_debug_message( 'rest_error', 'End', 21 );
}

=head2 rest_request()

Perform a REST request (HTTP GET).

  my $response_str = &rest_request($url);

=cut

sub rest_request {
	print_debug_message( 'rest_request', 'Begin', 11 );
	my $requestUrl = shift;
	print_debug_message( 'rest_request', 'URL: ' . $requestUrl, 11 );

	# Get an LWP UserAgent.
	$ua = &rest_user_agent() unless defined($ua);
	# Available HTTP compression methods.
	my $can_accept;
	eval {
	    $can_accept = HTTP::Message::decodable();
	};
	$can_accept = '' unless defined($can_accept);
	# Perform the request
	my $response = $ua->get($requestUrl,
		'Accept-Encoding' => $can_accept, # HTTP compression.
	);
	print_debug_message( 'rest_request', 'HTTP status: ' . $response->code,
		11 );
	print_debug_message( 'rest_request',
		'response length: ' . length($response->content()), 11 );
	print_debug_message( 'rest_request',
		'request:' ."\n" . $response->request()->as_string(), 32 );
	print_debug_message( 'rest_request',
		'response: ' . "\n" . $response->as_string(), 32 );
	# Unpack possibly compressed response.
	my $retVal;
	if ( defined($can_accept) && $can_accept ne '') {
	    $retVal = $response->decoded_content();
	}
	# If unable to decode use orginal content.
	$retVal = $response->content() unless defined($retVal);
	# Check for an error.
	&rest_error($response, $retVal);
	print_debug_message( 'rest_request', 'retVal: ' . $retVal, 12 );
	print_debug_message( 'rest_request', 'End', 11 );

	# Return the response data
	return $retVal;
}

=head2 rest_get_parameters()

Get list of tool parameter names.

  my (@param_list) = &rest_get_parameters();

=cut

sub rest_get_parameters {
	print_debug_message( 'rest_get_parameters', 'Begin', 1 );
	my $url                = $baseUrl . '/parameters/';
	my $param_list_xml_str = rest_request($url);
	my $param_list_xml     = XMLin($param_list_xml_str);
	my (@param_list)       = @{ $param_list_xml->{'id'} };
	print_debug_message( 'rest_get_parameters', 'End', 1 );
	return (@param_list);
}

=head2 rest_get_parameter_details()

Get details of a tool parameter.

  my $paramDetail = &rest_get_parameter_details($param_name);

=cut

sub rest_get_parameter_details {
	print_debug_message( 'rest_get_parameter_details', 'Begin', 1 );
	my $parameterId = shift;
	print_debug_message( 'rest_get_parameter_details',
		'parameterId: ' . $parameterId, 1 );
	my $url                  = $baseUrl . '/parameterdetails/' . $parameterId;
	my $param_detail_xml_str = rest_request($url);
	my $param_detail_xml     = XMLin($param_detail_xml_str);
	print_debug_message( 'rest_get_parameter_details', 'End', 1 );
	return ($param_detail_xml);
}

=head2 rest_run()

Submit a job.

  my $job_id = &rest_run($email, $title, \%params );

=cut

sub rest_run {
	print_debug_message( 'rest_run', 'Begin', 1 );
	my $email  = shift;
	my $title  = shift;
	my $params = shift;
	$email = '' if(!$email);
	print_debug_message( 'rest_run', 'email: ' . $email, 1 );
	if ( defined($title) ) {
		print_debug_message( 'rest_run', 'title: ' . $title, 1 );
	}
	print_debug_message( 'rest_run', 'params: ' . Dumper($params), 1 );

	# Get an LWP UserAgent.
	$ua = &rest_user_agent() unless defined($ua);

	# Clean up parameters
	my (%tmp_params) = %{$params};
	$tmp_params{'email'} = $email;
	$tmp_params{'title'} = $title;
	foreach my $param_name ( keys(%tmp_params) ) {
		if ( !defined( $tmp_params{$param_name} ) ) {
			delete $tmp_params{$param_name};
		}
	}

	# Submit the job as a POST
	my $url = $baseUrl . '/run';
	my $response = $ua->post( $url, \%tmp_params );
	print_debug_message( 'rest_run', 'HTTP status: ' . $response->code, 11 );
	print_debug_message( 'rest_run',
		'request:' ."\n" . $response->request()->as_string(), 11 );
	print_debug_message( 'rest_run',
		'response: ' . length($response->as_string()) . "\n" . $response->as_string(), 11 );

	# Check for an error.
	&rest_error($response);

	# The job id is returned
	my $job_id = $response->content();
	print_debug_message( 'rest_run', 'End', 1 );
	return $job_id;
}

=head2 rest_get_status()

Check the status of a job.

  my $status = &rest_get_status($job_id);

=cut

sub rest_get_status {
	print_debug_message( 'rest_get_status', 'Begin', 1 );
	my $job_id = shift;
	print_debug_message( 'rest_get_status', 'jobid: ' . $job_id, 2 );
	my $status_str = 'UNKNOWN';
	my $url        = $baseUrl . '/status/' . $job_id;
	$status_str = &rest_request($url);
	print_debug_message( 'rest_get_status', 'status_str: ' . $status_str, 2 );
	print_debug_message( 'rest_get_status', 'End', 1 );
	return $status_str;
}

=head2 rest_get_result_types()

Get list of result types for finished job.

  my (@result_types) = &rest_get_result_types($job_id);

=cut

sub rest_get_result_types {
	print_debug_message( 'rest_get_result_types', 'Begin', 1 );
	my $job_id = shift;
	print_debug_message( 'rest_get_result_types', 'jobid: ' . $job_id, 2 );
	my (@resultTypes);
	my $url                      = $baseUrl . '/resulttypes/' . $job_id;
	my $result_type_list_xml_str = &rest_request($url);
	my $result_type_list_xml     = XMLin($result_type_list_xml_str);
	(@resultTypes) = @{ $result_type_list_xml->{'type'} };
	print_debug_message( 'rest_get_result_types',
		scalar(@resultTypes) . ' result types', 2 );
	print_debug_message( 'rest_get_result_types', 'End', 1 );
	return (@resultTypes);
}

=head2 rest_get_result()

Get result data of a specified type for a finished job.

  my $result = rest_get_result($job_id, $result_type);

=cut

sub rest_get_result {
	print_debug_message( 'rest_get_result', 'Begin', 1 );
	my $job_id = shift;
	my $type   = shift;
	print_debug_message( 'rest_get_result', 'jobid: ' . $job_id, 1 );
	print_debug_message( 'rest_get_result', 'type: ' . $type,    1 );
	my $url    = $baseUrl . '/result/' . $job_id . '/' . $type;
	my $result = &rest_request($url);
	print_debug_message( 'rest_get_result', length($result) . ' characters',
		1 );
	print_debug_message( 'rest_get_result', 'End', 1 );
	return $result;
}

### Service actions and utility functions ###

=head2 print_debug_message()

Print debug message at specified debug level.

  &print_debug_message($method_name, $message, $level);

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

Print list of tool parameters.

  &print_tool_params();

=cut

sub print_tool_params {
	print_debug_message( 'print_tool_params', 'Begin', 1 );
	my (@param_list) = &rest_get_parameters();
	foreach my $param ( sort(@param_list) ) {
		print $param, "\n";
	}
	print_debug_message( 'print_tool_params', 'End', 1 );
}

=head2 print_param_details()

Print details of a tool parameter.

  &print_param_details($param_name);

=cut

sub print_param_details {
	print_debug_message( 'print_param_details', 'Begin', 1 );
	my $paramName = shift;
	print_debug_message( 'print_param_details', 'paramName: ' . $paramName, 2 );
	my $paramDetail = &rest_get_parameter_details($paramName);
	print $paramDetail->{'name'}, "\t", $paramDetail->{'type'}, "\n";
	print $paramDetail->{'description'}, "\n";
	if(defined($paramDetail->{'values'}->{'value'})) {
		if(ref($paramDetail->{'values'}->{'value'}) eq 'ARRAY') {
			foreach my $value ( @{ $paramDetail->{'values'}->{'value'} } ) {
				&print_param_value($value);
			}
		}
		else {
				&print_param_value($paramDetail->{'values'}->{'value'});
		}
	}
	print_debug_message( 'print_param_details', 'End', 1 );
}

=head2 print_param_value()

Print details of a tool parameter value.

  &print_param_details($param_value);

Used by print_param_details() to handle both singluar and array values.

=cut

sub print_param_value {
	my $value = shift;
	print $value->{'value'};
	if ( $value->{'defaultValue'} eq 'true' ) {
		print "\t", 'default';
	}
	print "\n";
	print "\t", $value->{'label'}, "\n";
	if ( defined( $value->{'properties'} ) ) {
		foreach
		  my $key ( sort( keys( %{ $value->{'properties'}{'property'} } ) ) )
		{
			if ( ref( $value->{'properties'}{'property'}{$key} ) eq 'HASH'
				&& defined( $value->{'properties'}{'property'}{$key}{'value'} )
			  )
			{
				print "\t", $key, "\t",
				  $value->{'properties'}{'property'}{$key}{'value'}, "\n";
			}
			else {
				print "\t", $value->{'properties'}{'property'}{'key'},
				  "\t", $value->{'properties'}{'property'}{'value'}, "\n";
				last;
			}
		}
	}
}

=head2 print_job_status()

Print status of a job.

  &print_job_status($job_id);

=cut

sub print_job_status {
	print_debug_message( 'print_job_status', 'Begin', 1 );
	my $jobid = shift;
	print_debug_message( 'print_job_status', 'jobid: ' . $jobid, 1 );
	if ( $outputLevel > 0 ) {
		print STDERR 'Getting status for job ', $jobid, "\n";
	}
	my $result = &rest_get_status($jobid);
	print "$result\n";
	if ( $result eq 'FINISHED' && $outputLevel > 0 ) {
		print STDERR "To get results: $scriptName --polljob --jobid " . $jobid
		  . "\n";
	}
	print_debug_message( 'print_job_status', 'End', 1 );
}

=head2 print_result_types()

Print available result types for a job.

  &print_result_types($job_id);

=cut

sub print_result_types {
	print_debug_message( 'result_types', 'Begin', 1 );
	my $jobid = shift;
	print_debug_message( 'result_types', 'jobid: ' . $jobid, 1 );
	if ( $outputLevel > 0 ) {
		print STDERR 'Getting result types for job ', $jobid, "\n";
	}
	my $status = &rest_get_status($jobid);
	if ( $status eq 'PENDING' || $status eq 'RUNNING' ) {
		print STDERR 'Error: Job status is ', $status,
		  '. To get result types the job must be finished.', "\n";
	}
	else {
		my (@resultTypes) = &rest_get_result_types($jobid);
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
	print_debug_message( 'result_types', 'End', 1 );
}

=head2 submit_job()

Submit a job to the service.

  &submit_job($seq);

=cut

sub submit_job {
	print_debug_message( 'submit_job', 'Begin', 1 );

	# Set input sequence
	$tool_params{'asequence'} = shift;
	$tool_params{'bsequence'} = shift;

	# Load parameters
	&load_params();

	# Submit the job
	my $jobid = &rest_run( $params{'email'}, $params{'title'}, \%tool_params );

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
	print_debug_message( 'submit_job', 'End', 1 );
}

=head2 load_data()

Load sequence data, from file or direct specification of input data with 
command-line option.

  my (@data) = load_data();

=cut

sub load_data {
	print_debug_message( 'load_data', 'Begin', 1 );
	my @retSeq = ();

	# First sequence
	if ( defined( $ARGV[0] ) ) {    # Bare option
		if ( -f $ARGV[0] || $ARGV[0] eq '-' ) {    # File
			$retSeq[0] = &read_file( $ARGV[0] );
		}
		else {                                     # DB:ID or raw sequence
			$retSeq[0] = $ARGV[0];
		}
	}
	if ( $params{'asequence'} ) {                   # Via --sequence
		if ( -f $params{'asequence'} || $params{'asequence'} eq '-' ) {    # File
			$retSeq[0] = &read_file( $params{'asequence'} );
		}
		else {    # DB:ID or sequence
			$retSeq[0] = $params{'asequence'};
		}
	}
	# Second sequence
	if ( defined( $ARGV[1] ) ) {    # Bare option
		if ( -f $ARGV[1] || $ARGV[1] eq '-' ) {    # File
			$retSeq[1] = &read_file( $ARGV[1] );
		}
		else {                                     # DB:ID or raw sequence
			$retSeq[1] = $ARGV[1];
		}
	}
	if ( $params{'bsequence'} ) {                   # Via --sequence
		if ( -f $params{'bsequence'} || $params{'bsequence'} eq '-' ) {    # File
			$retSeq[1] = &read_file( $params{'bsequence'} );
		}
		else {    # DB:ID or sequence
			$retSeq[1] = $params{'bsequence'};
		}
	}
	print_debug_message( 'load_data', 'End', 1 );
	return @retSeq;
}

=head2 load_params()

Load job parameters from command-line options.

  &load_params();

=cut

sub load_params {
	print_debug_message( 'load_params', 'Begin', 1 );
	print_debug_message( 'load_params',
		"params:\n" . Dumper( \%params ), 2 );
	print_debug_message( 'load_params',
		"tool_params:\n" . Dumper( \%tool_params ), 2 );
	
	# Parameters in output alignmment (para)
	if($params{'para'}) {
		$tool_params{'para'} = 'true';
	}
	elsif($params{'nopara'}) {
		$tool_params{'para'} = 'false';
	}
	
	# Pretty ASCII alignment viewing (pretty)
	if($params{'pretty'}) {
		$tool_params{'pretty'} = 'true';
	}
	elsif($params{'nopretty'}) {
		$tool_params{'pretty'} = 'false';
	}

	# Gene structure (genes).
	if($params{'genes'}) {
		$tool_params{'genes'} = 'true';
	}
	elsif($params{'nogenes'}) {
		$tool_params{'genes'} = 'false';
	}
	
	# Protein translation, breaking at frameshifts (trans)
	if($params{'trans'}) {
			$tool_params{'trans'} = 'true';
	}
	elsif($params{'notrans'}) {
		$tool_params{'trans'} = 'false';
	}

	# Output cDNA (cdna)
	if($params{'cdna'}) {
		$tool_params{'cdna'} = 'true';
	}
	elsif($params{'nocdna'}) {
		$tool_params{'cdna'} = 'false';
	}

	# EMBL feature table format with CDS key (embl)
	if($params{'embl'}) {
		$tool_params{'embl'} = 'true';
	}
	elsif($params{'noembl'}) {
		$tool_params{'embl'} = 'false';
	}

	# Ace file gene structure (ace)
	if($params{'ace'}) {
		$tool_params{'ace'} = 'true';
	}
	elsif($params{'noace'}) {
		$tool_params{'ace'} = 'false';
	}

	# Gene Feature Format file (gff)
	if($params{'gff'}) {
		$tool_params{'gff'} = 'true';
	}
	elsif($params{'nogff'}) {
		$tool_params{'gff'} = 'false';
	}

	# EMBL FT format suitable for diana (diana)
	if($params{'diana'}) {
		$tool_params{'diana'} = 'true';
	}
	elsif($params{'nodiana'}) {
		$tool_params{'diana'} = 'false';
	}
	
	print_debug_message( 'load_params', 'End', 1 );
}

=head2 client_poll()

Client-side job polling.

  &client_poll($job_id);

=cut

sub client_poll {
	print_debug_message( 'client_poll', 'Begin', 1 );
	my $jobid  = shift;
	my $status = 'PENDING';

# Check status and wait if not finished. Terminate if three attempts get "ERROR".
	my $errorCount = 0;
	while ($status eq 'RUNNING'
		|| $status eq 'PENDING'
		|| ( $status eq 'ERROR' && $errorCount < 2 ) )
	{
		$status = rest_get_status($jobid);
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

Get the results for a job identifier.

  &get_results($job_id);

=cut

sub get_results {
	print_debug_message( 'get_results', 'Begin', 1 );
	my $jobid = shift;
	print_debug_message( 'get_results', 'jobid: ' . $jobid, 1 );

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
	my (@resultTypes) = rest_get_result_types($jobid);

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
			  rest_get_result( $jobid, $selResultType->{'identifier'} );
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
			my $result = rest_get_result( $jobid, $resultType->{'identifier'} );
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
	print_debug_message( 'get_results', 'End', 1 );
}

=head2 read_file()

Read a file into a scalar. The special filename '-' can be used to read from 
standard input (STDIN).

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
standard output (STDOUT).

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

Print program usage message.

  &usage();

=cut

sub usage {
	print STDERR <<EOF
GeneWise
========

GeneWise compares a protein sequence to a genomic DNA sequence, allowing for introns 
and frameshifting errors.

[Required]

      --asequence     : file : first protein sequence to align
      --bsequence     : file : second DNA sequence to align

[Optional]

      --para          :      : show parameters in output alignmment
      --nopara        :      : do not show parameters in output alignmment
      --pretty        :      : show pretty ASCII alignment viewing
      --nopretty      :      : do not show pretty ASCII alignment viewing
      --genes         :      : show gene structure
      --nogenes       :      : do not show gene structure
      --trans         :      : show protein translation, breaking at frameshifts 
      --notrans       :      : do not show protein translation, breaking at frameshifts 
      --cdna          :      : show cDNA
      --nocdna        :      : do not show cDNA
      --embl          :      : EMBL feature table format with CDS key
      --noembl        :      : no EMBL feature table format with CDS key
      --ace           :      : show Ace file gene structure
      --noace         :      : do not show Ace file gene structure
      --gff           :      : show Gene Feature Format file
      --nogff         :      : do not show Gene Feature Format file
      --diana         :      : show EMBL FT format suitable for diana
      --nodiana       :      : do not show EMBL FT format suitable for diana
      --init          : str  : model in local/global mode, see --paramDetail init
      --splice        : str  : splice site, see --paramDetail splice
      --random        : str  : Random (Null) Model, see --paramDetail random
      --alg           : str  : algorithm, see --paramDetail alg

[General]

  -h, --help          :      : prints this help text
      --async         :      : forces to make an asynchronous query
      --email         : str  : e-mail address
      --title         : str  : title for job
      --status        :      : get job status
      --resultTypes   :      : get available result types for job
      --polljob       :      : poll for the status of a job
      --jobid         : str  : jobid that was returned when an asynchronous job 
                               was submitted.
      --outfile       : str  : file name for results (default is jobid;
                               "-" for STDOUT)
      --outformat     : str  : result format to retrieve
      --params        :      : list input parameters
      --paramDetail   : str  : display details for input parameter
      --quiet         :      : decrease output
      --verbose       :      : increase output
   
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

  http://www.ebi.ac.uk/Tools/webservices/services/psa/genewise_rest
  http://www.ebi.ac.uk/Tools/webservices/tutorials/perl

Support/Feedback:

  http://www.ebi.ac.uk/support/
EOF
}

=head1 FEEDBACK/SUPPORT

Please contact us at <http://www.ebi.ac.uk/support/> if you have any 
feedback, suggestions or issues with the service or this client.

=cut
