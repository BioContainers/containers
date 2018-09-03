###################################################################################################
## Usage- python new_PED_and_add_genotype.py old_PED_file.txt new_PED_file.txt phased_three_sample_VCF.vcf Updated_with_genotype.vcf
## old_PED_file.txt - PED file with 6 samples(two trio families) 
## new_PED_file.txt - PED file with 3 samples (Output PED file with one trio family)
## phased_three_sample_VCF.vcf - Phased VCF from genomeGPS with three samples 
## Updated_with_genotype.vcf - Output VCF file with added genotype information in INFO
###################################################################################################


import sys

##Opening PED file with 6 lines and reading lines
PED_input=open(sys.argv[1], 'r')
PED=PED_input.readlines()

#Opening an empty file to write only three samples 
PED_out=open(sys.argv[2], "w")


## for loop readin each line  in initial PED file with 6 samples
for line in PED:
	line=line.split()
	if line[0] != "controlFAM":		## if statement to check if first string in the line start with controlFAM
		for i in line:			
			PED_out.write(i+"\t")	## if passes the if statement, then write to the new PED file
		PED_out.write("\n")

infile=open(sys.argv[3], 'r')	#open the original VCF file and read lines in it
input=infile.readlines()					


out=open(sys.argv[4], 'w')		# open output file to write the entire VCF file and the modified INFO field

for line in input: 			# for loop readin every line from old VCF
        line=line.split()
	if line[0]=="#CHROM":		# if line start with #CHROM
		child=line[-3]		#Get sample names from #CHROM line to declare variable child, mom and dad
		mom=line[-2]
		dad=line[-1]
		# info lines to be included in the header
		out.write("##INFO=<ID="+child+"_GT,Number=1,Type=String,Description="+'"'+"Child Genotype"+'">'+"\n")
		out.write("##INFO=<ID="+mom+"_GT,Number=1,Type=String,Description="+'"'+"Mom Genotype"+'">'+"\n")
		out.write("##INFO=<ID="+dad+"_GT,Number=1,Type=String,Description="+'"'+"Dad Genotype"+'">'+"\n")	
		
		for i in line:		# print each string with a tab space in #CHROM line
			out.write(i+"\t")
        elif line[0].startswith("#") and line[0]!="#CHROM":	#The rest of the lines which start with a "#" are copied as they are
                for i in line:
                        out.write(i+" ")



        else:				
		# GT is a variable that contains genotype info which will be printed as the last element in INFO field
		GT=child+"_GT="+line[-3][0:3]+";"+mom+"_GT="+line[-2][0:3]+";"+dad+"_GT="+line[-1][0:3]
                for i in range(len(line)):		# for looping every string in a line to write to the output file
                        if int(i) <= 6:
                                out.write(line[i]+"\t")
                        if i == 7:
                                out.write(line[i]+";"+GT+"\t")
			if i>=8:
				out.write(line[i]+"\t")

        out.write("\n")


