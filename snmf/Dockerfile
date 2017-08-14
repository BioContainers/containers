# Base Image
FROM ubuntu

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="snmf"
LABEL software.version="2.0"
LABEL description="SMNF tool"
LABEL website="http://membres-timc.imag.fr/Olivier.Francois/snmf/index.htm"
LABEL documentation="http://membres-timc.imag.fr/Olivier.Francois/snmf/files/note.pdf"
LABEL tags="Genomics"

ENV HOME=/tool
WORKDIR $HOME
ADD ./* $HOME/
RUN	apt-get update && \
	apt-get install perl -y && \
	apt-get install build-essential -y && \
	apt-get install bioperl -y && \
	apt-get install libpar-packer-perl -y && \
	apt-get install wget -y && \
	apt-get install libswitch-perl -y && \
	chmod -R 777 $HOME && \
	wget http://membres-timc.imag.fr/Olivier.Francois/snmf/files/sNMF_CL_v1.2.zip && \ 
	unzip sNMF_CL_v1.2.zip && \
	rm sNMF_CL_v1.2.zip && \
	mv sNMF_CL_v1.2/* ./ && \
	rm -rf sNMF_CL_v1.2/ && \
	rm -rf examples/ && \
	rm -rf documentation/ && \
	rm README && \
	chmod +x $HOME/snmf.sh && \
	chmod +x plink && \
	chmod +x install.command && \
	./install.command && \
	ln -s /tool/bin/sNMF /usr/bin/ && \
	pp -o run_pipeline Snmf.pl && \
	apt-get purge build-essential -y && \
	apt-get purge bioperl -y && \
	apt-get purge libpar-packer-perl -y && \
	apt-get purge perl -y && \
	apt-get purge libswitch-perl -y && \
	rm -f /usr/local/bin/wget && \
	apt-get autoremove -y 
