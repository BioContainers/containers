#!/usr/bin/env perl

=head1 NAME

dbfetch_lwp.pl

=head1 DESCRIPTION

dbfetch (REST) web service Perl client using L<LWP>.

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
L<http://www.ebi.ac.uk/Tools/dbfetch>

=item *
L<http://www.ebi.ac.uk/Tools/webservices/services/dbfetch_rest>

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
use Getopt::Long qw(:config no_ignore_case bundling);
use File::Basename;
use YAML::Syck;
use Data::Dumper;

# Maximum size for identifier list chunks.
use constant MAX_CHUNK_SIZE => 100;

# Base URL for service
my $baseUrl = 'http://www.ebi.ac.uk/Tools/dbfetch/dbfetch';
# Output level
my $outputLevel = 1;

# Process command-line options
my $numOpts = scalar(@ARGV);
my %params = ( 'debugLevel' => 0 );

# Default parameter values (should get these from the service)
GetOptions(
	'quiet'        => \$params{'quiet'},         # Decrease output level
	'verbose'      => \$params{'verbose'},       # Increase output level
	'debugLevel=i' => \$params{'debugLevel'},    # Debug output level
	'baseUrl=s'    => \$baseUrl,                 # Base URL for service.
);
if ( $params{'verbose'} ) { $outputLevel++ }
if ( $params{'$quiet'} )  { $outputLevel-- }

# Debug mode: LWP version
&print_debug_message( 'MAIN', 'LWP::VERSION: ' . $LWP::VERSION, 1 );

# Debug mode: print the input parameters
&print_debug_message( 'MAIN', "params:\n" . Dumper( \%params ), 11 );

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

my $method = shift;

# Get supported database names
if ( $method eq 'getSupportedDBs' ) {
	&print_get_supported_dbs();
}

# Get supported database and format names
elsif ( $method eq 'getSupportedFormats' ) {
	&print_get_supported_formats();
}

# Get supported database and style names
elsif ( $method eq 'getSupportedStyles' ) {
	&print_get_supported_styles();
}

# Get formats for a database.
elsif ( $method eq 'getDbFormats' ) {
	&print_get_db_formats(@ARGV);
}

# Get styles for a format of a database.
elsif ( $method eq 'getFormatStyles' ) {
	&print_get_format_styles(@ARGV);
}

# Fetch an entry
elsif ( $method eq 'fetchData' ) {
	&print_fetch_data(@ARGV);
}

