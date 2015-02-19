# Rubedo dockerfile
FROM centos:centos7
RUN yum -y update
# Install PHP env
RUN yum install -y epel-release && \
    yum install -y tar wget supervisor
RUN mkdir -p /var/run/mongo /var/log/supervisor /var/log/mongo
COPY supervisord.conf /etc/supervisord.conf
#Install Mongo
RUN wget -O mongo.tgz https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.6.7.tgz \
    && tar -xvf mongo.tgz -C /usr/local --strip-components=1 \
    && rm -f mongodb-linux-x86_64-2.6.7.tgz
# Expose port
EXPOSE 27017
CMD ["/usr/bin/supervisord"]
