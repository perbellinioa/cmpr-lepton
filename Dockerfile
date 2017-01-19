FROM ubuntu:16.04
MAINTAINER Olivier Perbellini <olivier.perbellini@gmail.com>

RUN apt-get update && apt-get install -y \ 
    software-properties-common \
    g++ && \
    add-apt-repository ppa:george-edison55/cmake-3.x && \
    apt-get install -y \ 
    cmake \
    git && \ 
    git clone https://github.com/dropbox/lepton.git home/lepton && \ 
    mkdir -p home/lepton/build

WORKDIR /home/lepton/build

RUN cmake .. -DCMAKE_BUILD_TYPE=Release  && \ 
    make -j8

WORKDIR /

COPY ./lepton.sh /

ENTRYPOINT ["/lepton.sh"]
