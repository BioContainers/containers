# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="PIA-web-server"
LABEL software.version="1.1.0-SNAPSHOT"
LABEL description="Web server for PIA - Protein Inference Algorithms"
LABEL website="https://github.com/mpc-bioinformatics/pia"
LABEL documentation="https://github.com/mpc-bioinformatics/pia"
LABEL license="https://github.com/mpc-bioinformatics/pia"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Julian Uszkoreit <julian.uszkoreit@rub.de>

USER root

# ubuntu 14.04 desktop has issues with the installation of
# tomcat7 (paths are not created)
# therefore use the installation from the tomcat image
# (https://github.com/docker-library/tomcat/blob/ec75141e3cb6276b07d66c16042152e2d4de119c/7/jre7/Dockerfile)

###### start copy from tomcat Dockerfile ######
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

# runtime dependency for Tomcat Native Libraries
RUN apt-get update \
  && apt-get install -y libapr1 graphviz \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# see https://www.apache.org/dist/tomcat/tomcat-8/KEYS
RUN set -ex \
	&& for key in \
		05AB33110949707C93A279E3D3EFE6B686867BA6 \
		07E48665A34DCAFAE522E5E6266191C37C037D42 \
		47309207D818FFD8DCD3F83F1931D684307A10A5 \
		541FBE7D8F78B25E055DDEE13C370389288584E7 \
		61B832AC2F1C5A90F0F9B00A1C506407564C17A3 \
		713DA88BE50911535FE716F5208B0AB1D63011C7 \
		79F7026C690BAA50B92CD8B66A3AD3F4F22C4FED \
		9BA44C2621385CB966EBA586F72C284D731FABEE \
		A27677289986DB50844682F8ACB77FC2E86E29AC \
		A9C5DF4D22E99998D9875A5110C01C5A2F6059E7 \
		DCFD35E0BF8CA7344752DE8B6FB21E8933C60243 \
		F3A04C595DB5B6A5F1ECA43E3B7BBB100D811BBE \
		F7DA48BB64BCB84ECBA7EE6935CD23C10D498E23 \
	; do \
		gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
	done

ENV TOMCAT_MAJOR 7
ENV TOMCAT_VERSION 7.0.69
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/

RUN set -x \
	\
	&& curl -fSL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz \
	&& curl -fSL "$TOMCAT_TGZ_URL.asc" -o tomcat.tar.gz.asc \
	&& gpg --batch --verify tomcat.tar.gz.asc tomcat.tar.gz \
	&& tar -xvf tomcat.tar.gz --strip-components=1 \
	&& rm bin/*.bat \
	&& rm tomcat.tar.gz* \
	\
	&& nativeBuildDir="$(mktemp -d)" \
	&& tar -xvf bin/tomcat-native.tar.gz -C "$nativeBuildDir" --strip-components=1 \
	&& nativeBuildDeps=" \
		libapr1-dev \
		libssl-dev \
   openjdk-7-jdk \
	" \
	&& apt-get update \
  && apt-get install -y --no-install-recommends $nativeBuildDeps \
  && rm -rf /var/lib/apt/lists/* \
	&& ( \
		export CATALINA_HOME="$PWD" \
		&& cd "$nativeBuildDir/jni/native" \
		&& ./configure \
			--libdir=/usr/lib/jni \
			--prefix="$CATALINA_HOME" \
			--with-apr=/usr/bin/apr-1-config \
			--with-java-home="$JAVA_HOME" \
			--with-ssl=yes \
		&& make -j$(nproc) \
		&& make install \
	) \
	&& apt-get purge -y --auto-remove $nativeBuildDeps \
	&& rm -rf "$nativeBuildDir" \
	&& rm bin/tomcat-native.tar.gz \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# verify Tomcat Native is working properly
RUN set -e \
	&& nativeLines="$(catalina.sh configtest 2>&1)" \
	&& nativeLines="$(echo "$nativeLines" | grep 'Apache Tomcat Native')" \
	&& nativeLines="$(echo "$nativeLines" | sort -u)" \
	&& if ! echo "$nativeLines" | grep 'INFO: Loaded APR based Apache Tomcat Native library' >&2; then \
		echo >&2 "$nativeLines"; \
		exit 1; \
	fi
###### end copy from tomcat Dockerfile ######


ENV USERS_FILE $CATALINA_HOME/conf/tomcat-users.xml

# set-up tomcat, get PIA web frontend and put it into the webapps, set-up PIA
RUN set -x \
  && sed -i.bak -e 's/^<\/tomcat-users>/  <role rolename="manager-gui"\/>\n  <user username="admin" password="admin" roles="manager-gui"\/>\n<\/tomcat-users>/' $USERS_FILE \
  && wget https://github.com/mpc-bioinformatics/pia/releases/download/1.1.0-SNAPSHOT/pia-web-interface-1.1.0-SNAPSHOT.war -O /tmp/pia.war \
  && mv /tmp/pia.war $CATALINA_HOME/webapps/pia.war \
  \
  && startup.sh \
  && /bin/bash -c 'tail -f $CATALINA_HOME/logs/catalina.out | while read LOGLINE; do [[ "${LOGLINE}" == *"INFO: Server startup"* ]] && pkill -P $$ tail; done' \
  && shutdown.sh \
  && rm $CATALINA_HOME/webapps/pia.war \
  \
  && echo "nr_threads=0\n\
data_path=/data\n\
tmp_path=/tmp/\n\
mascot_server=\n\
mascot_path=\n\
psmviewer_rows=50\n\
peptideviewer_rows=50\n\
proteinviewer_rows=50" > $CATALINA_HOME/webapps/pia/config/pia.properties

EXPOSE 8080

CMD ["catalina.sh", "run"]
