FROM openjdk:8-jre-alpine

COPY setup /setup
RUN apk add --update git unzip expect && \
	mv /setup/java.security /usr/lib/jvm/default-jvm/jre/lib/security && \
	(mkdir -p /opt && \
   cd /opt && \
	 unzip /setup/git-tf-2.0.3.20131219.zip && \
	rm /setup/git-tf-2.0.3.20131219.zip ) && \
	rm -rf \
	/opt/git-tf-2.0.3.20131219/native/solaris \
	/opt/git-tf-2.0.3.20131219/native/hpux \
	/opt/git-tf-2.0.3.20131219/native/aix \
	/opt/git-tf-2.0.3.20131219/native/win32 \
	/opt/git-tf-2.0.3.20131219/native/macosx \
  /opt/git-tf-2.0.3.20131219/native/freebsd \
  /opt/git-tf-2.0.3.20131219/native/linux/x86 \
  /opt/git-tf-2.0.3.20131219/native/linux/ppc \
	/opt/git-tf-2.0.3.20131219/native/linux/arm && \
	mkdir /src && \
	rm -rf /var/cache/apk/*

WORKDIR /src

ENTRYPOINT ["/setup/gt.sh"]

