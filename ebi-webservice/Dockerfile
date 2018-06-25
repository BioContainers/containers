FROM scottw/alpine-perl:5.26.0
MAINTAINER EBI, Web Production Team support@ebi.ac.uk

# Dependencies
RUN apk update && \
    apk add expat-dev


RUN cpanm Bundle::LWP REST::Client XML::Simple YAML::Syck JSON::XS

WORKDIR /usr/src/ebi-webservice-clients
ENV PATH="/usr/src/ebi-webservice-clients/:${PATH}"

COPY ./perl/lwp/*.pl /usr/src/ebi-webservice-clients/
RUN chmod +x /usr/src/ebi-webservice-clients/*.*
