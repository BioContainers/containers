FROM scottw/alpine-perl:5.26.0
MAINTAINER EBI, Web Production Team, webprod <webprod@ebi.ac.uk>
LABEL    base_image="ebi-wp:EBI Web Service" \
    software="ebi-webservice" \
    container="ebi-webservice" \
    about.summary="A collection of Web Service Clients to consume EBI Bioinfomatics tools" \
    about.home="https://www.ebi.ac.uk/services" \
    about.documentation="https://www.ebi.ac.uk/seqdb/confluence/display/JDSAT/Job+Dispatcher+Sequence+Analysis+Tools+Home" \
    software.version="1.0.0" \
    version="1" \
    about.copyright="Copyright EMBL-EBI 2018" \
    about.license="Apache-2.0" \
    about.license_file="/usr/src/ebi-webservice-clients/LICENSE" \
    about.tags="ebi" \
    extra.identifier.biotools="ebi_tools"

# Dependencies
RUN apk update && \
    apk add expat-dev

RUN cpanm Bundle::LWP REST::Client XML::Simple YAML::Syck JSON::XS

ENV SRC_PATH=/usr/src/ebi-webservice-clients/webservice-clients-master
ENV CLIENT_PATH=/usr/src/ebi-webservice-clients
WORKDIR $CLIENT_PATH
ENV PATH="$CLIENT_PATH/perl/:${PATH}"

RUN ZIP=master.zip && \
  wget https://github.com/ebi-wp/webservice-clients/archive/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d $CLIENT_PATH/ && \
  chmod -R 755 $CLIENT_PATH/* && \
  rm /tmp/$ZIP

RUN mkdir $CLIENT_PATH/perl
RUN cp $SRC_PATH/perl/lwp/*.pl $CLIENT_PATH/perl/
RUN cp $SRC_PATH/LICENSE $CLIENT_PATH/
RUN chmod +x $CLIENT_PATH/perl/*.*
