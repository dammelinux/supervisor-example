FROM centos:7

LABEL maintainer="KAI VO"

RUN yum update -y
    
RUN yum install openssh-server -y && \
	ssh-keygen -A && \
	echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "root:123456" | chpasswd

RUN yum install -y python-setuptools && \
    easy_install supervisor && \
    mkdir -p /var/log/supervisor && \
    mkdir -p /etc/supervisor/conf.d 

COPY supervisor.conf /etc/supervisor.conf
COPY start.sh /opt/

RUN chmod +x /opt/start.sh

EXPOSE 22

CMD ["supervisord", "-c", "/etc/supervisor.conf"]