FROM bde2020/spark-base:3.0.1-hadoop3.2

WORKDIR /usr/src/stream
COPY . /usr/src/stream

RUN pip install flask==1.1.2
RUN pip install requests

RUN apt-get update && \
    apt-get install --no-install-recommends -y apt-transport-https ca-certificates wget dirmngr gnupg software-properties-common

RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -

RUN add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/

RUN apt-get update && \
    apt-get install --no-install-recommends -y adoptopenjdk-8-hotspot 

ENV SPARK_VERSION 3.0.1
ENV SPARK_INSTALL /usr/local
ENV SPARK_HOME $SPARK_INSTALL/spark
ENV HADOOP_VERSION 3.2
ENV PYSPARK_PYTHON python3
ENV PYSPARK_DRIVER_PYTHON python3

RUN curl -s http://mirror.synyx.de/apache/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION.tgz | tar -xz -C $SPARK_INSTALL && \
    cd $SPARK_INSTALL && ln -s spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION spark

RUN pip install pyspark==$SPARK_VERSION

RUN apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ENV HDFS_HOST_NAME = "namenode"
ENV HDFS_HOST_PORT 8020

ENV SAMPLE_HOST_NAME "streaming"
ENV SAMPLE_HOST_PORT 5005
ENV SAMPLE_HOST_IP "0.0.0.0"

ENV SPARK_MASTER_HOST "spark-master"
ENV SPARK_MASTER_PORT 7077
ENV SPARK_DRIVER_PORT 41100

ENV TWITTER_CLIENT "twitter"
ENV TWITTER_PORT 9017

ENV DASHBOARD_CLIENT "dashboards"
ENV DASHBOARD_PORT 5009


CMD ["python", "server.py"]