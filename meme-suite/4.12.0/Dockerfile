################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

################## METADATA ######################

LABEL base_image="biocontainers:latest" \
      software="MEME Suite" \
      software.version="4.12.0" \
      description="Motif-based sequence analysis tools" \
      about.home="http://meme-suite.org/" \
      about.documentation="http://meme-suite.org/doc/overview.html?man_type=web" \
      about.license="http://meme-suite.org/doc/copyright.html?man_type=web" \
      extra.identifiers.biotools=meme_suite

################## MAINTAINER ######################

MAINTAINER Tyler C. Shimko <tshimko@stanford.edu>

################## INSTALLATION ######################

USER root

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y autoconf automake ghostscript libexpat1-dev libxml2-dev libxslt1-dev perl zlib1g-dev && \
	cpan HTML::PullParser HTML::Template HTML::TreeBuilder JSON XML::Simple XML::Parser::Expat XML::Compile::SOAP11 \
	XML::Compile::WSDL11 XML::Compile::Transport::SOAPHTTP Math::CDF Log::Log4perl File::Which

USER biodocker
	
RUN cd $HOME &&\
	wget http://meme-suite.org/meme-software/4.12.0/meme_4.12.0.tar.gz && \
	tar zxf meme_4.12.0.tar.gz && \
	cd meme_4.12.0 && \
	./configure --prefix=$HOME/meme --with-url=http://meme-suite.org \
		--enable-build-libxml2 --enable-build-libxslt && \
	make && \
	make test && \
	make install && \
	cd $HOME && \
	rm -r meme_4.12.0.tar.gz meme_4.12.0

ENV PATH $HOME/meme/bin:$PATH 

WORKDIR /data/

CMD ["meme"]
