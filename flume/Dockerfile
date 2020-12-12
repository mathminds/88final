FROM adoptopenjdk:11-jre-hotspot
ENV PATH /opt/flume/bin:$PATH
# VOLUME ["/flume/data"]
# COPY flume-conf/flume-kafka.properties /flume/conf/flume-kafka.properties
# COPY run-services.sh /run-services.sh
RUN curl -LfsSo /tmp/apache-flume-1.9.0-bin.tar.gz https://www.apache.org/dyn/mirrors/mirrors.cgi\?action\=download\&filename\=flume/1.9.0/apache-flume-1.9.0-bin.tar.gz && mkdir -p /opt/flume &&  tar -xf /tmp/apache-flume-1.9.0-bin.tar.gz -C /opt/flume --strip 1
