
## How to run this image

For Stacks run through the command line interface (CLI) Docker image, you can do the following.

By default the path is `/data/`, the import and export the result of your analyse you need to link the folder we your data are to the docker `/data/` folder by user `-v <USERFOLDER>:/data`. See [BioDocker documentation](http://biodocker.org/docs/quick-start-users/) for more details

```
$ docker run -v /home/user/workspace/:/data/ biodckr/stacks ustacks -h

```

Similarly, if you want to the CLI to access MySQL database you need to provide the server address, username and password via the environment variable: `-e MYSQL_HOST="<HOSTIP>" -e MYSQL_PASS="<MYSQLPASS>" -e MYSQL_USER="<MYSQLUSER>"`:

```
$ docker run -v /home/user/workspace/:/data/ -e MYSQL_HOST="127.0.0.1" \
   -e MYSQL_PASS="dbpass" -e MYSQL_USER="dbuser" biodckr/stacks \
   denovo_map.pl -m 3 -M 3 -n 2 -T 15 -B tut_radtags -b 1 -A CP -t \
                                  -D "Genetic Map RAD-Tag Samples" \
                                  -o /mnt/stacks \
                                  -p /mnt/samples/f0_male.fq \
                                  -p /mnt/samples/f0_female.fq \
                                  -r /mnt/samples/progeny_01.fq \
                                  -r /mnt/samples/progeny_02.fq \
                                  -r /mnt/samples/progeny_03.fq
```


## Alternative dockers

Alternative Stacks Dockers (including Stacks databases and Stacks web-interface) can be obtain from the official Docker Hub at https://hub.docker.com/r/pseudogene/docker-stacks/


## Issues

Any issue related to Stacks itself must be done directly with [Stacks developers](http://catchenlab.life.illinois.edu/stacks/) or via the [stacks-user mailing list](http://groups.google.com/group/stacks-users).


#### Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/pseudogene/docker-stacks/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.
