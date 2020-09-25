FROM centos:7
LABEL Author bqliu<bqliu@thoughtworks.com>

# RUN yum install openssl -y
# OpenSSL 1.0.2k-fips  26 Jan 2017
ARG openssldir=/usr/local/openssl
ARG opensslconf=/etc/ssl/openssl.cnf
ARG opensslpackage=OpenSSL_1_1_1c
RUN yum update -y &&\
  yum install libtool perl-core zlib-devel make -y && \
  curl -O -L https://github.com/openssl/openssl/archive/${opensslpackage}.tar.gz && \
  tar -zxvf ${opensslpackage}.tar.gz && \
  cd openssl-${opensslpackage} && \
  ./config --prefix=${openssldir} --openssldir=${openssldir} shared zlib && \
  make && \
  make test && \
  make install
RUN touch /root/.rnd
RUN rm -rf ${opensslpackage}.tar.gz openssl-${opensslpackage}
ENV PATH=${openssldir}/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LD_LIBRARY_PATH=${openssldir}/lib:/usr/local/ssl/lib

COPY openssl.cnf ${opensslconf}
ENV OPENSSL_CONF=${opensslconf}
WORKDIR /openssl
COPY ./auto/setup-ca /app/
CMD [ "/app/setup-ca" ]

# References:
# L4:   https://blacksaildivision.com/how-to-install-openssl-on-centos
# L18:  https://github.com/openssl/openssl/commit/1fd6afb571e85fbc37ffb522646e7ec2c6e4a11e
