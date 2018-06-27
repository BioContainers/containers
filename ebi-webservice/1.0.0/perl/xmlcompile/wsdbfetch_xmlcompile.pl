#!/usr/bin/env perl

=head1 NAME

dbfetch_xmlcompile.pl

=head1 DESCRIPTION

WSDbfetch document/literal SOAP web service Perl client using L<XML::Compile::SOAP>.

Tested with:

=over

=item *
L<XML::Compile::SOAP> 0.78, L<XML::Compile> 0.96 and Perl 5.8.8 (Ubuntu 8.04 LTS)

=item *
L<XML::Compile::SOAP> 2.08, L<XML::Compile> 1.12 and Perl 5.8.8 (Ubuntu 8.04 LTS)

=item *
L<XML::Compile::SOAP> 2.13, L<XML::Compile> 1.15 and Perl 5.10.1 (Ubuntu 10.04 LTS)

=item *
L<XML::Compile::SOAP> 2.10, L<XML::Compile> 1.12 and Perl 5.10.1 (Cygwin 1.7.2; MS Windows 7)
=back

For further information see:

=over

=item *
L<http://www.ebi.ac.uk/Tools/webservices/services/dbfetch>

=item *
L<http://www.ebi.ac.uk/Tools/webservices/tutorials/perl>

=back

=head1 LICENSE

Copyright 2012-2013 EMBL - European Bioinformatics Institute

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
my $WSDL = 'http://www.ebi.ac.uk/ws/services/WSDbfetchDoclit?wsdl';

# Output level
my $outputLevel = 1;

# Process command-line options
my %params = ( 'debugLevel' => 0 );

# Command-line options
my $trace;
GetOptions(
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
my $numOpts = scalar(@ARGV);

# Debug mode: XML::Compile::SOAP version
&print_debug_message( 'MAIN',
	'XML::Compile::SOAP::VERSION: ' . $XML::Compile::SOAP::VERSION, 1 );

# Debug mode: print the input parameters
&print_debug_message( 'MAIN', "params:\n" . Dumper( \%params ),           11 );

# Get the script filename for use in usage messages
my $scriptName = basename( $0, () );

# Print usage and exit if requested
if ( $params{'help'} || $numOpts == 0 ) {
	&usage();
	exit(0);
}

# Debug mode: show the WSDL, service endpoint and namespace being used.
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
		$soapOps{ $soapOp->name } = $soapSrv->compileClient( $soapOp->name );
	}

	# XML::Compile::SOAP 0.7x
	else {
		&print_debug_message( 'MAIN', 'Operation: ' . $soapOp->{operation},
			12 );
		$soapOps{ $soapOp->{operation} } =
		  $soapSrv->compileClient( $soapOp->{operation} );
	}
}

# Process command-line and perfom action
# List supported databases
if ( $ARGV[0] eq 'getSupportedDBs' ) {
	&print_supported_dbs();
}

# List supported databases and formats
elsif ( $ARGV[0] eq 'getSupportedFormats' ) {
	&print_supported_formats();
}

# List supported databases and styles
elsif ( $ARGV[0] eq 'getSupportedStyles' ) {
	&print_supported_styles();
}

# List supported formats for a database
elsif ( $ARGV[0] eq 'getDbFormats' && $numOpts == 2 ) {
	&print_db_formats($ARGV[1]);
}

# List supported styles for a database and format
elsif ( $ARGV[0] eq 'getFormatStyles' && $numOpts == 3 ) {
	&print_format_styles($ARGV[1], $ARGV[2]);
}

# Fetch an entry
elsif ( $ARGV[0] eq 'fetchData' && $numOpts > 1 && $numOpts < 5 ) {
	my $query  = $ARGV[1];
	my $formatName = defined( $ARGV[2] ) ? $ARGV[2] : 'default';
	my $styleName  = defined( $ARGV[3] ) ? $ARGV[3] : 'raw';
	&print_fetch_data($query, $formatName, $styleName);
}

# Fetch a set of entries
elsif ( $ARGV[0] eq 'fetchBatch' && $numOpts > 1 && $numOpts < 6 ) {
	my $dbName = $ARGV[1];
	my $idListStr = $ARGV[2];
	if ( $idListStr eq '-' ) {    # Read from STDIN
		my $buffer;
		$idListStr = '';
		while ( sysread( STDIN, $buffer, 1024 ) ) {
			$idListStr .= $buffer;
		}
	}
	$idListStr =~ s/[ \t\n\r;]+/,/g;    # Id list should be comma seperated
	$idListStr =~ s/,+/,/g;             # Remove any empty items
	my $formatName = defined( $ARGV[3] ) ? $ARGV[3] : 'default';
	my $styleName  = defined( $ARGV[4] ) ? $ARGV[4] : 'raw';
	&print_fetch_batch($dbName, $idListStr, $formatName, $styleName);
}

