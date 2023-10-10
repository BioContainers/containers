<img src="https://github.com/BioContainers/specs/blob/master/imgs/BioContainers.png" style="max-width: 50px;"/>


The latest information about BioContainers is available via [https://BioContainers.pro](https://Biocontainers.pro/) 

[![Join the chat at https://gitter.im/BioContainers/biocontainers](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/biocontainers/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Containers
--------
Repository of approved bioinformatics containers

Links:
-------
Web Page              : http://biocontainers.pro/

Project Definition    : https://github.com/BioContainers/specs

Contribution Rules    : https://github.com/BioContainers/specs/blob/master/CONTRIBUTING.md

Wiki of the project   : https://github.com/BioContainers/specs/wiki

Containers            : https://github.com/BioContainers/containers

Email                 : biodockers@gmail.com

License
----------

[Apache 2](http://www.apache.org/licenses/LICENSE-2.0)

Contents
----------

1. [Essentials](#essentials)  
 1.1. [What is BioContainers](#11-what-is-biocontainers)  
 1.2. [Objectives](#12-objectives-and-goals) 
* [Containers](#2-containers)  
  2.1. [What is a container?](#21-what-is-a-container)  
  2.2. [Why do I need to use a container](#22-what-do-i-need-to-use-a-container)  
  2.3. [How to use a BioContainer](#23-how-to-use-a-biocontainer)   
  2.4. [BioContainers Architecture](#24-biocontainers-architecture)  
  2.4.1 [How to Request a Container](#241-how-to-request-a-container)  
  2.4.2 [Use a Container](#242-use-a-bioContainer.)      
* [Developing containers](#3-developing-containers)  
  3.1. [What do I need to develop?](#31-what-do-i-need-to-develop)  
  3.2. [How to create a container?](#32-how-to-create-a-container)  
* [Support](#4-support)  
  4.1  [Get involved](#41-get-involved)  

## 1. Essentials
------------------

### 1.1. What is BioContainers?

The BioContainers project came from the idea of using the containers-based technologies such as [Docker](https://www.docker.com) or  [rkt](https://github.com/coreos/rkt) for bioinformatics software. Having a common and controllable environment for running software could help to deal with some of the current problems during software development and distribution. BioContainers is a community-driven project that provides the infrastructure and basic guidelines to create, manage and distribute bioinformatics containers with a special focus on omics fields such as proteomics, genomics, trascriptomics and metabolomics. The main containers already implemented in BioContainers (https://github.com/BioContainers/containers) are discussed in detail, including examples on how to use BioContainers. 
The currently available BioContainers containers facilitate the usage, and reproducibility of software and algorithms. They can be integrated into more comprehensive bioinformatics pipelines and different architectures (local desktop, Cloud environments or HPC clusters). We also present the  guidelines and specifications on how to create new containers, and how to contribute to the BioContainers project.

### 1.2. Objectives and Goals

* Provide a base specification and images to easily build and deploy new bioinformatics/proteomics software
including the source and examples.

* Provide a series of containers ready to be used by the bioinformatics community (https://github.com/BioContainers/containers).

* Define a set of guidelines and specifications to build a standardized container that can be 
used in combination with other containers and bioinformatics tools.

* Define a complete infrastructure to develop, deploy and test new bioinformatics containers
using continuous integration suites such as Travis Continuous Integration (https://travis-ci.org/), 
Shippable (https://app.shippable.com/), or manually built solutions.

* Provide support and help to the bioinformatics community to deploy new containers for researchers that do not have bioinformatics support.

* Provide guidelines and help on how to create reproducible pipelines by defining, reusing
and reporting specific container versions which will consistently produce the exact same
result and always be available in the history of the container.

* Coordinate and integrate developers and bioinformaticians to produce best practice of
documentation and software development.

## 2. Containers
-------------

### 2.1. What is a container?

Containers are build from existing operating systems. They are different from Virtual machines because they don't posses an entire guest OS inside, instead, containers are build using optimized system
libraries and use the host OS memory management and process controls. Containers normally are centralized around a specific software and you can make them executable by instantiating images from them.

![What is Container](https://github.com/BioContainers/specs/blob/master/imgs/container.png)

### 2.2. What do I need to use a container?

Most of the time when a bioinformatics analysis is performed, several bioinformatics tools and software should be installed and configure. This process can take several hours and demand a lot of efforts including the installation of multiple dependencies and tools. BioContainers provides ready to use packages and tools that can be easily deployed and used in local machines, HPC and cloud architectures. 

### 2.3. How to use a BioContainer 

BioContainers are listed in two main registries: 

* [Docker Hub](https://hub.docker.com/u/biodckr/):  Docker-based containers that can use the docker infrastructure. 
* [QUAY Hub](https://quay.io/organization/biodckr): Docker- and rkt-based containers that can use the rkt infrastructure. 

For a full documentation about how to use BioContainers to perform bioinformatics analysis, please check the [Full Documentation](https://biocontainers-edu.biocontainers.pro/en/latest/) 

### 2.4. BioContainers Architecture 

BioContainers is a community-driven project that allows bioinformatics to request, build and deploy bioinformatics tools using containers. The following figure presents the 
general BioContainers workflow: 

![What is Container](https://github.com/BioContainers/specs/blob/master/imgs//workflow.png)

The next sections explain in detail the presented workflow: 
 
 * (i) How to request a workflow
 * (ii) Use a BioContainer
 * (iii) Developing containers 
 

#### 2.4.1 How to Request a Container

Bioconda packages automatically build a related container. If you are looking for a bioconda package container, check related package documentation, a container in quay.io should be available, see [example page](https://bioconda.github.io/recipes/kinship-read/README.html#package-kinship-read). Do not forget to use the needed tag version, no *latest* tag is available.
 
Users can request a container by opening an issue in the [containers repository](http://github.com/BioContainers/containers/issues) `(In the previous workflow this is the first step performed by user henrik)`. The issue 
should contain the name of the software, the url of the code or binary to be package and information about the software [see BioContainers specification](https://github.com/BioContainers/specs). When the container 
is deployed and fully functional, the issue will be close by the developer or the contributor to BioContainers. 
  
#### 2.4.2 Use a BioContainer. 

When a container is deployed and the developer closes the issue in GitHub, the user `(henrik)` receives a notification that the container is ready.
The user can then use [docker](http://www.docker.com) or [rkt](https://coreos.com/rkt/docs/latest/) to pull or fetch the corresponding container. 


3. Developing containers
-----------------------

### 3.1. How to build BioContainer's

There are two different ways to build a container.

* Go to the GitHub repository with the recipe of the software you want, clone it, and build it yourself on your machine.
* Use the docker daemon to search for a ready-to-use version of the containerized software you want.

Inside the central repository there is a list of softwares with docker recipes, there you can find more information about how to work with them.

### 3.2. What do I need to develop?

BioContainers are based on Linux systems, so you will need a computer with Linux installed. You also will need the `docker` or `rkt` daemon and the software you want to containerize.

### 3.3. How to create a Docker based Biocontainer?

Now you need to create a Dockerfile. Dockerfiles are simple recipes to instruct the daemon on how to set an appropriate OS and how to download, manage, install and
give access to the software inside.

You can check the [Docker](https://docs.docker.com/reference/builder/) documentation for more information.

Once the container is ready you can get in touch with us so we can make the appropriate arrangements to make your container available to everyone in the community by giving an automated build system.

### 3.3. How to create a rkt based Biocontainer?

Now you need to create a rkt. rkt containers are simple recipes to instruct the daemon on how to set an appropriate OS and how to download, manage, install and
give access to the software inside.

You can check the [rkt](https://github.com/coreos/rkt/blob/master/Documentation/getting-started-guide.md) documentation for more information.

Once the container is ready you can get in touch with us so we can make the appropriate arrangements to make your container available to everyone in the community by giving an automated build system.


4. Support
----------

### 4.1. Get involved

Whether you want to make your own software available to others as a container, use them on your pipelines and analysis or just give opinions, you are most welcome. This is a community-driven project, that means everyone has a voice.

Here are some general ideas:

* Browse our list of containers
* Propose your own ideas or software
* Interact with other if you think there is something missing.
