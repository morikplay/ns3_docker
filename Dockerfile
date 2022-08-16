FROM ubuntu:20.04
LABEL "cloud.randd.team" = "ns3_3.36.1 image" \
    version = "1.0" \
    description = "Base docker image of ns3 3.36.1 with Ubuntu 20.04 LTS" \
    author = "Maulik.Vaidya@gmail.com"

ARG DEBIAN_FRONTEND noninteractive

RUN apt update && \
	DEBIAN_FRONTEND=noninteractive TZ=America/New_York apt install -y gcc \
        g++ \
        python3 \
        mercurial \
        python-setuptools \
        git \
        openmpi-bin \
        openmpi-common \
        openmpi-doc \
        libopenmpi-dev \
        autoconf \
        cvs \
        bzr \
        unrar \
        gdb \
        valgrind \
        uncrustify \
        doxygen \
        graphviz \
        imagemagick  \
        texlive \
        texlive-extra-utils \
        texlive-latex-extra \
        texlive-font-utils \
        texlive-lang-portuguese \
        dvipng \
        dia \
        gsl-bin \
        libgsl-dev \
        flex \
        bison \
        libfl-dev  \
        tcpdump \
        sqlite \
        sqlite3 \
        libsqlite3-dev \
        libxml2 \
        libxml2-dev \
        cmake \
        libc6-dev \
        libc6-dev-i386 \
        libclang-dev \
        python3-pip \
        libgtk2.0-0 \
        libgtk2.0-dev \
        vtun \
        lxc \
        libboost-all-dev \
        libboost-filesystem-dev \
        libxml2 \
        libxml2-dev \
        libgsl23 \
        libgslcblas0 \
        doxygen \
	wget \
	ss-dev

# create nrphy user
RUN groupadd -r nrphy && \
	useradd -m -d /home/nrphy -g nrphy nrphy
RUN echo "nrphy:nrphy" | chpasswd

#RUN mkdir -p /usr/ns3
WORKDIR /usr

RUN wget https://www.nsnam.org/releases/ns-allinone-3.36.1.tar.bz2 && \
	tar -jxvf ns-allinone-3.36.1.tar.bz2

RUN chown -fR nrphy:nrphy ns-allinone-3.36.1/

RUN cd ns-allinone-3.36.1/ns-3.36.1 && \
	./ns3 configure --build-profile=debug --disable-werror --enable-examples --enable-tests 

RUN ln -s /usr/ns-allinone-3.36.1/ns-3.36.1 /usr/ns3

RUN apt clean && \
	rm -rf /var/lib/apt/lists/* && \
	rm ns-allinone-3.36.1.tar.bz2