# Fetch a set of entries.
elsif ( $method eq 'fetchBatch' ) {
	&print_fetch_batch(@ARGV);
}
else {
	&usage();
	exit(1);
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

=head2 dbfetch_error_check()

Check the response from dbfetch for an warning/error message.

  my $response_str = &rest_request($url);
  &dbfetch_error_check($response_str);

=cut

sub dbfetch_error_check {
	print_debug_message( 'dbfetch_error_check', 'Begin', 11 );
	my $content    = shift;
	my $statusCode = -1;
	if ( $content =~ m/^ERROR (\d+) [^\n\r]+[\n\r]+$/ ) {
		$statusCode = $1;
		# "ID not found" or "No entries found."
		if ( $statusCode == 4 || $statusCode == 12 ) {
			warn $content;
		}
		else {
			die $content;
		}
	}
	print_debug_message( 'dbfetch_error_check', 'End', 11 );
	return $statusCode;
}

=head2 rest_get_meta_information()

Get server meta-information.

  my $dbfetch_info = &rest_get_meta_information();

=cut

sub rest_get_meta_information {
	print_debug_message( 'rest_get_meta_information', 'Begin', 1 );

	# Get meta-information
	my $url          = $baseUrl . '/dbfetch.databases?style=yaml';
	my $response_str = &rest_request($url);
	&dbfetch_error_check($response_str);
	my $dbfetch_info = Load($response_str);
	print_debug_message( 'rest_get_meta_information',
		"dbfetch_info:\n" . Dumper($dbfetch_info), 11 );
	print_debug_message( 'rest_get_meta_information', 'End', 1 );
	return $dbfetch_info;
}

=head2 rest_get_supported_dbs()

Get list of supported database names.

  my (@db_list) = &rest_get_supported_dbs();

=cut

sub rest_get_supported_dbs {
	print_debug_message( 'rest_get_supported_dbs', 'Begin', 1 );
	my $dbfetch_info = &rest_get_meta_information();
	my (@retArray) = ();
	foreach my $db_name ( sort( keys(%$dbfetch_info) ) ) {
		my $db_info = $dbfetch_info->{$db_name};
		push( @retArray, $db_info->{'name'} );
	}
	print_debug_message( 'rest_get_supported_dbs', 'End', 1 );
	return @retArray;
}

=head2

Print list of supported databases.

  &print_get_supported_dbs();

=cut

sub print_get_supported_dbs {
	print_debug_message( 'print_get_supported_dbs', 'Begin', 1 );
	my (@db_array) = &rest_get_supported_dbs();
	foreach my $dbName (@db_array) {
		print $dbName, "\n";
	}
	print_debug_message( 'print_get_supported_dbs', 'End', 1 );
}

=head2 rest_get_supported_formats()

Get list of supported database and format names.

  my (@format_list) = &rest_get_supported_formats();

=cut

sub rest_get_supported_formats {
	print_debug_message( 'rest_get_supported_formats', 'Begin', 1 );
	my $dbfetch_info = &rest_get_meta_information();
	my (@retArray) = ();
	foreach my $db_name ( sort( keys(%$dbfetch_info) ) ) {
		my $db_info = $dbfetch_info->{$db_name};
		my $tmpStr  = $db_info->{'name'} . "\t";
		foreach my $format ( @{ $db_info->{'formatInfoList'} } ) {
			$tmpStr .= $format->{'name'} . ',';
		}
		$tmpStr =~ s/,$//;
		push( @retArray, $tmpStr );
	}
	print_debug_message( 'rest_get_supported_formats', 'End', 1 );
	return (@retArray);
}

=head2

Print list of supported database and format names.

  &print_get_supported_formats();

=cut

sub print_get_supported_formats {
	print_debug_message( 'print_get_supported_formats', 'Begin', 1 );
	my (@format_array) = &rest_get_supported_formats();
	foreach my $format (@format_array) {
		print $format, "\n";
	}
	print_debug_message( 'print_get_supported_formats', 'End', 1 );
}

=head2 rest_get_supported_styles()

Get list of supported database and style names.

  my (@style_list) = &rest_get_supported_styles();

=cut

sub rest_get_supported_styles {
	print_debug_message( 'rest_get_supported_styles', 'Begin', 1 );
	my $dbfetch_info = &rest_get_meta_information();
	my (@retArray) = ();
	foreach my $db_name ( sort( keys(%$dbfetch_info) ) ) {
		my $db_info   = $dbfetch_info->{$db_name};
		my $tmpStr    = $db_info->{'name'} . "\t";
		my %styleHash = ();
		foreach my $format ( @{ $db_info->{'formatInfoList'} } ) {
			foreach my $styleName ( @{ $format->{'styleNames'} } ) {
				$styleHash{$styleName} = $styleName;
			}
		}
		foreach my $styleName ( sort( keys(%styleHash) ) ) {
			$tmpStr .= $styleName . ',';
		}
		$tmpStr =~ s/,$//;
		push( @retArray, $tmpStr );
	}
	print_debug_message( 'rest_get_supported_styles', 'End', 1 );
	return (@retArray);
}

=head2 print_get_supported_styles()

Print list of supported database and style names.

  &print_get_supported_styles();

=cut

sub print_get_supported_styles {
	print_debug_message( 'print_get_supported_styles', 'Begin', 1 );
	my (@style_array) = &rest_get_supported_styles();
	foreach my $style (@style_array) {
		print $style, "\n";
	}
	print_debug_message( 'print_get_supported_styles', 'End', 1 );
}

=head2 rest_get_db_formats()

Get list of available formats for a database.

  my (@formatNameList) = &rest_get_db_formats($dbName);

=cut

sub rest_get_db_formats {
	print_debug_message( 'rest_get_db_formats', 'Begin', 1 );
	my $dbName       = shift;
	my $dbfetch_info = &rest_get_meta_information();
	my (@retArray)   = ();
	if ( $dbfetch_info->{$dbName} ) {
		my $db_info = $dbfetch_info->{$dbName};
		foreach my $format ( @{ $db_info->{'formatInfoList'} } ) {
			push( @retArray, $format->{'name'} );
		}
	}
	if ( scalar(@retArray) < 1 ) {
		die "ERROR 1 Unknown database [$dbName]."
	}
	print_debug_message( 'rest_get_db_formats', 'End', 1 );
	return (@retArray);
}

=head2 print_get_db_formats()

Print list of available formats for a database.

  &print_get_db_formats($dbName);

=cut

sub print_get_db_formats {
	print_debug_message( 'print_get_db_formats', 'Begin', 1 );
	my (@format_array) = &rest_get_db_formats(@_);
	foreach my $format (@format_array) {
		print $format, "\n";
	}
	print_debug_message( 'print_get_db_formats', 'End', 1 );
}

=head2 rest_get_format_styles()

Get list of styles for a format of a database.

  my (@styleNameList) = &rest_get_format_styles($dbName, $formatName);

=cut

sub rest_get_format_styles {
	print_debug_message( 'rest_get_format_styles', 'Begin', 1 );
	my $dbName       = shift;
	my $formatName   = shift;
	my $dbfetch_info = &rest_get_meta_information();
	my (@retArray)   = ();
	if ( $dbfetch_info->{$dbName} ) {
		my $db_info = $dbfetch_info->{$dbName};
		foreach my $format ( @{ $db_info->{'formatInfoList'} } ) {
			if ( $formatName eq $format->{'name'} ) {
				foreach my $styleInfo ( @{ $format->{'styleInfoList'} } ) {
					push( @retArray, $styleInfo->{'name'} );
				}
			}
		}
	}
	else {
		die "ERROR 1 Unknown database [$dbName]."
	}
	if ( scalar(@retArray) < 1 ) {
		die "ERROR 3 Format [$formatName] not known for database [$dbName]."
	}
	print_debug_message( 'rest_get_format_styles', 'End', 1 );
	return (@retArray);
}

=head2 print_get_format_styles()

Print list of available style names for a format of a database.

  &print_get_format_styles($dbName, $formatName);

=cut

sub print_get_format_styles {
	print_debug_message( 'print_get_format_styles', 'Begin', 1 );
	my (@style_array) = &rest_get_format_styles(@_);
	foreach my $style (@style_array) {
		print $style, "\n";
	}
	print_debug_message( 'print_get_format_styles', 'End', 1 );
}

=head2 rest_fetch_data()

Fetch an entry.

  my $entryStr = &rest_fetch_data($query, $formatName, $styleName);

=cut

sub rest_fetch_data {
	print_debug_message( 'rest_fetch_data', 'Begin', 1 );
	my $query      = shift;
	my $formatName = 'default';
	$formatName = shift if ( scalar(@_) > 0 );
	my $styleName = 'raw';
	$styleName = shift if ( scalar(@_) > 0 );
	my @queryPart = split( /:/, $query );
	my $dbName = 'default';
	my $id;

	if ( scalar(@queryPart) > 1 ) {
		$dbName = $queryPart[0];
		$id     = $queryPart[1];
	}
	else {
		$id = $query;
	}
	my $response_str =
	  &rest_fetch_batch( $dbName, $id, $formatName, $styleName );
	print_debug_message( 'rest_fetch_data', 'End', 1 );
	return $response_str;
}

=head2 print_fetch_data()

Print an entry.

  &print_fetch_data($query, $formatName, $styleName);

=cut

sub print_fetch_data {
	print_debug_message( 'print_fetch_data', 'Begin', 1 );
	my $query      = shift;
	my $formatName = shift || 'default';
	my $styleName  = shift || 'raw';

	# Read identifiers from file?
	if ( $query eq '-' || $query =~ m/^@/ ) {
		my $FH;
		my $filename = $query;
		$filename =~ s/^@//;
		if ( $filename eq '-' ) {
			$FH = *STDIN;
		}
		else {
			open( $FH, '<', $filename )
			  or die "Error: unable to open file $filename ($!)";
		}
		while (<$FH>) {
			chomp;
			my $entryId = $_;
			if ( $entryId =~ m/^\S+:\S+/ ) {
				my $entryStr =
				  &rest_fetch_data( $entryId, $formatName, $styleName );
				print $entryStr, "\n" if ($entryStr);
			}
		}
		close($FH) unless ( $filename eq '-' );
	}
	else {
		my $entryStr = &rest_fetch_data( $query, $formatName, $styleName );
		print $entryStr, "\n" if ($entryStr);
	}
	print_debug_message( 'print_fetch_data', 'End', 1 );
}

=head2 rest_fetch_batch()

Fetch a set of entries.

  my $entriesStr = &rest_fetch_batch($dbName, $idListStr, $formatName, $styleName);

=cut

sub rest_fetch_batch {
	print_debug_message( 'rest_fetch_batch', 'Begin', 1 );
	my $url = $baseUrl . '/' . shift;
	$url .= '/' . shift       if ( scalar(@_) > 0 );
	$url .= '/' . shift       if ( scalar(@_) > 0 );
	$url .= '?style=' . shift if ( scalar(@_) > 0 );
	print_debug_message( 'rest_fetch_batch', 'url: ' . $url, 11 );
	my $response_str = &rest_request($url);
	my $statusCode = &dbfetch_error_check($response_str);
	$response_str = '' if ( $statusCode > -1 );
	print_debug_message( 'rest_fetch_batch', 'End', 1 );
	return $response_str;
}

=head2 print_fetch_batch()

Print a set of entries.

  &print_fetch_batch($dbName, $idListStr, $formatName, $styleName);

=cut

sub print_fetch_batch {
	print_debug_message( 'print_fetch_batch', 'Begin', 1 );
	my $dbName     = shift;
	my $idListStr  = shift;
	my $formatName = shift || 'default';
	my $styleName  = shift || 'raw';

	# Read identifiers from STDIN or file?
	if ( $idListStr eq '-' || $idListStr =~ m/^@/) {
		my $tmpIdListStr = '';
		my $FH;
		my $filename = $idListStr;
		$filename =~ s/^@//;
		if($filename eq '-') {
			$FH = *STDIN;
		}
		else {
			open($FH, '<', $filename) or die "Error: unable to open file $filename ($!)";
		}
		my $id_counter = 0;
		while(<$FH>) {
			chomp;
			if($_ ne '') {
				$tmpIdListStr .= ',' if(length($tmpIdListStr) > 0);
				$tmpIdListStr .= $_;
				$id_counter++;
			}
			if($id_counter >= MAX_CHUNK_SIZE) {
				&_print_fetch_batch($dbName, $tmpIdListStr, $formatName, $styleName);
				$id_counter = 0; # Reset counter.
				$tmpIdListStr = ''; # Clear identifier list.
			}
		}
		close($FH) unless($filename eq '-');
		if($id_counter > 0) {
			&_print_fetch_batch($dbName, $tmpIdListStr, $formatName, $styleName);
		}
	}
	# Direct specification of identifiers.
	else {
		&_print_fetch_batch($dbName, $idListStr, $formatName, $styleName);
	}
	print_debug_message( 'print_fetch_batch', 'End', 1 );
}

sub _print_fetch_batch {
	print_debug_message( '_print_fetch_batch', 'Begin', 11 );
	my $dbName = shift;
	my $idListStr = shift;
	my $formatName = shift;
	my $styleName = shift;
	$idListStr =~ s/[ \t\n\r;]+/,/g;    # Id list should be comma seperated
	$idListStr =~ s/,+/,/g;             # Remove any empty items
	my $entriesStr = &rest_fetch_batch($dbName, $idListStr, $formatName, $styleName);
	if(length($entriesStr) > 0) {
		print $entriesStr;
		print "\n" if($entriesStr !~ m/[\r\n]$/);
	}
	print_debug_message( '_print_fetch_batch', 'End', 11 );
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

=head2 usage()

Print program usage message.

  &usage();

=cut

sub usage {
	print STDERR <<EOF
WSDbfetch
=========

Usage:
  $scriptName <method> [arguments...] [--baseUrl <baseUrl>]

A number of methods are available:

  getSupportedDBs - list available databases
  getSupportedFormats - list available databases with formats
  getSupportedStyles - list available databases with styles
  getDbFormats - list formats for a specifed database
  getFormatStyles - list styles for a specified database and format
  fetchData - retrive an database entry. See below for details of arguments.
  fetchBatch - retrive database entries. See below for details of arguments.

Fetching an entry: fetchData

  $scriptName fetchData <dbName:id> [format [style]]

  dbName:id  database name and entry ID or accession (e.g. UNIPROT:WAP_RAT), 
             use \@fileName to read identifiers from a file or \@- to read 
             identifiers from STDIN.
  format     format to retrive (e.g. uniprot)
  style      style to retrive (e.g. raw)


Fetching entries: fetchBatch

  $scriptName fetchBatch <dbName> <idList> [format [style]]

  dbName     database name (e.g. UNIPROT)
  idList     list of entry IDs or accessions (e.g. 1433T_RAT,WAP_RAT).
             Maximum of 200 IDs or accessions. "-" for STDIN.
  format     format to retrive (e.g. uniprot)
  style      style to retrive (e.g. raw)

Support/Feedback:

  http://www.ebi.ac.uk/support/
EOF
}

=head1 FEEDBACK/SUPPORT

Please contact us at L<http://www.ebi.ac.uk/support/> if you have any 
feedback, suggestions or issues with the service or this client.

=cut
