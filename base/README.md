# 需要预先自己下载hadoop安装包
https://www.apache.org/dyn/closer.cgi/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz

# 上传镜像至自己的docker仓库
docker login --username=516581615@qq.com registry.cn-beijing.aliyuncs.com
docker build -t hadoop-base:3.2.1-java8 .
docker tag hadoop-base:3.2.1-java8 registry.cn-beijing.aliyuncs.com/ychy/hadoop:base-3.2.1-java8
docker push registry.cn-beijing.aliyuncs.com/ychy/hadoop:base-3.2.1-java8

# oracle-jdk基础镜像上传
docker build -t hadoop-base:3.2.1-oracle8 .
docker tag hadoop-base:3.2.1-oracle8 registry.cn-beijing.aliyuncs.com/ychy/hadoop:base-3.2.1-oracle8
docker push registry.cn-beijing.aliyuncs.com/ychy/hadoop:base-3.2.1-oracle8
