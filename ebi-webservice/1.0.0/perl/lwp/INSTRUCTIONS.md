# Perl webservice clients

Notes on how to use RESTful clients in Perl (LWP).

## How to start

Clone the repository:

```
git clone https://github.com/ebi-wp/webservice-clients.git
```

```
cd webservice-clients
```

Install dependencies:

In Linux:

```
sudo apt-get install build-essential
```

```
sudo apt install imagemagick
```

```
sudo apt install cpan
```


In Perl:

```
sudo cpan install LWP
```

```
sudo cpan install XML::Simple
```

```
sudo cpan install YAML::Syck
```

```
sudo cpan LWP::Protocol::https
```


NOTA BENE

You might need to install additional operative system dependencies:

```
sudo apt-get install libnet-ssleay-perl libio-socket-ssl-perl
```


## Test the results

Run the selected clients.

For instance:

```
cd webservice-clients/perl/lwp
```

### Example: EBI Search

Get details about the domain 'hgnc':

```
perl ebeye_lwp.pl getDomainDetails hgnc
```


### Example: NCBI Blast

With one sequence

```
perl ncbiblast_lwp.pl --email test@ebi.ac.uk --stype protein --program blastp --database mpro sp:wap_pig
```

With multifasta file

```
perl ncbiblast_lwp.pl --email test@ebi.ac.uk --stype protein --program blastp --database mpro --multifasta --maxJobs 5 test_seq.txt
```

###  Example: Clustal Omega

```
perl clustalo_lwp.pl --email test@ebi.ac.uk sp:wap_rat,sp:wap_pig,sp:wap_mouse
```

###  Example: Simple Phylogeny

```
perl simple_phylogeny_lwp.pl --email test@ebi.ac.uk test_alig.txt
```

###  Example: Fasta

With one sequence:

```
perl fasta_lwp.pl --email test@ebi.ac.uk --stype protein --program fasta --database uniprotkb sp:wap_pig
```

With multifasta file:

```
perl fasta_lwp.pl --email test@ebi.ac.uk --stype protein --program fasta --database uniprotkb --multifasta --maxJobs 5 test_seq.txt
```


If you have no root access to your machine you might need to use [virtualenv](http://docs.python-guide.org/en/latest/dev/virtualenvs/).

## Documentation

More documnetation about the tools in [EBI Tools](https://www.ebi.ac.uk/seqdb/confluence/display/WEBSERVICES/EMBL-EBI+Web+Services).
