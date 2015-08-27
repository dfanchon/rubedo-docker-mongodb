# Rubedo dockerfile
FROM centos:latest
RUN yum -y update

# Install Supervisor and required packages
RUN yum install -y tar wget; yum -y clean all

RUN mkdir -p /var/run/mongo /var/log/mongo /var/lib/mongo

# Expose port
EXPOSE 27017
ENV VERSION 3.0.0
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /*.sh
CMD ["/entrypoint.sh"]
