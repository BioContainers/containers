#################################################################
# Dockerfile
#
# Version:          1.2.1
# Software:         Stacks
# Software Version: 1.41
# Description:      Stacks was developed to work with restriction enzyme-based data, such as RAD-seq, for the purpose of building genetic maps and conducting population...
# Website:          http://catchenlab.life.illinois.edu/stacks/
# Tags:             Genomics
# Provides:         Stacks 1.41
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/stacks 1.41/.
# Pull Cmd:         docker pull biodckr/stacks
# Run Cmd:          docker run --rm biodckr/stacks <tool> <options>
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################
ENV STACKVERSION 1.41

USER root

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libdbd-mysql-perl libsparsehash-dev samtools libbam-dev mysql-client --no-install-recommends
RUN ln -s /usr/include/google /usr/include/sparsehash && \
    perl -MCPAN -e 'my $c = "CPAN::HandleConfig"; $c->load(doit => 1, autoconfig => 1); $c->edit(prerequisites_policy => "follow"); $c->edit(build_requires_install_policy => "yes"); $c->commit' && \
    perl -MCPAN -e 'force install Spreadsheet::WriteExcel' && \
    wget http://catchenlab.life.illinois.edu/stacks/source/stacks-${STACKVERSION}.tar.gz && \
    tar xzf stacks-${STACKVERSION}.tar.gz && \
    cd stacks-${STACKVERSION} && \
    ./configure --enable-sparsehash --enable-bam --with-bam-include-path=/usr/include/samtools --with-bam-lib-path=/usr/lib && \
    make -j 8 && \
    make install && \
    rm -rf /usr/local/share/stacks/php && \
    sed -i -e 's,$mysql_config;,$mysql_config;\nmy $cnf_secure = $cnf . (exists $ENV{"MYSQL_APP_PORT_3306_TCP_ADDR"} ? " --host=" . $ENV{"MYSQL_APP_PORT_3306_TCP_ADDR"} : (exists $ENV{"MYSQL_HOST"} ? " --host=" . $ENV{"MYSQL_HOST"} : q{})) . (exists $ENV{"MYSQL_APP_ENV_MYSQL_PASS"} ? " --password=" . $ENV{"MYSQL_APP_ENV_MYSQL_PASS"} : (exists $ENV{"MYSQL_PASS"} ? " --password=" . $ENV{"MYSQL_PASS"} : q{})) . (exists $ENV{"MYSQL_APP_ENV_MYSQL_USER"} ? " --user=" . $ENV{"MYSQL_APP_ENV_MYSQL_USER"} : (exists $ENV{"MYSQL_USER"} ? " --user=" . $ENV{"MYSQL_USER"} : q{}));,' -i -e 's,mysql --defaults-file=$cnf,mysql --defaults-file=$cnf_secure,g' /usr/local/bin/denovo_map.pl && \
    sed -i -e 's,$mysql_config;,$mysql_config;\nmy $cnf_secure = $cnf . (exists $ENV{"MYSQL_APP_PORT_3306_TCP_ADDR"} ? " --host=" . $ENV{"MYSQL_APP_PORT_3306_TCP_ADDR"} : (exists $ENV{"MYSQL_HOST"} ? " --host=" . $ENV{"MYSQL_HOST"} : q{})) . (exists $ENV{"MYSQL_APP_ENV_MYSQL_PASS"} ? " --password=" . $ENV{"MYSQL_APP_ENV_MYSQL_PASS"} : (exists $ENV{"MYSQL_PASS"} ? " --password=" . $ENV{"MYSQL_PASS"} : q{})) . (exists $ENV{"MYSQL_APP_ENV_MYSQL_USER"} ? " --user=" . $ENV{"MYSQL_APP_ENV_MYSQL_USER"} : (exists $ENV{"MYSQL_USER"} ? " --user=" . $ENV{"MYSQL_USER"} : q{}));,' -i -e 's,mysql --defaults-file=$cnf,mysql --defaults-file=$cnf_secure,g' /usr/local/bin/ref_map.pl && \
    sed -i -e 's,DBI:mysql:$db:mysql,DBI:mysql:$db:" . (exists $ENV{"MYSQL_APP_PORT_3306_TCP_ADDR"} ? ";host=" . $ENV{"MYSQL_APP_PORT_3306_TCP_ADDR"} : (exists $ENV{"MYSQL_HOST"} ? ";host=" . $ENV{"MYSQL_HOST"} : q{})) . (exists $ENV{"MYSQL_APP_ENV_MYSQL_PASS"} ? ";password=" . $ENV{"MYSQL_APP_ENV_MYSQL_PASS"} : (exists $ENV{"MYSQL_PASS"} ? ";password=" . $ENV{"MYSQL_PASS"} : q{})) . (exists $ENV{"MYSQL_APP_ENV_MYSQL_USER"} ? ";user=" . $ENV{"MYSQL_APP_ENV_MYSQL_USER"} : (exists $ENV{"MYSQL_USER"} ? ";user=" . $ENV{"MYSQL_USER"} : q{})) . ";mysql,g' /usr/local/bin/export_sql.pl && \
    sed -i -e 's,DBI:mysql:$db:mysql,DBI:mysql:$db:" . (exists $ENV{"MYSQL_APP_PORT_3306_TCP_ADDR"} ? ";host=" . $ENV{"MYSQL_APP_PORT_3306_TCP_ADDR"} : (exists $ENV{"MYSQL_HOST"} ? ";host=" . $ENV{"MYSQL_HOST"} : q{})) . (exists $ENV{"MYSQL_APP_ENV_MYSQL_PASS"} ? ";password=" . $ENV{"MYSQL_APP_ENV_MYSQL_PASS"} : (exists $ENV{"MYSQL_PASS"} ? ";password=" . $ENV{"MYSQL_PASS"} : q{})) . (exists $ENV{"MYSQL_APP_ENV_MYSQL_USER"} ? ";user=" . $ENV{"MYSQL_APP_ENV_MYSQL_USER"} : (exists $ENV{"MYSQL_USER"} ? ";user=" . $ENV{"MYSQL_USER"} : q{})) . ";mysql,g' -i -e 's,$mysql_config;,$mysql_config;\nmy $cnf_secure = $cnf . (exists $ENV{"MYSQL_APP_PORT_3306_TCP_ADDR"} ? " --host=" . $ENV{"MYSQL_APP_PORT_3306_TCP_ADDR"} : (exists $ENV{"MYSQL_HOST"} ? " --host=" . $ENV{"MYSQL_HOST"} : q{})) . (exists $ENV{"MYSQL_APP_ENV_MYSQL_PASS"} ? " --password=" . $ENV{"MYSQL_APP_ENV_MYSQL_PASS"} : (exists $ENV{"MYSQL_PASS"} ? " --password=" . $ENV{"MYSQL_PASS"} : q{})) . (exists $ENV{"MYSQL_APP_ENV_MYSQL_USER"} ? " --user=" . $ENV{"MYSQL_APP_ENV_MYSQL_USER"} : (exists $ENV{"MYSQL_USER"} ? " --user=" . $ENV{"MYSQL_USER"} : q{}));,' -i -e 's,mysql --defaults-file=$cnf,mysql --defaults-file=$cnf_secure,g' /usr/local/bin/index_radtags.pl && \
    sed -i -e 's,$mysql_config;,$mysql_config;\nmy $cnf_secure = $cnf . (exists $ENV{"MYSQL_APP_PORT_3306_TCP_ADDR"} ? " --host=" . $ENV{"MYSQL_APP_PORT_3306_TCP_ADDR"} : (exists $ENV{"MYSQL_HOST"} ? " --host=" . $ENV{"MYSQL_HOST"} : q{})) . (exists $ENV{"MYSQL_APP_ENV_MYSQL_PASS"} ? " --password=" . $ENV{"MYSQL_APP_ENV_MYSQL_PASS"} : (exists $ENV{"MYSQL_PASS"} ? " --password=" . $ENV{"MYSQL_PASS"} : q{})) . (exists $ENV{"MYSQL_APP_ENV_MYSQL_USER"} ? " --user=" . $ENV{"MYSQL_APP_ENV_MYSQL_USER"} : (exists $ENV{"MYSQL_USER"} ? " --user=" . $ENV{"MYSQL_USER"} : q{}));,' -i -e 's,mysql --defaults-file=$cnf,mysql --defaults-file=$cnf_secure,g' /usr/local/bin/load_radtags.pl && \
    sed -i -e 's,DBI:mysql:$db:mysql,DBI:mysql:$db:" . (exists $ENV{"MYSQL_APP_PORT_3306_TCP_ADDR"} ? ";host=" . $ENV{"MYSQL_APP_PORT_3306_TCP_ADDR"} : (exists $ENV{"MYSQL_HOST"} ? ";host=" . $ENV{"MYSQL_HOST"} : q{})) . (exists $ENV{"MYSQL_APP_ENV_MYSQL_PASS"} ? ";password=" . $ENV{"MYSQL_APP_ENV_MYSQL_PASS"} : (exists $ENV{"MYSQL_PASS"} ? ";password=" . $ENV{"MYSQL_PASS"} : q{})) . (exists $ENV{"MYSQL_APP_ENV_MYSQL_USER"} ? ";user=" . $ENV{"MYSQL_APP_ENV_MYSQL_USER"} : (exists $ENV{"MYSQL_USER"} ? ";user=" . $ENV{"MYSQL_USER"} : q{})) . ";mysql,g' /usr/local/bin/load_sequences.pl && \
    cd .. && \
    echo -e "[client]\nport=3306\nlocal-infile=1\n" > /usr/local/share/stacks/sql/mysql.cnf && \
    cp /usr/local/share/stacks/sql/mysql.cnf /home/biodocker/.my.cnf && \
    rm -rf stacks-${STACKVERSION}.tar.gz stacks-${STACKVERSION}

USER biodocker

WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Michael Bekaert <michael.bekaert@stir.ac.uk>