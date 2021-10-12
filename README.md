本教程基于 [bitnami-docker-spark](https://github.com/bitnami/bitnami-docker-spark) 镜像，构建了包含对应版本 Hadoop 的镜像。目的在于免去繁杂的环境配置工作，提供开箱即用的 Spark + Hadoop 快捷部署方案。

- Spark Version：3.1.2
- Hadoop Version：3.2.0

镜像已提交至 Docker Hub 仓库中，可以通过如下命令拉取：

```sh
docker pull s1mplecc/spark-hadoop:3
```

详细构建过程请参考：[使用 Docker 快速部署 Spark + Hadoop 大数据集群](https://s1mple.cc/2021/10/12/%E4%BD%BF%E7%94%A8-Docker-%E5%BF%AB%E9%80%9F%E9%83%A8%E7%BD%B2-Spark-Hadoop-%E5%A4%A7%E6%95%B0%E6%8D%AE%E9%9B%86%E7%BE%A4/)。
