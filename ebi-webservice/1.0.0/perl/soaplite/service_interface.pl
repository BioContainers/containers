#!/usr/bin/env perl

=head1 NAME

service_interface.pl

=head1 DESCRIPTION

Show interface for a SOAP service.

Tested with:

=over

=item *
L<SOAP::Lite> 0.60 and Perl 5.8.3

=item *
L<SOAP::Lite> 0.69 and Perl 5.8.8

=item *
L<SOAP::Lite> 0.71 and Perl 5.8.8

=item *
L<SOAP::Lite> 0.710.08 and Perl 5.10.0 (Ubuntu 9.04)

=back

See:

=over

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
#use strict;
use warnings;

# Load libraries
use Getopt::Long qw(:config no_ignore_case bundling);
use File::Basename;
use LWP;
use Digest::MD5 qw(md5_hex);
use XML::Simple;
use SOAP::Lite;
use Data::Dumper;

# WSDL URL for service
my $WSDL;

# Output level
my $outputLevel = 1;

# Process command-line options
my $numOpts = scalar(@ARGV);
my %params = ( 'debugLevel' => 0 );
GetOptions(
	'operation=s'   => \$params{'operation'}, # Operation to perform
	# Generic options
	'help|h'        => \$params{'help'},           # Usage help
	'quiet'         => \$params{'quiet'},          # Decrease output level
	'verbose'       => \$params{'verbose'},        # Increase output level
	'debugLevel=i'  => \$params{'debugLevel'},     # Debug output level
	'trace'         => \$params{'trace'},          # SOAP message debug
);
&print_debug_message( 'MAIN', "params:\n" . Dumper(\%params), 2 );
$outputLevel++ if ( $params{'verbose'} );
$outputLevel-- if ( $params{'quiet'} );
&print_debug_message( 'MAIN', 'outputLevel: ' . $outputLevel, 2 );

# Get the script filename for use in usage messages
my $scriptName = basename( $0, () );

# Print usage and exit if requested
if ( $params{'help'} || $numOpts == 0 ) {
	&usage();
	exit(0);
}

if(scalar(@ARGV) < 1) {
	die 'Error: WSDL URL required to check SOAP service. See --help.';
}
$WSDL = $ARGV[0];

# If required enable SOAP message trace
if ( $params{'trace'} ) {
	print STDERR "Tracing active\n" if($outputLevel > 0);
	SOAP::Lite->import( +trace => 'debug' );
}

# In debug mode show the service WSDL being used.
&print_debug_message( 'MAIN', 'wsdl: ' . $WSDL, 2 ) if(defined($WSDL));

# Directly fetch the WSDL.
my  $response = &getUrl($WSDL);
# Check if document is a WSDL
if(&isWsdl($response->content)) {
	# Print WSDL summary information
	print '++Service WSDL++', "\n\n" if($outputLevel > 0);
	&docInfo($response);
	print "\n" if($outputLevel > 0);
	# SOAP service interface from WSDL
	my $soap = &getSoapProxy($WSDL);
	# List operations from the WSDL, using the proxy object.
	print '++Operations List++', "\n\n" if($outputLevel > 0);
	&listObjMethods($soap);
	print "\n" if($outputLevel > 0);
	# Invoke an operation
	if($params{'operation'}) {
		print '++Invoke Operation++', "\n\n" if($outputLevel > 0);
		print 'Operation: ', $params{'operation'}, "\n";
		&invokeSoapOp($soap, $params{'operation'});
		print "\n" if($outputLevel > 0);
	}
}
# Not a WSDL...
# TODO: REST checks instead?
else {
	# Print document summary information
	print '++Document++', "\n\n" if($outputLevel > 0);
	&docInfo($response);
	print "\n" if($outputLevel > 0);

	# Not a WSDL so die anyway.
	die 'Error: not a WSDL: ' . $WSDL;
}

=head1 FUNCTIONS

=cut


=head2 getUrl()

Get a document from a URL using a HTTP GET.

  my  $response = &getUrl($url);

=cut

sub getUrl($) {
	&print_debug_message('getUrl', 'Begin', 1);
	my $url = shift;
	my $ua = LWP::UserAgent->new();
	$ua->env_proxy;
	my $response = $ua->get($WSDL);
	&print_debug_message( 'MAIN', 'HTTP status: ' . $response->code, 2 );
	&print_debug_message( 'MAIN', "response:\n" . Dumper($response), 11 );
	# Check for HTTP error codes
	if($response->is_error) {
   		die 'Error: http request failed for ' . $WSDL . ', status: ' . $response->code . ' ' . $response->message;
	}
	&print_debug_message('getUrl', 'End', 1);
	return $response;
}

=head2 isWsdl()

Test a document to determine if it is a WSDL document.

Checks that the document is a XML-like document and that the root tag is 
'defintitions'.

  &isWsdl($response->content);

TODO: this is a basic check. The checks should confirm this is an XML document 
using the WSDL and SOAP namespaces, andd that it validates against the 
appropriate WSDL schema(s).

=cut

