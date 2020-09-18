FROM centos:8

# JAVA_HOME '/opt/jdk'
LABEL maintainer="Rain <ychy00001@163.com>"

# 更改时区
RUN cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 

# 安装jdk
ENV JAVA_HOME /usr/lib/jvm/jdk1.8.0_144/

COPY jdk-8u144-linux-x64.tar.gz /usr/lib/jvm/jdk-8u144-linux-x64.tar.gz

RUN cd /usr/lib/jvm && \
    tar xf jdk-8u144-linux-x64.tar.gz -C /usr/lib/jvm && \
    rm -rf jdk-8u144-linux-x64.tar.gz && \
    ln -s /usr/lib/jvm/jdk1.8.0_144 /opt/jdk

ENV PATH=${PATH}:$JAVA_HOME/bin

# 安装hadoop

ENV HADOOP_VERSION 3.2.1

COPY ./hadoop-$HADOOP_VERSION.tar.gz /tmp/hadoop.tar.gz

RUN set -x \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop

RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

RUN mkdir /hadoop-data

ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]