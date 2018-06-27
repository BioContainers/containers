# $Id: test.makefile 2794 2014-09-17 13:05:56Z uludag $
# ======================================================================
# 
# Copyright 2012-2014 EMBL - European Bioinformatics Institute
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 
# ======================================================================
#
# Test EBI Search sample LWP based web services client.
#
# ======================================================================

# Perl installation to use (each installation contains different versions
# of the required libraries).
PERL = perl
#PERL = /ebi/extserv/bin/perl/bin/perl
#PERL = /ebi/extserv/bin/perl-5.10.1/bin/perl
#PERL = /sw/arch/bin/perl

# Run all test sets
all: \
ebeye 


# EBI Search
ebeye: getDomainHierarchy \
getDomainDetails \
getNumberOfResults \
getResults \
getResults2 \
getFacetedResults \
getEntries \
getDomainsReferencedInDomain \
getDomainsReferencedInEntry \
getReferencedEntries \
getTopTerms \
getMoreLikeThis \
getExtendedMoreLikeThis \
getAutoComplete

getDomainHierarchy:
	${PERL} ebeye_lwp.pl getDomainHierarchy

getDomainDetails:
	${PERL} ebeye_lwp.pl getDomainDetails uniprot

getNumberOfResults:
	${PERL} ebeye_lwp.pl getNumberOfResults uniprot 

getResults:
	${PERL} ebeye_lwp.pl getResults rnacentral 'hotair' id,name --size=5 --start=5 --fieldurl=true --viewurl=true --sortfield=boost --order=descending

getResults2:
	${PERL} ebeye_lwp.pl getResults rnacentral 'hotair' id,name --size=5 --start=5 --fieldurl=true --viewurl=true --sort=boost:descending

getFacetedResults:
	${PERL} ebeye_lwp.pl getFacetedResults  rnacentral 'hotair' id,descRecName --size=5 --start=5 --fieldurl=true --viewurl=true --sortfield=boost --order=descending --facetcount=5 --facetfields=TAXONOMY --facets=active:Active

getEntries:
	${PERL} ebeye_lwp.pl getEntries uniprot WAP_MOUSE,WAP_RAT id,descRecName --fieldurl=true --viewurl=true

getDomainsReferencedInDomain:
	${PERL} ebeye_lwp.pl getDomainsReferencedInDomain uniprot

getDomainsReferencedInEntry:
	${PERL} ebeye_lwp.pl getDomainsReferencedInEntry uniprot WAP_MOUSE

getReferencedEntries:
	${PERL} ebeye_lwp.pl getReferencedEntries uniprot WAP_MOUSE,WAP_RAT interpro id,description --size=1 --start=0 --fieldurl=true --viewurl=true --facetcount=5

getTopTerms:
	${PERL} ebeye_lwp.pl getTopTerms pride description --size=30 --excludes=proteome --excludesets=omics_stopwords

getMoreLikeThis:
	${PERL} ebeye_lwp.pl getMoreLikeThis uniprot TPIS_HUMAN descRecName --size=20 --start=0 --fieldurl=true --viewurl=true --mltfields=descRecName --mintermfreq=1 --mindocfreq=5 --maxqueryterm=10 --excludes=state --excludesets=lucene_stopwords

getExtendedMoreLikeThis:
	${PERL} ebeye_lwp.pl getExtendedMoreLikeThis uniprot TPIS_HUMAN uniprot descRecName --size=20 --start=0 --fieldurl=true --viewurl=true --mltfields=descRecName --mintermfreq=1 --mindocfreq=5 --maxqueryterm=10 --excludes=state --excludesets=lucene_stopwords

getAutoComplete:
	${PERL} ebeye_lwp.pl getAutoComplete rnacentral hot
	