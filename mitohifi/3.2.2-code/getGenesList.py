"""This script returns a list of annotated genes. 

It recognizes annotations in either genbank or GFF format.

"""

import sys
from   Bio import SeqIO


name_replacement = {"NADH dehydrogenase subunit 6": "ND6",
                    "NADH dehydrogenase subunit 4L": "ND4L",
                    "12S ribosomal RNA": "s-rRNA",
                    "NADH dehydrogenase subunit 1": "ND1",
                    "ATP synthase F0 subunit 6": "ATP6",
                    "NADH dehydrogenase subunit 2": "ND2",
                    "cytochrome b": "CYTB",
                    "cytochrome c oxidase subunit III": "COIII",
                    "NADH dehydrogenase subunit 4": "ND4",
                    "cytochrome c oxidase subunit I": "COI",
                    "cytochrome c oxidase subunit II": "COII",
                    "16S ribosomal RNA": "l-rRNA",
                    "NADH dehydrogenase subunit 3": "ND3",
                    "NADH dehydrogenase subunit 5": "ND5",
                    "ribosomal protein S3": "rpS3"}

def get_genes_list(in_annotation, format="genbank"):
    """
    Takes a GFF/Genbank file and returns a list of annotated genes.
    """
    
    genes = []
    
    if format == "genbank":
        for record in SeqIO.parse(in_annotation, format):
            for feat in record.features:
                if feat.type in ["tRNA", "rRNA"]:
                    genes.append(feat.qualifiers['product'][0])
                    #genes.append([feat.qualifiers['product'], feat.location])
                elif feat.type == "CDS":
                    try:
                        genes.append(feat.qualifiers['gene'][0])
                    except KeyError:
                        #genes.append(feat.qualifiers['product'][0])
                        product = feat.qualifiers['product'][0]
                        if product == "hypothetical protein":
                            continue
                        if product not in name_replacement:
                            raise Exception(f"Not found: {product}")
                        gene = name_replacement[product]
                        genes.append(gene)
                        # = [gene if gene not in name_replacement else name_replacement[gene] for gene in genes]
                    #genes.append([feat.qualifiers['gene'], feat.location])
    
    elif format == "gff":
        with open(in_annotation, "r") as f:
            for line in f:
                feat_type = line.split("\t")[2]
                if feat_type in ["ncRNA_gene", "gene"]:
                    gene_name = line.split("\t")[-1].split(";")[-1].replace("gene_id=", "").strip()
                    genes.append(gene_name)
    else:
        sys.exit("Incompatible format, please specify either genbank or gff")
        
    return genes 

if __name__ == "__main__":
    in_annotation = sys.argv[1]
    format = sys.argv[2]
    genes = get_genes_list(in_annotation, format)
    print(genes)
