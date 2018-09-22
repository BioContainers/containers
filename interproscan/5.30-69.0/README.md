# InterProScan Docker Container

## Run

Download member databases package from ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.30-69.0/alt/ and unpack:


    $ wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.30-69.0/alt/interproscan-data-5.30-69.0.tar.gz
    $ wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.30-69.0/alt/interproscan-data-5.30-69.0.tar.gz.md5
    $ md5sum -c interproscan-data-5.30-69.0.tar.gz.md5 
    interproscan-data-5.30-69.0.tar.gz: OK
    $ tar -zxf interproscan-data-5.30-69.0.tar.gz

Run container:

    $ docker run --rm --name interproscan -v $PWD:/data -v $PWD/interproscan-5.30-69.0/data:/opt/interproscan/data biocontainers/interproscan:v5.30-69.0_cv1 ./interproscan.sh -dp -f tsv -o /data/test_out.ipr -i test_proteins.fasta
    20/08/2018 15:09:16:729 Welcome to InterProScan-5.30-69.0
    20/08/2018 15:09:22:461 Running InterProScan v5 in STANDALONE mode... on Linux
    20/08/2018 15:09:35:187 Loading file /opt/interproscan/test_proteins.fasta
    20/08/2018 15:09:35:189 Running the following analyses:
    [CDD-3.16,Coils-2.2.1,Gene3D-4.2.0,Hamap-2018_03,MobiDBLite-1.5,Pfam-31.0,PIRSF-3.02,PRINTS-42.0,ProDom-2006.1,ProSitePatterns-2018_02,ProSiteProfiles-2018_02,SFLD-3,SMART-7.1,SUPERFAMILY-1.75,TIGRFAM-15.0]
    Pre-calculated match lookup service DISABLED.  Please wait for match calculations to complete...
    20/08/2018 15:09:48:000 25% completed
    20/08/2018 15:10:01:661 56% completed
    20/08/2018 15:10:13:805 77% completed
    20/08/2018 15:10:43:318 90% completed
    20/08/2018 15:11:03:788 100% done:  InterProScan analyses completed


## Development

InterProScan container uses multi-stage builds which are a new feature requiring Docker 17.05 or higher on the daemon and client.

Build container:

    # docker build -t interproscan:local .
