###################################################################################################################################################
##Usage - python new_PED_and_add_genotype_with_GATK_step_1-18.py VCF-6.vcf PED_6 OUT_PED_3 OUT_VCF3samples_INFO_modified.vcf 
##VCF-6.vcf - VCF file that is generated from genomeGPS pipeline with both trio families
##PED_6 - PED file that contains INFO about all 6 samples(both trio families)
##OUT_PED_3 - Output PED file where the control samples(control trio family) have been trimmed
##OUT_VCF3samples_INFO_modified.vcf- Output VCF file(one trio family) that is generated after genotype infomration has been added to the INFO field
##tool_info -tool_info as given in config files
###################################################################################################################################################

import sys, re
from subprocess import Popen, PIPE
import os.path

	
for string in sys.argv:
	print "ARG = " + string

VCF6samples=sys.argv[1]
(TMP_DIR, FILENAME)=os.path.split(VCF6samples)
PED_file=open(sys.argv[2], 'r')
PED=PED_file.readlines()

exclude_samples=open(TMP_DIR + "/exclude_samples.txt", 'w')
for i in PED:
	i=i.split()
	if i[0]=="CONTROLFAMILY":
		exclude_samples.write(i[1]+"\n")


exclude_samples.close()

tool=open(sys.argv[5], 'r')
toolinfo=tool.readlines()

# Declare variables used later.
ref_path=None
GATK_path=None
JAVA=None

for i in toolinfo:
        if i.startswith("REF_GENOME"):
                ref_path=re.findall(r'\"(.+?)\"', i)
                ref_path=ref_path[0]
        elif i.startswith("GATK="):
                GATK_path=re.findall(r'\"(.+?)\"', i)
                GATK_path=GATK_path[0]
	elif i.startswith("JAVA7="):
                JAVA=re.findall(r'\"(.+?)\"', i)
                JAVA=JAVA[0] + '/java'


print "ref_path=" + ref_path
print "GATK_path=" + GATK_path
print "JAVA=" + JAVA
print JAVA+ ' -Xmx1G '+ '-jar '+ GATK_path + '/GenomeAnalysisTK.jar '+ '-K /biotools/biotools/gatk/current/volety.rama_mayo.edu.key '+ '-et '+ 'NO_ET '+ '-T '+ 'SelectVariants '+ '-R '+ ref_path+ ' --variant '+ VCF6samples+ ' -o '+TMP_DIR + '/VCF-3_no_genotype.vcf '+ '-xl_sf '+ TMP_DIR + '/exclude_samples.txt '+ '-env '

process = Popen([JAVA, '-Xmx1G', '-jar', GATK_path + '/GenomeAnalysisTK.jar', '-K', '/biotools/biotools/gatk/current/volety.rama_mayo.edu.key', '-et', 'NO_ET', '-T', 'SelectVariants', '-R', ref_path, '--variant', VCF6samples, '-o',TMP_DIR + '/VCF-3_no_genotype.vcf', '-xl_sf', TMP_DIR + '/exclude_samples.txt', '-env'], stdout=PIPE, stderr=PIPE)


out_popen=process.communicate()
print out_popen

input=open(TMP_DIR + "/VCF-3_no_genotype.vcf", "r")




#Opening an empty file to write only three samples
PED_out=open(sys.argv[3], "w")


## for loop readin each line  in initial PED file with 6 samples
for line in PED:
        line=line.split()
        if line[0] != "CONTROLFAMILY":             ## if statement to check if first string in the line start with controlFAM
                for i in line:
                        PED_out.write(i+"\t")   ## if passes the if statement, then write to the new PED file
                PED_out.write("\n")

out=open(sys.argv[4], 'w')              # open output file to write the entire VCF file and the modified INFO field


for line in input:                      # for loop readin every line from old VCF
        line=line.split()
        if line[0]=="#CHROM":           # if line start with #CHROM
                child=line[-3]          #Get sample names from #CHROM line to declare variable child, mom and dad
                mom=line[-1]
                dad=line[-2]
                # info lines to be included in the header
                out.write("##INFO=<ID="+child+"_GT,Number=1,Type=String,Description="+'"'+"Child Genotype"+'">'+"\n")
                out.write("##INFO=<ID="+mom+"_GT,Number=1,Type=String,Description="+'"'+"Mom Genotype"+'">'+"\n")
                out.write("##INFO=<ID="+dad+"_GT,Number=1,Type=String,Description="+'"'+"Dad Genotype"+'">'+"\n")

                for i in line:          # print each string with a tab space in #CHROM line
                        out.write(i+"\t")
        elif line[0].startswith("#") and line[0]!="#CHROM":     #The rest of the lines which start with a "#" are copied as they are
                for i in line:
                        out.write(i+" ")



        else:
                # GT is a variable that contains genotype info which will be printed as the last element in INFO field
                GT=child+"_GT="+line[-3][0:3]+";"+mom+"_GT="+line[-1][0:3]+";"+dad+"_GT="+line[-2][0:3]
                for i in range(len(line)):              # for looping every string in a line to write to the output file
                        if int(i) <= 6:
                                out.write(line[i]+"\t")
                        if i == 7:
                                out.write(line[i]+";"+GT+"\t")
                        if i>=8:
                                out.write(line[i]+"\t")

        out.write("\n")

