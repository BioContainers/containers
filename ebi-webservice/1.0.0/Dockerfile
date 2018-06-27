FROM scottw/alpine-perl:5.26.0
MAINTAINER EBI, Web Production Team, webprod <webprod@ebi.ac.uk>
LABEL    software="ebi-webservice" \
    container="ebi-webservice" \
    about.summary="A collection of Web Service Clients to consume EBI's tools" \
    about.home="https://www.ebi.ac.uk/services" \
    about.documentation="https://www.ebi.ac.uk/seqdb/confluence/display/JDSAT/Job+Dispatcher+Sequence+Analysis+Tools+Home" \
    software.version="1.0.0" \
    version="1" \
    about.copyright="Copyright EMBL-EBI 2018" \
    about.license="Apache-2.0" \
    about.tags="ebi"

# Dependencies
RUN apk update && \
    apk add expat-dev

RUN cpanm Bundle::LWP REST::Client XML::Simple YAML::Syck JSON::XS

WORKDIR /usr/src/ebi-webservice-clients
ENV PATH="/usr/src/ebi-webservice-clients/:${PATH}"

COPY ./perl/lwp/*.pl /usr/src/ebi-webservice-clients/

RUN chmod +x /usr/src/ebi-webservice-clients/*.*
USER biodocker

