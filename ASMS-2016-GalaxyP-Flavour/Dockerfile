# Galaxy - GalaxyP
#
# VERSION       0.1

FROM quay.io/bgruening/galaxy:16.04

MAINTAINER Björn A. Grüning, bjoern.gruening@gmail.com

ENV GALAXY_CONFIG_BRAND Galaxy for Proteomic Research
ENV ENABLE_TTS_INSTALL True

# Enable Conda dependency resolution
ENV GALAXY_CONFIG_CONDA_AUTO_INSTALL=True \
    GALAXY_CONFIG_CONDA_AUTO_INIT=True

# Install deepTools
ADD galaxyp.yaml $GALAXY_ROOT/tools.yaml
RUN install-tools $GALAXY_ROOT/tools.yaml


ADD galaxyp_wf.yaml $GALAXY_ROOT/workflows.yaml
RUN install-tools $GALAXY_ROOT/workflows.yaml

# Packages
#RUN install-repository \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name package_directag" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name package_myrimatch" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name package_mgf_formatter" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name package_ltq_iquant_cli" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name package_idpqonvert" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name package_tagrecon"


#RUN install-repository \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name directag_and_tagrecon --panel-section-name Bumbershoot" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name idpqonvert --panel-section-name Bumbershoot" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name ltq_iquant_cli --panel-section-name utils" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name mgf_formatter --panel-section-name utils" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name msconvert --panel-section-name utils" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name ms_data_converter --panel-section-name utils" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name ms_wiff_loader --panel-section-name utils" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name myrimatch --panel-section-name Bumbershoot" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name peptide_to_gff --panel-section-name utils" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name pepxml_to_xls --panel-section-name utils" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name proteinpilot --panel-section-name utils" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name protxml_to_xls --panel-section-name utils" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name psm_eval --panel-section-name utils"


#RUN install-repository \
#    "--url http://testtoolshed.g2.bx.psu.edu/ -o galaxyp --name openms --panel-section-name OpenMS" \
#    "--url http://testtoolshed.g2.bx.psu.edu/ -o iracooke --name spectrast --panel-section-name SpectraST" \
#    "--url http://testtoolshed.g2.bx.psu.edu/ -o galaxyp --name feature_alignment --panel-section-name SpectraST" \
#    "--url http://testtoolshed.g2.bx.psu.edu/ -o galaxyp --name spectrast2spectrast_irt --panel-section-name SpectraST" \
#    "--url http://testtoolshed.g2.bx.psu.edu/ -o galaxyp --name spectrast2tsv --panel-section-name SpectraST"

#RUN install-repository \
#    "--url http://testtoolshed.g2.bx.psu.edu/ -o galaxyp --name openms --panel-section-name OpenMS" \
#    "--url http://testtoolshed.g2.bx.psu.edu/ -o iracooke --name spectrast --panel-section-name SpectraST" \
#    "--url http://testtoolshed.g2.bx.psu.edu/ -o galaxyp --name feature_alignment --panel-section-name SpectraST" \
#    "--url http://testtoolshed.g2.bx.psu.edu/ -o galaxyp --name spectrast2spectrast_irt --panel-section-name SpectraST" \
#    "--url http://testtoolshed.g2.bx.psu.edu/ -o galaxyp --name spectrast2tsv --panel-section-name SpectraST"

# Container Style
ADD GalaxyDocker.png $GALAXY_CONFIG_DIR/web/welcome_image.png
ADD welcome.html $GALAXY_CONFIG_DIR/web/welcome.html

# Data libraries
ADD setup_data_libraries.py $GALAXY_ROOT/setup_data_libraries.py
ADD library_data.yaml $GALAXY_ROOT/library_data.yaml

# Hacky script to import workflows into Galaxy after installation. I would argue this step is redundant.
ADD import_workflows.py $GALAXY_ROOT/import_workflows.py

# Both files will not be needed, but the latest changes are not in the 16.04 release.
ADD ./export_user_files.py /usr/local/bin/export_user_files.py
ADD startup_lite.sh /usr/bin/startup_lite
RUN chmod +x /usr/bin/startup_lite /usr/local/bin/export_user_files.py

# Download training data and populate the data library
RUN startup_lite && \
    sleep 30 && \
    . $GALAXY_VIRTUAL_ENV/bin/activate && \
    python $GALAXY_ROOT/setup_data_libraries.py -i $GALAXY_ROOT/library_data.yaml && \
    python $GALAXY_ROOT/import_workflows.py


# Mark folders as imported from the host.
VOLUME ["/export/", "/data/", "/var/lib/docker"]

# Expose port 80 (webserver), 21 (FTP server), 8800 (Proxy)
EXPOSE :80
EXPOSE :21
EXPOSE :8800

# Autostart script that is invoked during container start
CMD ["/usr/bin/startup"]