# Unrecgnised method, or too many/few arguments so print usage
else {
	print STDERR
	  "Error: unrecognised method ($ARGV[0]) or too many arguments\n";
	usage();
	exit(2);
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

=head2 soap_get_supported_dbs()

Get the list of supported databases.

  my (@supported_dbs) = &soap_get_supported_dbs();

=cut

sub soap_get_supported_dbs {
	print_debug_message( 'soap_get_supported_dbs', 'Begin', 1 );
	my $response = &soap_request( 'getSupportedDBs', {} );
	my $dbNameListRef = $response->{'parameters'}->{'getSupportedDBsReturn'};
	die "Error: undefined database name list returned by service" if ( !defined($dbNameListRef) );
	print_debug_message( 'soap_get_supported_dbs', 'End', 1 );
	return @$dbNameListRef;
}

=head2 print_supported_dbs()

Print the list of supported databases.

  &print_supported_dbs();

=cut

sub print_supported_dbs {
	print_debug_message( 'print_supported_dbs', 'Begin', 1 );
	my (@supported_dbs) = soap_get_supported_dbs();
	foreach my $item (@supported_dbs) {
		print $item, "\n";
	}
	print_debug_message( 'print_supported_dbs', 'End', 1 );
}

=head2 soap_get_supported_formats()

Get the list of supported formats for each database.

  my (@supported_formats) = &soap_get_supported_formats();

=cut

sub soap_get_supported_formats {
	print_debug_message( 'soap_get_supported_formats', 'Begin', 1 );
	my $response = &soap_request( 'getSupportedFormats', {} );
	my $formatNameListRef = $response->{'parameters'}->{'getSupportedFormatsReturn'};
	die "Error: undefined format name list returned by service" if ( !defined($formatNameListRef) );
	print_debug_message( 'soap_get_supported_formats', 'End', 1 );
	return @$formatNameListRef;
}

=head2 print_supported_formats()

Print the list of supported formats for each database.

  &print_supported_formats();

=cut

sub print_supported_formats {
	print_debug_message( 'print_supported_formats', 'Begin', 1 );
	my (@supported_formats) = soap_get_supported_formats();
	foreach my $item (@supported_formats) {
		print $item, "\n";
	}
	print_debug_message( 'print_supported_formats', 'End', 1 );
}

=head2 soap_get_supported_styles()

Get the list of supported styles for each database.

  my (@supported_styles) = &soap_get_supported_styles();

=cut

sub soap_get_supported_styles {
	print_debug_message( 'soap_get_supported_styles', 'Begin', 1 );
	my $response = &soap_request( 'getSupportedStyles', {} );
	my $styleNameListRef = $response->{'parameters'}->{'getSupportedStylesReturn'};
	die "Error: undefined style name list returned by service" if ( !defined($styleNameListRef) );
	print_debug_message( 'soap_get_supported_styles', 'End', 1 );
	return @$styleNameListRef;
}

=head2 print_supported_styles()

Print the list of supported styles for each database.

  &print_supported_styles();

=cut

sub print_supported_styles {
	print_debug_message( 'print_supported_styles', 'Begin', 1 );
	my (@supported_styles) = soap_get_supported_styles();
	foreach my $item (@supported_styles) {
		print $item, "\n";
	}
	print_debug_message( 'print_supported_styles', 'End', 1 );
}

=head2 soap_get_db_formats($dbName)

Get the list of supported formats for a database.

  my (@supported_formats) = &soap_get_db_formats();

=cut

sub soap_get_db_formats {
	print_debug_message( 'soap_get_db_formats', 'Begin', 1 );
	my $dbName = shift;
	my $response = &soap_request( 'getDbFormats', {'db' => $dbName} );
	my $formatNameListRef = $response->{'parameters'}->{'getDbFormatsReturn'};
	die "Error: undefined format name list returned by service" if ( !defined($formatNameListRef) );
	print_debug_message( 'soap_get_db_formats', 'End', 1 );
	return @$formatNameListRef;
}

=head2 print_db_formats()

Print the list of supported formats for a database.

  &print_db_formats($dbName);

=cut

sub print_db_formats {
	print_debug_message( 'print_db_formats', 'Begin', 1 );
	my $dbName = shift;
	my (@supported_formats) = soap_get_db_formats($dbName);
	foreach my $item (@supported_formats) {
		print $item, "\n";
	}
	print_debug_message( 'print_db_formats', 'End', 1 );
}

=head2 soap_get_format_styles()

Get the list of supported styles for a format of a database.

  my (@supported_styles) = &soap_get_format_styles($dbName, $formatName);

=cut

sub soap_get_format_styles {
	print_debug_message( 'soap_get_format_styles', 'Begin', 1 );
	my $dbName = shift;
	my $formatName = shift;
	my $response = &soap_request( 'getFormatStyles', {'db' => $dbName, 'format' => $formatName} );
	my $styleNameListRef = $response->{'parameters'}->{'getFormatStylesReturn'};
	die "Error: undefined style name list returned by service" if ( !defined($styleNameListRef) );
	print_debug_message( 'soap_get_format_styles', 'End', 1 );
	return @$styleNameListRef;
}

=head2 print_format_styles()

Print the list of supported styles for a format of a database.

  &print_format_styles($dbName, $formatName);

=cut

sub print_format_styles {
	print_debug_message( 'print_format_styles', 'Begin', 1 );
	my $dbName = shift;
	my $formatName = shift;
	my (@supported_styles) = soap_get_format_styles($dbName, $formatName);
	foreach my $item (@supported_styles) {
		print $item, "\n";
	}
	print_debug_message( 'print_format_styles', 'End', 1 );
}

=head2 soap_fetch_data()

Fetch an entry.

  my $entryStr = &soap_fetch_data($query, $formatName, $styleName);

=cut

sub soap_fetch_data {
	print_debug_message( 'soap_fetch_data', 'Begin', 1 );
	my $query = shift;
	my $formatName = shift;
	my $styleName = shift;
	my $response = &soap_request( 'fetchData', {
			'query' => $query, 
			'format' => $formatName,
			'style' => $styleName
		}
	);
	my $entryRef = $response->{'parameters'}->{'fetchDataReturn'};
	die "Error: undefined entry data returned by service" if ( !defined($entryRef) );
	print_debug_message( 'soap_fetch_data', 'End', 1 );
	return $entryRef;
}

=head2 print_fetch_data()

Fetch an entry and print it.

=cut

sub print_fetch_data {
	print_debug_message( 'print_fetch_data', 'Begin', 1 );
	my $query = shift;
	my $formatName = shift;
	my $styleName = shift;
	my $entryStr = &soap_fetch_data($query, $formatName, $styleName);
	print $entryStr, "\n" if($entryStr);
	print_debug_message( 'print_fetch_data', 'End', 1 );
}

=head2 soap_fetch_batch()

Fetch a set of entries.

  my $entriesStr = &soap_fetch_batch($dbName, $idListStr, $formatName, $styleName);

=cut

sub soap_fetch_batch {
	print_debug_message( 'soap_fetch_batch', 'Begin', 1 );
	my $dbName = shift;
	my $idListStr = shift;
	my $formatName = shift;
	my $styleName = shift;
	my $response = &soap_request( 'fetchBatch', {
			'db' => $dbName,
			'ids' => $idListStr,
			'format' => $formatName,
			'style' => $styleName
		}
	);
	my $entriesRef = $response->{'parameters'}->{'fetchBatchReturn'};
	die "Error: undefined entry data returned by service" if ( !defined($entriesRef) );
	print_debug_message( 'soap_fetch_batch', 'End', 1 );
	return $entriesRef;
}

=head2 print_fetch_batch()

Fetch a set of entries an print them.

  &print_fetch_batch($dbName, $idListStr, $formatName, $styleName);

=cut

sub print_fetch_batch {
	print_debug_message( 'print_fetch_batch', 'Begin', 1 );
	my $dbName = shift;
	my $idListStr = shift;
	my $formatName = shift;
	my $styleName = shift;
	my $entriesStr = &soap_fetch_batch($dbName, $idListStr, $formatName, $styleName);
	print $entriesStr, "\n" if($entriesStr);
	print_debug_message( 'print_fetch_batch', 'End', 1 );
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

=head2 usage()

Print program usage.

  &usage();

=cut

sub usage {
	print STDERR <<EOF
Usage:
  $scriptName <method> [arguments...] [--trace] [--WSDL <wsdlUrl>]

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

  dbName:id  database name and entry ID or accession (e.g. UNIPROT:WAP_RAT)
  format     format to retrive (e.g. uniprot)
  style      style to retrive (e.g. raw)

Fetching entries: fetchBatch

  $scriptName fetchBatch <dbName> <idList> [format [style]]

  dbName     database name (e.g. UNIPROT)
  idList     list of entry IDs or accessions (e.g. 1433T_RAT,WAP_RAT).
             Maximum of 200 IDs or accessions. "-" for STDIN.
  format     format to retrive (e.g. uniprot)
  style      style to retrive (e.g. raw)

EOF
	  ;
}
