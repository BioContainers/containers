# EBI Web Services Perl LWP Clients

A set of sample clients for the EBI Web Services written in Perl using the
LWP module(s) to access the REST web services.

For more information see:

* http://www.ebi.ac.uk/Tools/webservices/
* http://www.ebi.ac.uk/Tools/webservices/tutorials/06_programming/perl

## Requirements

Perl 5: included in most UNIX/Linux/MacOSX environments. Perl modules, install via OS package manager or from CPAN:

* XML::Simple
* YAML::Syck

See also [INSTRUCTIONS.md](INSTRUCTIONS.md).

## Tests

A make file of simple test commands is supplied to check that the clients work
as expected. This can be run using:

```
make -f test.makefile
```
