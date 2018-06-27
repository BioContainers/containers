# $Id$
# ======================================================================
# 
# Copyright 2012-2013 EMBL - European Bioinformatics Institute
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
# Test sample EMBL-EBI XML::Compile::SOAP web services clients.
#
# ======================================================================

# Perl installation to use (each installation contains different versions
# of the required libraries).
PERL = perl
#PERL = /ebi/extserv/bin/perl/bin/perl
#PERL = /sw/arch/bin/perl

# User e-mail address to use for the requests.
#EMAIL = email@example.org
EMAIL = support@ebi.ac.uk

# Source for test data used by the tests.
TEST_DATA_SVN=https://svn.ebi.ac.uk/webservices/webservices-2.0/trunk/test_data/

# Run all test sets
all: \
dbfetch \
iprscan5 \
ncbiblast

clean: \
dbfetch_clean \
iprscan5_clean \
ncbiblast_clean

# Fetch/update test data.
test_data:
	-if [ -d ../test_data ]; then svn update ../test_data ; else svn co ${TEST_DATA_SVN} ../test_data ; fi

# WSDbfetch Document/literal SOAP
dbfetch: dbfetch_getSupportedDBs dbfetch_getSupportedFormats dbfetch_getSupportedStyles dbfetch_getDbFormats dbfetch_getFormatStyles dbfetch_fetchData dbfetch_fetchBatch

dbfetch_getSupportedDBs:
	${PERL} wsdbfetch_xmlcompile.pl getSupportedDBs > dbfetch-getSupportedDBs.txt

dbfetch_getSupportedFormats:
	${PERL} wsdbfetch_xmlcompile.pl getSupportedFormats > dbfetch-getSupportedFormats.txt

dbfetch_getSupportedStyles:
	${PERL} wsdbfetch_xmlcompile.pl getSupportedStyles > dbfetch-getSupportedStyles.txt

dbfetch_getDbFormats:
	${PERL} wsdbfetch_xmlcompile.pl getDbFormats uniprotkb > dbfetch-getDbFormats.txt

dbfetch_getFormatStyles:
	${PERL} wsdbfetch_xmlcompile.pl getFormatStyles uniprotkb default > dbfetch-getFormatStyles.txt

dbfetch_fetchData: dbfetch_fetchData_string dbfetch_fetchData_file dbfetch_fetchData_stdin

dbfetch_fetchData_string:
	${PERL} wsdbfetch_xmlcompile.pl fetchData 'UNIPROTKB:WAP_RAT' > dbfetch-fetchData.txt

dbfetch_fetchData_file: test_data
	echo 'TODO:' $@

dbfetch_fetchData_stdin: test_data
	echo 'TODO:' $@

dbfetch_fetchBatch: dbfetch_fetchBatch_string dbfetch_fetchBatch_file dbfetch_fetchBatch_stdin

dbfetch_fetchBatch_string:
	${PERL} wsdbfetch_xmlcompile.pl fetchBatch uniprotkb 'WAP_RAT,WAP_MOUSE' > dbfetch-fetchBatch.txt

dbfetch_fetchBatch_file: test_data
	echo 'TODO:' $@

dbfetch_fetchBatch_stdin: test_data
	echo 'TODO:' $@

dbfetch_clean:
	rm -f dbfetch-*

# InterProScan
iprscan5: iprscan5_params iprscan5_param_detail \
iprscan5_file iprscan5_dbid iprscan5_stdin_stdout \
iprscan5_id_list_file iprscan5_id_list_file_stdin_stdout \
iprscan5_multifasta_file iprscan5_multifasta_file_stdin_stdout

iprscan5_params:
	${PERL} iprscan5_xmlcompile.pl --params

iprscan5_param_detail:
	${PERL} iprscan5_xmlcompile.pl --paramDetail appl

iprscan5_file: test_data
	${PERL} iprscan5_xmlcompile.pl --email ${EMAIL} ../test_data/SWISSPROT_ABCC9_HUMAN.fasta

iprscan5_dbid:
	${PERL} iprscan5_xmlcompile.pl --email ${EMAIL} 'UNIPROT:ABCC9_HUMAN'

iprscan5_stdin_stdout: test_data
	cat ../test_data/SWISSPROT_ABCC9_HUMAN.fasta | ${PERL} iprscan5_xmlcompile.pl --email ${EMAIL} --quiet --outformat out --outfile - - > iprscan5-blah.txt

iprscan5_id_list_file: test_data
	${PERL} iprscan5_xmlcompile.pl --email ${EMAIL} --outformat out --outfile - @../test_data/uniprot_id_list.txt

iprscan5_id_list_file_stdin_stdout: test_data
	echo 'TODO:' $@

iprscan5_multifasta_file: test_data
	${PERL} iprscan5_xmlcompile.pl --email ${EMAIL} --outformat out --outfile - --multifasta  ../test_data/multi_prot.tfa

iprscan5_multifasta_file_stdin_stdout: test_data
	echo 'TODO:' $@

iprscan5_clean:
	rm -f iprscan5-*

# NCBI BLAST
ncbiblast: ncbiblast_params ncbiblast_param_detail ncbiblast_file ncbiblast_dbid ncbiblast_stdin_stdout ncbiblast_id_list_file ncbiblast_id_list_file_stdin_stdout ncbiblast_multifasta_file ncbiblast_multifasta_file_stdin_stdout

ncbiblast_params:
	${PERL} ncbiblast_xmlcompile.pl --params

ncbiblast_param_detail:
	${PERL} ncbiblast_xmlcompile.pl --paramDetail program

ncbiblast_file: test_data
	${PERL} ncbiblast_xmlcompile.pl --email ${EMAIL} --program blastp --database uniprotkb_swissprot --scores 10 --alignments 10 --stype protein ../test_data/SWISSPROT_ABCC9_HUMAN.fasta

ncbiblast_dbid:
	${PERL} ncbiblast_xmlcompile.pl --email ${EMAIL} --program blastp --database uniprotkb_swissprot --scores 10 --alignments 10 --stype protein 'UNIPROT:ABCC9_HUMAN'

ncbiblast_stdin_stdout: test_data
	cat ../test_data/SWISSPROT_ABCC9_HUMAN.fasta | ${PERL} ncbiblast_xmlcompile.pl --email ${EMAIL} --program blastp --database uniprotkb_swissprot --scores 10 --alignments 10 --stype protein --quiet --outformat out --outfile - - > ncbiblast-blah.txt

ncbiblast_id_list_file: test_data
	echo 'TODO:' $@

ncbiblast_id_list_file_stdin_stdout: test_data
	echo 'TODO:' $@

ncbiblast_multifasta_file: test_data
	echo 'TODO:' $@

ncbiblast_multifasta_file_stdin_stdout: test_data
	echo 'TODO:' $@

ncbiblast_clean:
	rm -f ncbiblast-*
