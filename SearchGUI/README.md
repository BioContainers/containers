SearchGUI
=====
graphical user interface for proteomics identification search engines


available software
--------
`SearchGUI 1.3.1`


how to build
------------
`docker build -t biodckr/searchgui 1.30.1/.`


how to download and install
---------------------------
`docker pull biodckr/searchgui`


how to use
------------
`docker run -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix biodckr/searchgui`


software website
----------------
visit [SearchGUI](https://code.google.com/p/searchgui/) website for more information about usage and licensing.


publication
-----------
SearchGUI: An open-source graphical user interface for simultaneous OMSSA and X!Tandem searches. Available [here](http://dx.doi.org/10.1002/pmic.201000595)


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
