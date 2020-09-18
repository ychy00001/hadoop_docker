# 使用说明

1. 构建并启动容器
```
docker-compose up -d
```

2. 第一个次启动后需要主节点格式化hdfs，启动namenode （以后不需要在执行此操作）
```
docker-compose exec master bash
$HADOOP_HOME/bin/hdfs namenode -format
$HADOOP_HOME/bin/hdfs --daemon start namenode
```

3. 本机访问
```
http://127.0.0.1:50070/
http://127.0.0.1:8088/

```

4. jps查看master的java进程
```
DataNode
ResourceManager
NodeManager
NameNode
JobHistoryServer
```

5. jps查看slave的java进程
```
DataNode
NodeManager
```






# 附录
## 更改配置文件 core-site.xml
```
<configuration>
    <property>
        <name>fs.default.name</name>
        <value>hdfs://master:8020</value>
        <description>指定默认的访问地址以及端口号</description>
    </property>
    <property>
        <name>hadoop.tmp.dir</name>
        <value>/usr/local/hadoop/data/</value>
        <description>其它临时目录的父目录，会被其它临时目录用到</description>
    </property>
    <property>
         <name>io.file.buffer.size</name>
         <value>131072</value>
        <description>在序列中使用的缓冲区大小</description>
    </property>
</configuration>
```

## 更改配置文件 hdfs-site.xml 
```
<configuration>
    <property>
        <name>dfs.replication</name>
        <value>2</value>
        <description>副本数，HDFS存储时的备份数量</description>
    </property>
    <property>
        <name>dfs.namenode.name.dir</name>
        <value>/usr/local/data/hadoop/name</value>
        <description>namenode临时文件所存放的目录</description>
    </property>
    <property>
        <name>dfs.datanode.data.dir</name>
        <value>/usr/local/data/hadoop/data</value>
        <description>datanode临时文件所存放的目录</description>
    </property>
    <property>
        <name>dfs.namenode.http-address</name>
        <value>master:50070</value> 
        <description>hdfs web 地址</description>
    </property>
</configuration>
```

## 更改配置文件 yarn-site.yaml
```
<configuration>
    <property>
        <name>yarn.nodemanager.aux-services</name>
        <value>mapreduce_shuffle</value>
        <description>nomenodeManager获取数据的方式是shuffle</description>
    </property>
    <property>
        <name>yarn.resourcemanager.hostname</name>
        <value>master</value>
        <description>指定Yarn的老大(ResourceManager)的地址</description>
    </property>

    <property>
          <name>yarn.resourcemanager.webapp.address</name>
          <value>master:8088</value>
        <description>配置 yarn 外部可访问，(外网IP:端口)</description>
    </property>

    <property>
        <name>yarn.nodemanager.env-whitelist</name>
    <value> JAVA_HOME,HADOOP_COMMON_HOME,HADOOP_HDFS_HOME,HADOOP_CONF_DIR,CLASSPATH_PREPEND_DISTCACHE,HADOOP_YARN_HOME,HADOOP_HOME,PATH,LANG,TZ</value>
        <description>容器可能会覆盖的环境变量，而不是使用NodeManager的默认值</description>
    </property>

    <property>
       <name>yarn.nodemanager.vmem-check-enabled</name>
       <value>false</value>
        <description>关闭内存检测，虚拟机需要，不配会报错</description>
    </property>

</configuration>
```

## 更改配置文件 mapred-site.xml
```
<configuration>
    <property>
        <name>mapreduce.framework.name</name>
        <value>yarn</value>
        <description>告诉hadoop以后MR(Map/Reduce)运行在YARN上</description>
    </property>
    
   <property>
        <name>mapreduce.admin.user.env</name>
        <value>HADOOP_MAPRED_HOME=$HADOOP_HOME</value>
        <description>可以设置AM【AppMaster】端的环境变量，如果上面缺少配置，
        可能会造成mapreduce失败</description>
   </property>

   <property>
        <name>yarn.app.mapreduce.am.env</name>
        <value>HADOOP_MAPRED_HOME=$HADOOP_HOME</value>
        <description>可以设置AM【AppMaster】端的环境变量，如果上面缺少配置，
        可能会造成mapreduce失败</description>
   </property>
</configuration>
```

## 启动 master
！容器执行一次 format！
$HADOOP_HOME/bin/hdfs namenode -format
```
$HADOOP_HOME/bin/hdfs --daemon start namenode
$HADOOP_HOME/bin/hdfs --daemon start datanode
$HADOOP_HOME/bin/yarn --daemon start resourcemanager
$HADOOP_HOME/bin/yarn --daemon start nodemanager
$HADOOP_HOME/bin/mapred --daemon start historyserver
```

## 启动 slave
```
$HADOOP_HOME/bin/hdfs --daemon start datanode
$HADOOP_HOME/bin/yarn --daemon start nodemanager
```

## 关闭master
```
$HADOOP_HOME/bin/hdfs --daemon stop namenode
$HADOOP_HOME/bin/hdfs --daemon stop datanode
$HADOOP_HOME/bin/yarn --daemon stop resourcemanager
$HADOOP_HOME/bin/yarn --daemon stop nodemanager
$HADOOP_HOME/bin/mapred --daemon stop historyserver
```

## 关闭slave
```
$HADOOP_HOME/bin/hdfs --daemon stop datanode
$HADOOP_HOME/bin/yarn --daemon stop nodemanager
```