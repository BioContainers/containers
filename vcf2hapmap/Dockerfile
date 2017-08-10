FROM alpine

ENV  HOME=/var/opt
COPY vcf2FastaAndHapmap.sh $HOME/
COPY VCF2FastaAndHapmap.pl $HOME/VCF2FastaAndHapmap1.pl
WORKDIR $HOME
RUN apk add --update perl && rm -rf /var/cache/apk/* &&\
	apk add --update perl-par-packer && rm -rf /var/cache/apk/* && \
	apk add --update perl-archive-zip && rm -rf /var/cache/apk/* && \
	apk add --update perl-module-scandeps &&\
	apk add --update perl-par &&\
	apk add --update perl-getopt-argvfile &&\
	apk add --update bash &&\
	pp -o VCF2FastaAndHapmap.pl VCF2FastaAndHapmap1.pl &&\
	apk del perl-par-packer && \
	apk del perl-archive-zip && \
	apk del perl-module-scandeps && \
	apk del perl-par && \
	apk del perl-getopt-argvfile && \
	apk del perl &&\
    chmod +x $HOME/vcf2FastaAndHapmap.sh