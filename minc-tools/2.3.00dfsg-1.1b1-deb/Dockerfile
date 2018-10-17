FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="minc-tools" \ 
    container="minc-tools" \ 
    about.summary="MNI medical image format tools" \ 
    about.home="http://www.bic.mni.mcgill.ca/ServicesSoftware/HomePage" \ 
    software.version="2.3.00dfsg-1.1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/minc-tools/copyright" \ 
    extra.binaries="/usr/bin/dcm2mnc,/usr/bin/ecattominc,/usr/bin/invert_raw_image,/usr/bin/minc_modify_header,/usr/bin/mincaverage,/usr/bin/mincblob,/usr/bin/minccalc,/usr/bin/minccmp,/usr/bin/mincconcat,/usr/bin/mincconvert,/usr/bin/minccopy,/usr/bin/mincdiff,/usr/bin/mincdump,/usr/bin/mincedit,/usr/bin/mincexpand,/usr/bin/mincextract,/usr/bin/mincgen,/usr/bin/mincheader,/usr/bin/minchistory,/usr/bin/mincinfo,/usr/bin/minclookup,/usr/bin/mincmakescalar,/usr/bin/mincmakevector,/usr/bin/mincmath,/usr/bin/mincmorph,/usr/bin/mincpik,/usr/bin/mincresample,/usr/bin/mincreshape,/usr/bin/mincsample,/usr/bin/mincstats,/usr/bin/minctoecat,/usr/bin/minctoraw,/usr/bin/mincview,/usr/bin/mincwindow,/usr/bin/mnc2nii,/usr/bin/nii2mnc,/usr/bin/rawtominc,/usr/bin/transformtags,/usr/bin/upet2mnc,/usr/bin/voxeltoworld,/usr/bin/worldtovoxel,/usr/bin/xfmconcat,/usr/bin/xfminvert" \ 
    about.tags="field::medicine, field::medicine:imaging, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:converting, works-with::image, works-with::image:raster" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y minc-tools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
