# 需要预先自己下载hadoop安装包
https://www.apache.org/dyn/closer.cgi/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz

# 同时需要自己下载oracle jdk
https://www.oracle.com/cn/java/technologies/javase/javase8-archive-downloads.html
找到：jdk-8u144-linux-x64.tar.gz

> 注意：需要将上述两个压缩包放在当前目录下，并且文件名一致（或者自行修改Dockerfile中COPY文件及解压文件的内容）

文件已上传百度云：
hadoop 链接: https://pan.baidu.com/s/1ED-mjAwQUGrp_ORwGeZSLw 提取码: a1wc 
jdk 链接: https://pan.baidu.com/s/1KuhzClVQ0nBMFhywTdqFtg 提取码: q65x

# 上传镜像至自己的docker仓库
docker build -t hadoop-base:3.2.1-java8 .
docker tag hadoop-base:3.2.1-java8 registry.cn-beijing.aliyuncs.com/ychy/hadoop:base-3.2.1-java8
docker push registry.cn-beijing.aliyuncs.com/ychy/hadoop:base-3.2.1-java8

# oracle-jdk基础镜像上传
docker build -t hadoop-base:3.2.1-oracle8 .
docker tag hadoop-base:3.2.1-oracle8 registry.cn-beijing.aliyuncs.com/ychy/hadoop:base-3.2.1-oracle8
docker push registry.cn-beijing.aliyuncs.com/ychy/hadoop:base-3.2.1-oracle8
