BioDocker - Containers
=========

[![Join the chat at https://gitter.im/BioDocker/biodocker](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/BioDocker/biodocker?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

```
___.   .__           .___             __                 
\_ |__ |__| ____   __| _/____   ____ |  | __ ___________ 
 | __ \|  |/  _ \ / __ |/  _ \_/ ___\|  |/ // __ \_  __ \
 | \_\ \  (  <_> ) /_/ (  <_> )  \___|    <\  ___/|  | \/
 |___  /__|\____/\____ |\____/ \___  >__|_ \\___  >__|   
     \/               \/           \/     \/    \/       

 ```

Containers
--------
Repository of approved bioinformatics containers

Links:
-------
Web Page              : http://biodocker.github.io/

Project Definition    : https://github.com/BioDocker/biodocker

Contribution Rules    : https://github.com/BioDocker/biodocker/blob/master/CONTRIBUTING.md

Wiki of the project   : https://github.com/BioDocker/biodocker/wiki

Containers            : https://github.com/BioDocker/containers

Containers Development: https://github.com/BioDocker/sandbox

Email                 : biodockers@gmail.com

License
----------

[Apache 2](http://www.apache.org/licenses/LICENSE-2.0)

Contents
----------

1. [Containers](#1-containers)  
  1.1. [What is a container?](#11-what-is-a-container)  
  1.2. [How to search for a container](#12-how-to-search-for-a-container)  
  1.3. [What do I need to use a container?](#13-what-do-i-need-to-use-a-container)   
  1.4. [How do I use a container?](#14-how-do-i-use-a-container)  
  1.5. [How to build a BioDocker container](#15-how-to-build-a-biodocker-container)  
* [Developing containers](#2-developing-containers)  
  2.1. [What do I need to develop?](#21-what-do-i-need-to-develop)  
  2.2. [How to create a container?](#22-how-to-create-a-container)  
* [License](#3-license)  

1. Containers
-------------

### 1.1. What is a container?

Containers are build from existing operating systems. They are different from Virtual machines because they don't posses an entire guet OS inside, instead, containers are build using optimized system
libraries and use the host OS memory management and process controls. Containers normally are centralized around specific software and you can make them executable by instantiating images from them.

## 1.2. How to search for a container

The BioDocker containers are listed on this repository. Every software has a specific directory with a recipe inside on how to make the container.

### 1.3. What do I need to use a container?

In order to run a Docker(or BioDocker) container on your computer you will need the Docker daemon installed.

Check [here](https://docs.docker.com/installation/) for the instructions on how to do it.

### 1.4. How do I use a container?

In general the `README.md` of each project should explain you how to interact with it.

### 1.5. How to build a Biodocker container

There are two different ways to run a container.

* Go to the GitHub repository with the recipe of the software you want, clone it, and build it yourself on your machine.
* Use the docker daemon to search for a ready-to-use version of the containerized software you want.

Inside the central repository there is a list of software with docker recipes, there you can find more information about how to work with them.


2. Developing containers
-----------------------

### 2.1. What do I need to develop?

Docker containers are based on Linux systems, so you will need a computer with Linux installed, you also will need the docker daemon and the software you want to containerize.

### 2.2. How to create a container?

Having all in hands now you need to create a Dockerfile. Dockerfiles are simple recipies to instruct the daemon on how to set an appropriate OS and how to download, manage, install and
give access to the software inside.

You can check the [Docker](https://docs.docker.com/reference/builder/) documentation for more information.

Once the container is ready you can get in touch with us so we can make the appropriate arrangements to make your container availabe to everyone in the community by giving an automated build system.


3. Support
----------

### 3.1. Get involved

Whether you want to make your own software available to others as a container, to just use them on your pipelines and analysis or just give opinions, you are most welcome. This is a community-driven project, that means everyone has a voice.

Here are some general ideas:

* Browse our list of containers
* Propose your own ideas or software
* Interact with other if you think there is something missing.
