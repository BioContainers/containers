Denovogui
=====
graphical user interface for de novo sequencing of tandem mass spectra


available software
--------
`denovogui 1.5.2`


how to build
------------
`docker build -t biodckr/denovogui 1.4.12/.`


how to download and install
---------------------------
`docker pull biodckr/denovogui`


how to use
------------
`docker run -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix denovogui`


software website
----------------
visit [Denovogui](https://code.google.com/p/denovogui/) website for more information about usage and licensing.


publication
-----------
DeNovoGUI: An Open Source Graphical User Interface for de Novo Sequencing of Tandem Mass Spectra. Available [here](http://pubs.acs.org/doi/abs/10.1021/pr4008078)


support
-------
we do not provide support for the containerized software, only to aspects regarding the container itself
and its usage. For more information about the software usage, please refer to the publication.


licence
-------
the license present in this repository refers only to the repository content itself, we do not provide or
apply this repository license over the containerized software. Each software is distributed with a specific
license selected by the developer group. For more information on that, please check the respective publication.


about
-----
If you are looking for containerized bioinformatics software;

visit the [Bio Docker](http://biodocker.github.io "Bio Docker") website.

visit the [GitHub page](https://github.com/BioDocker/) for the source code.

visit the [Docker Hub](https://registry.hub.docker.com/repos/biodckr/) for the available images.


maintainers
-----------
* Felipe da Veiga leprevost <felipe@leprevost.com.br>
* Yasset Perez-Riverol <ypriverol@gmail.com>
