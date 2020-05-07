FROM python:3.7

LABEL base_image="python:3.7"
LABEL version="1"
LABEL software="ccmetagen"
LABEL software.version="1.1.5"
LABEL about.summary="CCMetagen processes sequence alignments produced with KMA"
LABEL about.home="https://github.com/vrmarcelino/CCMetagen"
LABEL about.documentation="https://github.com/vrmarcelino/CCMetagen/blob/master/README.md"
LABEL about.license_file="https://github.com/vrmarcelino/CCMetagen/blob/master/LICENSE"
LABEL about.license="GPL-3.0+"
LABEL extra.identifiers.biotools="CCMetagen"


RUN apt-get update && apt-get install -y libz-dev git wget
RUN pip install pandas
WORKDIR /root
RUN git clone https://bitbucket.org/genomicepidemiology/kma.git && cd kma && make && chmod +x kma && cp kma /usr/bin/ 
RUN wget https://github.com/marbl/Krona/releases/download/v2.7/KronaTools-2.7.tar && \
    tar xvf KronaTools-2.7.tar && cd KronaTools-2.7 && ./install.pl
RUN wget -O v1.1.5.tar.gz https://github.com/vrmarcelino/CCMetagen/archive/v1.1.5.tar.gz && tar xvf v1.1.5.tar.gz && \
    cd CCMetagen-1.1.5 && sed -i 's;tools/;;g' setup.py && python setup.py install
#RUN git clone https://github.com/vrmarcelino/CCMetagen && cd CCMetagen && sed -i 's;tools/;;g' setup.py && python setup.py install

