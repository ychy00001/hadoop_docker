#!/bin/bash
$HADOOP_HOME/bin/hdfs --daemon start namenode
$HADOOP_HOME/bin/hdfs --daemon start datanode
$HADOOP_HOME/bin/yarn --daemon start resourcemanager
$HADOOP_HOME/bin/yarn --daemon start nodemanager
$HADOOP_HOME/bin/mapred --daemon start historyserver
while true 
do
    echo 1;
    sleep 3;
done
exec $@