## 介绍

基于 [bitnami-docker-spark](https://github.com/bitnami/bitnami-docker-spark) 镜像，构建了包含对应版本 Hadoop 的镜像。目的在于免去繁杂的环境配置工作，提供开箱即用的 Spark + Hadoop Docker 容器集群部署方案。

- Spark Version：3.1.2
- Hadoop Version：3.2.0

详细构建过程请参考：[使用 Docker 快速部署 Spark + Hadoop 大数据集群](https://s1mple.cc/2021/10/12/%E4%BD%BF%E7%94%A8-Docker-%E5%BF%AB%E9%80%9F%E9%83%A8%E7%BD%B2-Spark-Hadoop-%E5%A4%A7%E6%95%B0%E6%8D%AE%E9%9B%86%E7%BE%A4/)。

## 如何运行

拉取镜像：

```sh
docker pull s1mplecc/spark-hadoop:3
```

拷贝项目中的 docker-compose.yml 至本地，执行如下命令启动集群：

```
docker-compose up -d
```

执行 `docker exec -it`，在容器内运行 Hadoop 启动脚本：

```sh
$ ./start-hadoop.sh
```

## Web UI 汇总

| Web UI                      | 默认网址                   | 备注                                   |
|:---------------------------:|:----------------------:|:------------------------------------:|
| \* **Spark Application**           | http://localhost:4040  | 由 SparkContext 启动，显示以本地或 Standalone 模式运行的 Spark 应用 |
| Spark Standalone Master     | http://localhost:8080  |  显示集群状态，以及以 Standalone 模式提交的 Spark 应用                                  |
| \* **HDFS NameNode**               | http://localhost:9870                   | 可浏览 HDFS 文件系统                         |
| \* **YARN ResourceManager**        | http://localhost:8088                   | 显示提交到 YARN 上的 Spark 应用      |
| YARN NodeManager            | http://localhost:8042 | 显示工作节点配置信息和运行时日志                                     |
| MapReduce Job History | http://localhost:19888 | MapReduce 历史任务 |
