FROM bde2020/spark-submit2.4.0-hadoop2.8

WORKDIR /usr/src/stream
COPY . /usr/src/stream

RUN pip3 install -r requirements.txt

ENV HDFS_HOST_NAME = "namenode"
ENV HDFS_HOST_PORT 8020

ENV APP_HOST_NAME "streaming"

ENV SPARK_MASTER_NAME "spark-master"
ENV SPARK_MASTER_PORT 7077
ENV SPARK_DRIVER_PORT 41100

ENV TWITTER_CLIENT "twitter"
ENV TWITTER_PORT 9017

ENV DASHBOARD_CLIENT "dashboards"
ENV DASHBOARD_PORT 5009

CMD ["python", "server.py"]