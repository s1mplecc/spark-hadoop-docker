FROM docker.io/bitnami/spark:3

USER root

ENV HADOOP_HOME="/opt/bitnami/hadoop"
ENV	HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop" \
	HADOOP_LOG_DIR="/var/log/hadoop" \
	PATH="$HADOOP_HOME/hadoop/sbin:$HADOOP_HOME/bin:$PATH"


WORKDIR /opt/bitnami
RUN apt update
RUN apt install vim -y
RUN curl -OL https://archive.apache.org/dist/hadoop/common/hadoop-3.2.0/hadoop-3.2.0.tar.gz
RUN tar -xzvf hadoop-3.2.0.tar.gz
RUN mv hadoop-3.2.0 hadoop
RUN rm -rf hadoop-3.2.0.tar.gz 
RUN mkdir /var/log/hadoop

RUN apt install -y openssh-client openssh-server iputils-ping

RUN ssh-keygen -t rsa -N 1 -f /root/.ssh/id_rsa

WORKDIR /root/.ssh
RUN cp id_rsa.pub authorized_keys
RUN cp /opt/share/config ./
