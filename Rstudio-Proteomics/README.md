Rstudio-Proteomics
=====
Rstudio-Proteomics is an adaptation from the original images provided by the Rocker-org. The container provided here contains a Rstudio server configurated with several packages dedicated to Proteomcis data analysis.


available software
--------
`rstudio-proteomics


how to build
------------
`sudo docker build -t biodckr/rstudio .`


how to download and install
---------------------------
`docker pull biodckr/rstudio`


how to use
------------
`sudo docker run -d -p 8787:8787 rstudio`

The Rstudio will be available via browser:


http://localhost:8787


user: rstudio


pass: rstudio


software website
----------------
visit [Rocker-org](https://github.com/rocker-org) website for more information about usage and licensing.


publication
-----------
none


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
