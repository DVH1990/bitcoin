FROM alpine

COPY . / 

RUN apk update
RUN apk add git
RUN apk add make
RUN apk add file
RUN apk add autoconf
RUN apk add automake
RUN apk add libtool
RUN apk add db-c++
RUN apk add db-dev
RUN apk add boost-system
RUN apk add boost-program_options
RUN apk add boost-filesystem
RUN apk add boost-dev
RUN apk add libressl-dev
RUN apk add libevent-dev
RUN apk add build-base

RUN ./autogen.sh
RUN ./configure --disable-tests --disable-bench --disable-static --without-gui --disable-zmq --with-incompatible-bdb  CFLAGS='-w' CXXFLAGS='-w'
RUN make
RUN make install
