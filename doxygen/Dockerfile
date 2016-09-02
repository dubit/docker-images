FROM debian:jessie

# Install wget, we'll use this to get doxygen
RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		wget \
	&& rm -rf /var/lib/apt/lists/*

# Get the Linux DoxyGen binaries
RUN wget -q -O /opt/doxygen.tar.gz http://ftp.stack.nl/pub/users/dimitri/doxygen-1.8.11.linux.bin.tar.gz
RUN cd /opt && \
	tar -zxvf doxygen.tar.gz

# Add doxygen to path
ENV PATH "$PATH:/opt/doxygen-1.8.11/bin"

VOLUME /usr/src/app
WORKDIR /usr/src/app

ENTRYPOINT ["doxygen"]
CMD ["doxyconfig"]