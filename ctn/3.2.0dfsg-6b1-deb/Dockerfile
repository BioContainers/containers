FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ctn" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ctn" \ 
    about.summary="Central Test Node, a DICOM implementation for medical imaging" \ 
    about.home="http://sourceforge.net/projects/mirctn" \ 
    software.version="3.2.0dfsg-6b1-deb" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/ctn/copyright" \ 
    about.license_file="/usr/share/doc/ctn/copyright" \ 
    extra.binaries="/usr/bin/archive_agent,/usr/bin/archive_cleaner,/usr/bin/archive_server,/usr/bin/clone_study,/usr/bin/commit_agent,/usr/bin/create_greyscale_module,/usr/bin/create_print_entry,/usr/bin/ctn_version,/usr/bin/ctndisp,/usr/bin/ctnnetwork,/usr/bin/dcm_add_fragments,/usr/bin/dcm_create_object,/usr/bin/dcm_ctnto10,/usr/bin/dcm_diff,/usr/bin/dcm_dump_compressed,/usr/bin/dcm_dump_element,/usr/bin/dcm_dump_file,/usr/bin/dcm_make_object,/usr/bin/dcm_map_to_8,/usr/bin/dcm_mask_image,/usr/bin/dcm_modify_elements,/usr/bin/dcm_modify_object,/usr/bin/dcm_print_dictionary,/usr/bin/dcm_resize,/usr/bin/dcm_rm_element,/usr/bin/dcm_rm_group,/usr/bin/dcm_snoop,/usr/bin/dcm_strip_odd_groups,/usr/bin/dcm_template,/usr/bin/dcm_to_html,/usr/bin/dcm_to_text,/usr/bin/dcm_verify,/usr/bin/dcm_vr_patterns,/usr/bin/dcm_x_disp,/usr/bin/dicom_echo,/usr/bin/dump_commit_requests,/usr/bin/enq_ctndisp,/usr/bin/enq_ctnnetwork,/usr/bin/ex1_initiator,/usr/bin/ex2_initiator,/usr/bin/ex3_acceptor,/usr/bin/ex3_initiator,/usr/bin/ex4_acceptor,/usr/bin/ex4_initiator,/usr/bin/fillImageDB,/usr/bin/fillRSA,/usr/bin/fillRSAImpInterp,/usr/bin/fis_server,/usr/bin/gqinitq,/usr/bin/gqkillq,/usr/bin/icon_append_file,/usr/bin/icon_append_index,/usr/bin/icon_dump_file,/usr/bin/icon_dump_index,/usr/bin/image_server,/usr/bin/kill_ctndisp,/usr/bin/kill_ctnnetwork,/usr/bin/load_control,/usr/bin/mwlQuery,/usr/bin/pq_ctndisp,/usr/bin/pq_ctnnetwork,/usr/bin/print_client,/usr/bin/print_mgr,/usr/bin/print_server,/usr/bin/print_server_display,/usr/bin/ris_gateway,/usr/bin/send_image,/usr/bin/send_results,/usr/bin/send_study,/usr/bin/simple_pacs,/usr/bin/simple_storage,/usr/bin/snp_to_files,/usr/bin/storage_classes,/usr/bin/storage_commit,/usr/bin/ttdelete,/usr/bin/ttinsert,/usr/bin/ttlayout,/usr/bin/ttselect,/usr/bin/ttunique,/usr/bin/ttupdate" \ 
    about.tags="field::medicine:imaging, implemented-in::c, implemented-in::java,:commandline,:graphical,:web,:x11, role::program, scope::application, uitoolkit::athena,:motif, use::converting, works-with-format::TODO,:db,:image,:image:raster,:application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ctn || apt-get install -y ctn) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
