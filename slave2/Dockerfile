FROM registry.cn-beijing.aliyuncs.com/ychy/hadoop:base-3.2.1-oracle8

LABEL maintainer="Rain <ychy00001@163.com>"

ENV HDFS_NAMENODE_USER="root"
ENV HDFS_SECONDARYNAMENODE_USER="root"
ENV HDFS_DATANODE_USER="root"
ENV YARN_NODEMANAGER_USER="root"
ENV YARN_RESOURCEMANAGER_USER="root"

RUN mkdir -p /usr/local/data/hadoop/data
RUN mkdir -p /usr/local/data/hadoop/tmp
RUN mkdir -p /usr/local/data/hadoop/name
RUN ulimit -c unlimited

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]

