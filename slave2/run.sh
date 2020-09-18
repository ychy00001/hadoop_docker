#!/bin/bash
$HADOOP_HOME/bin/hdfs --daemon start datanode
$HADOOP_HOME/bin/yarn --daemon start nodemanager
while true 
do
    echo 1;
    sleep 3;
done
exec $@