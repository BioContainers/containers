ShotMAP
=======

A Shotgun Metagenome Annotation Pipeline

Version: v1.1

Overview
--------

Shotmap is a software workflow that functionally annotates and compares shotgun metagenomes. Specifically, it will:

1.  Compared unassembled or assembled metagenomic sequences to a protein family database
2.  Calculate metagenome functional abundance and diversity
3.  Compare metagenomes using a variety of statistical and ecological tools
4.  Identify protein families that differentiate metagenomes using robust statistical tests

Shotmap can be run on a multicore computer or can optionally interface with an SGE-configured computing cluste (i.e., a cloud). 
Shotmap can also optionally manage the information and data associated with this workflow in a relational database.

Quickstart
----------

The fastest way to get shotmap working on your data is to first build a search database (which only needs to be done one time):

    perl $SHOTMAP_LOCAL/scripts/build_shotmap_searchdb.pl -r=</directory/path/to/reference/database> -d=</directory/path/to/search/database>

And then execute ShotMAP:
     
     perl $SHOTMAP_LOCAL/scripts/shotmap.pl -i=</directory/path/to/metagenomes> -d=</directory/path/to/search/database> -o=</directory/path/to/result/database/>

And then compare the results (if more than one sample):
   
    perl $SHOTMAP_LOCAL/scripts/compare_shotmap_results.pl -i=</directory/path/to/result/database/> -m=</path/to/optional/metadata/file> -o=</directory/path/to/new/result/directory/>

Documentation Table of Contents
-------------------------------

1. [Workflow Synopsis](docs/workflow_synopsis.md)
2. [Overview on How to Run ShotMAP](docs/running_shotmap.md)
3. [Dependencies](docs/dependencies.md)
4. [Installation Guide](docs/installation_guide.md)
5. [Building a ShotMAP Search Database](docs/search_databases.md)
6. [Metadata Files](docs/metadata_files.md)
7. [Workflow Output](docs/output.md)
8. Script Documentation
    * [install.pl](docs/install.pl.md)
    * [test_shotmap.pl](docs/test_shotmap.pl.md)
    * [build_shotmap_searchdb.pl](docs/build_shotmap_searchdb.pl.md)
    * [shotmap.pl](docs/shotmap.pl.md)
    * [compare_shotmap_samples.pl](docs/compare_shotmap_samples.pl.md)
    * [test_config_file.pl](docs/test_config_file.pl.md)
9. Advanced Documentation
    * [configuration files](docs/config_files.md)
    * [remote (cloud) users](docs/remote_users.md)
    * [relational database users](docs/relational_database_users.md)

Change Log
----------

v1.1 - 2016.04.26
* update to indexed database file names
* changes to shotmap.R to handle variation in R version
* error handline in shotmap.R for qvalue calculation
* bug fixes in installer script to work on more general systems
* addition of scripts/run_tests.pl
* change in rapsearch options to reduce disc footpring