sub isWsdl($) {
	&print_debug_message('isWsdl', 'Begin', 1);
	my $docStr = shift;
	my $retVal = 0;
	&print_debug_message('isWsdl', "docStr:\n" . $docStr, 2);
	# Is this XML? Should be able to check for "<?xml ", but this is missing 
	# on some docs, so just look for something tag like.
	if($docStr =~ m/^\s*<\??\w+/) {
		&print_debug_message('isWsdl', 'looks like an ?ML', 2);
		# Check that the root tag is 'definitions'.
		my $xmlDoc = XMLin($docStr, KeepRoot => 1);
		my ($rootTagName) = keys(%$xmlDoc);
		&print_debug_message('isWsdl', 'rootTagName: ' . $rootTagName, 2);
		if($rootTagName eq 'definitions' || $rootTagName =~ m/:definitions$/) {
			$retVal = 1;
		}
	}
	&print_debug_message('isWsdl', 'End', 1);
	return $retVal;
}

=head2 docInfo()

Display some information about the document.

This includes the URL, the content type from the HTTP header and an MD5 
checksum for the document.

If set, the "last modification" time from the HTTP header is also reported. 
This is usually only present for static documents and is derived from the 
modification time of the file.  

  &docInfo($response);

=cut

sub docInfo($) {
	&print_debug_message('docInfo', 'Begin', 1);
	my $response = shift;
	print 'URL: ', $WSDL, "\n";
	print 'Modification Date: ', $response->header('last-modified'), "\n" if($response->header('last-modified'));
	print 'Content type: ', $response->header('content-type'), "\n";
	my $md5Digest = md5_hex($response->content());
	print 'MD5: ', $md5Digest, "\n";
	&print_debug_message('docInfo', 'End', 1);
}

=head2 getSoapProxy()

Create an interface proxy object for a SOAP service using a WSDL. This 
includes a fault handler to map SOAP faults into Perl exceptions (die).

This uses the SOAP::Lite->service() method to generate the service interface
object. Since this maps the data structure returned by an operation into a 
hash, repeating elements are collapsed to a single instance.

  my $soap = &getSoapProxy($WSDL);

=cut

sub getSoapProxy() {
	&print_debug_message('getSoapProxy', 'Begin', 1);
	my $WSDL = shift;
	# Create the service interface, setting the fault handler to throw exceptions
	my $soap;
	eval {
		$soap = SOAP::Lite->service($WSDL)->proxy(
			'http://localhost/',
			#proxy => ['http' => 'http://your.proxy.server/'], # HTTP proxy
			timeout => 600,    # HTTP connection timeout
  		)->on_fault(
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
	} || ( chomp($@) && die 'Error: unable to create SOAP interface for: ' . $WSDL . " ($@)\n" );
	&print_debug_message('getSoapProxy', 'End', 1);
  	return $soap;
}

=head2 listObjMethods()

List the methods of an object.

Uses Perl introspection (package as hash) to get the list of method names.

  &listObjMethods($obj);

=cut

sub listObjMethods($) {
	&print_debug_message('listObjMethods', 'Begin', 1);
	my $obj = shift;
	my $objName = ref($obj);
	my $objPackage = $objName . '::';
	foreach my $item (sort keys %{$objPackage}) {
		if($item ne 'AUTOLOAD' && defined &{$objPackage . $item}) {
			print $item, "\n";
		}
	}
	&print_debug_message('listObjMethods', 'End', 1);
}

=head2 invokeSoapOp()

Invoke a named operation on the SOAP interface without any arguments.

SOAP faults are caught and re-thrown.

  &invokeSoapOp($soap, $opName);

=cut

sub invokeSoapOp($$) {
	&print_debug_message('invokeSoapOp', 'Begin', 1);
	my $soap = shift;
	my $opName = shift;
	my $cmd = '\$soap->' . $opName . ';';
	$cmd = 'print Dumper(\$soap->' . $opName . ');' if($outputLevel > 1);
	( eval $cmd && print 'Invocation successful', "\n" ) || ( chomp($@) && die 'Error: SOAP call to ' . $opName . " failed ($@)" );
	&print_debug_message('invokeSoapOp', 'End', 1);
}

=head2 print_debug_message()

Print a debug message to standard error at the specified debug level.

  &print_debug_message($functionName, $message, $level);

=cut

sub print_debug_message($$$) {
	my $function_name = shift;
	my $message       = shift;
	my $level         = shift;
	if ( $level <= $params{'debugLevel'} ) {
		print STDERR '[', $function_name, '()] ', $message, "\n";
	}
}

=head2 usage()

Print usage message for the script.

  &usage();

=cut

sub usage {
	print STDERR <<EOF
SOAP Service
============

  $scriptName <wsdlUrl> [--operation <opName>]

      --operation   : str  : service operation to invoke

  -h, --help        :      : prints this help text
      --quiet       :      : decrease output
      --verbose     :      : increase output
      --debugLevel  : int  : debug output level
      --trace	    :      : show SOAP messages being interchanged 

  http://www.ebi.ac.uk/Tools/webservices/tutorials/perl
EOF
}

=head1 FEEDBACK/SUPPORT

Please contact us at L<http://www.ebi.ac.uk/support/> if you have any 
feedback, suggestions or issues with the service or this client.

=cut
