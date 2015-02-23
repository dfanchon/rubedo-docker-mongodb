# Rubedo dockerfile
FROM centos:centos7
RUN yum -y update
# Install Supervisor and required packages
RUN yum install -y epel-release; yum -y clean all && \
    yum install -y tar wget supervisor; yum -y clean all
RUN mkdir -p /var/run/mongo /var/log/supervisor /var/log/mongo
COPY supervisord.conf /etc/supervisord.conf
#Install Mongo
RUN wget -O mongo.tgz https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.6.7.tgz \
    && tar -xvf mongo.tgz -C /usr/local --strip-components=1 \
    && rm -f mongo.tgz
# Expose port
EXPOSE 27017
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]