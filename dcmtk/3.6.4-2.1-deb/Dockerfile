FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dcmtk" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="dcmtk" \ 
    about.summary="OFFIS DICOM toolkit command line utilities" \ 
    about.home="http://dicom.offis.de/dcmtk" \ 
    software.version="3.6.4-2.1-deb" \ 
    upstream.version="3.6.4" \ 
    version="1" \ 
    about.copyright="1994-2018, OFFIS e.V." \ 
    about.license="OFFISeV" \ 
    about.license_file="/usr/share/doc/dcmtk/copyright" \ 
    extra.binaries="/usr/bin/cda2dcm,/usr/bin/dcm2json,/usr/bin/dcm2pdf,/usr/bin/dcm2pnm,/usr/bin/dcm2xml,/usr/bin/dcmcjpeg,/usr/bin/dcmcjpls,/usr/bin/dcmconv,/usr/bin/dcmcrle,/usr/bin/dcmdjpeg,/usr/bin/dcmdjpls,/usr/bin/dcmdrle,/usr/bin/dcmdspfn,/usr/bin/dcmdump,/usr/bin/dcmftest,/usr/bin/dcmgpdir,/usr/bin/dcmicmp,/usr/bin/dcmj2pnm,/usr/bin/dcml2pnm,/usr/bin/dcmmkcrv,/usr/bin/dcmmkdir,/usr/bin/dcmmklut,/usr/bin/dcmodify,/usr/bin/dcmp2pgm,/usr/bin/dcmprscp,/usr/bin/dcmprscu,/usr/bin/dcmpschk,/usr/bin/dcmpsmk,/usr/bin/dcmpsprt,/usr/bin/dcmpsrcv,/usr/bin/dcmpssnd,/usr/bin/dcmqridx,/usr/bin/dcmqrscp,/usr/bin/dcmqrti,/usr/bin/dcmquant,/usr/bin/dcmrecv,/usr/bin/dcmscale,/usr/bin/dcmsend,/usr/bin/dcmsign,/usr/bin/dcod2lum,/usr/bin/dconvlum,/usr/bin/drtdump,/usr/bin/dsr2html,/usr/bin/dsr2xml,/usr/bin/dsrdump,/usr/bin/dump2dcm,/usr/bin/echoscu,/usr/bin/findscu,/usr/bin/getscu,/usr/bin/img2dcm,/usr/bin/movescu,/usr/bin/pdf2dcm,/usr/bin/stl2dcm,/usr/bin/storescp,/usr/bin/storescu,/usr/bin/termscu,/usr/bin/wlmscpfs,/usr/bin/xml2dcm,/usr/bin/xml2dsr" \ 
    about.tags="interface::commandline, protocol::ssl, role::program, scope::utility,:converting,:downloading, works-with::image,:image:raster" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y dcmtk || apt-get install -y dcmtk) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
