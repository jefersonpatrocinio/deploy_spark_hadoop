FROM spark_task_image

ONBUILD COPY requirements.txt /app/
ONBUILD RUN cd /app \
      && pip3 install -r requirements.txt

# Copy the source code
ONBUILD COPY . /app

ENV HDFS_HOST_NAME = "namenode"
ENV HDFS_HOST_PORT 8020

ENV SAMPLE_HOST_NAME "streaming"
ENV SAMPLE_HOST_PORT 5005
ENV SAMPLE_HOST_IP "0.0.0.0"

ENV SPARK_MASTER_NAME "spark-master"
ENV SPARK_MASTER_PORT 7077
ENV SPARK_DRIVER_PORT 41100

ENV TWITTER_CLIENT "twitter"
ENV TWITTER_PORT 9017

ENV DASHBOARD_CLIENT "dashboards"
ENV DASHBOARD_PORT 5009


CMD ["python", "/app/server.py"]