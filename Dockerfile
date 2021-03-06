# Rubedo dockerfile
FROM centos:latest
RUN yum -y update

# Install required packages
RUN yum install -y tar wget python-pip; yum -y clean all
RUN pip install pymongo
RUN mkdir -p /var/run/mongo /var/log/mongo /var/lib/mongo

# Expose port
EXPOSE 27017
ENV VERSION 3.0.0
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /*.sh
CMD ["/entrypoint.sh"]
