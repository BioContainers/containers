# Container image for CADD-scripts

This container image lets you use the CADD scripts snakemake pipeline to annotate variants.
Documentation for CADD-scripts is here:

https://github.com/kircherlab/CADD-scripts


To use this container image you also need to mount the reference data. Assume you have
downloaded the reference data to a directory `$REFPATH`, such that it looks something
like this:

    $ ls $REFPATH
    GRCh37_v1.6

Then use the following options

Singularity/Apptainer:

    -B $REFPATH:/opt/CADD-scripts-1.6.post1/data/annotations

Docker:

    -v $REFPATH:/opt/CADD-scripts-1.6.post1/data/annotations


