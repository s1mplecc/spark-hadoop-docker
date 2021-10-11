FROM docker.io/bitnami/spark:3

USER root

ENV HADOOP_HOME="/opt/bitnami/hadoop"
ENV HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"
ENV HADOOP_LOG_DIR="/var/log/hadoop"
ENV PATH="$HADOOP_HOME/hadoop/sbin:$HADOOP_HOME/bin:$PATH"

WORKDIR /opt/bitnami

RUN apt-get update && apt-get install -y openssh-server vim iputils-ping

RUN curl -OL https://archive.apache.org/dist/hadoop/common/hadoop-3.2.0/hadoop-3.2.0.tar.gz && \
	tar -xzvf hadoop-3.2.0.tar.gz && \
	mv hadoop-3.2.0 hadoop && \
	rm -rf hadoop-3.2.0.tar.gz && \
	mkdir /var/log/hadoop

RUN mkdir -p ~/hdfs/namenode && \ 
    mkdir -p ~/hdfs/datanode && \
    mkdir $HADOOP_HOME/logs


CMD ["sh", "-c", "service ssh start" ]

WORKDIR /opt/bitnami/spark
ENTRYPOINT [ "/opt/bitnami/scripts/spark/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/spark/run.sh" ]

