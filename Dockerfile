FROM centos:centos7
RUN yum -y update && \
      yum -y install wget make bzip2 tar gcc git ruby-devel rpm-build \
      zlib-devel openssl-devel libyaml-devel readline-devel

RUN gem install fpm

RUN git clone https://github.com/sstephenson/ruby-build.git && \
    cd ruby-build && \
    ./install.sh && \
    ruby-build 1.9.3-p551 /usr/local/ruby-1.9.3 && \
    /usr/local/ruby-1.9.3/bin/gem install bundler

WORKDIR src
CMD make package
VOLUME ["/src"]
VOLUME ["/output"]

