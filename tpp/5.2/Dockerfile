################## BASE IMAGE ######################
FROM biocontainers/biocontainers

################## METADATA ######################
LABEL base_image="biocontainers:v1.1.0_cv1"
LABEL version="1"
LABEL software="tpp"
LABEL software.version="5.2"
LABEL about.summary="a collection of integrated tools for MS/MS proteomics"
LABEL about.home="http://tppms.org/"
LABEL about.documentation="http://tools.proteomecenter.org/wiki/index.php?title=Software:TPP"
LABEL about.license_file="https://www.gnu.org/licenses/lgpl-3.0.en.html"
LABEL about.license="SPDX:GPL-3.0-only"
LABEL about.tags="Proteomics"
LABEL extra.identifiers.biotools="tpp"

################## MAINTAINER ######################
MAINTAINER Eric Deutsch <edeutsch@systemsbiology.org>

USER root

RUN apt -y update && apt -y upgrade && apt -y install gnuplot && apt -y install unzip && apt -y install expat && apt -y install apache2 && apt clean all 

RUN export PERL_MM_USE_DEFAULT=1 && cpan install CGI && cpan install XML::Parser && cpan install FindBin::libs && cpan install JSON 

WORKDIR /usr/local/
RUN wget "http://www.tppms.org/sw/TPP5.2/TPP5.2_ubuntu.tgz" && tar xvfz TPP5.2_ubuntu.tgz && chown -R biodocker:biodocker tpp && rm -f ${tarfile} 

RUN a2enmod rewrite && a2enmod cgid
WORKDIR /usr/local/tpp/conf/
RUN cat httpd-2.4-tpp.conf | sed 's/#Require all granted/Require all granted/' > httpd-2.4-tpp-1.conf && perl -pi -e 's/_TPP_PORT_/10401/g' httpd-2.4-tpp-1.conf && cp -p /usr/local/tpp/conf/httpd-2.4-tpp-1.conf /etc/apache2/conf-available/httpd-tpp.conf && ln -s /etc/apache2/conf-available/httpd-tpp.conf /etc/apache2/conf-enabled/httpd-tpp.conf && perl -pi -e 's/www-data/biodocker/g' /etc/apache2/envvars

RUN apt -y update &&  apt -y upgrade && apt -y install nano && apt -y install vim && apt clean all 

ENV PERL5LIB="/usr/local/tpp/lib/perl"
ENV PATH="/usr/local/tpp/bin/:${PATH}"

USER biodocker

WORKDIR /data/
