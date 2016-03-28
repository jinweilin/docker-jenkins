FROM jenkins:1.642.2

USER root
RUN echo "!/bin/sh ntpdate ntp.ubuntu.com" >> /etc/cron.daily/ntpdate && \
		chmod 750 /etc/cron.daily/ntpdate && \
		cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
    echo 'Asia/Taipei' > /etc/timezone && date && \
		sed -e 's;UTC=yes;UTC=no;' -i /etc/default/rcS && \
		apt-get update && \ 
		apt-get install -y rsync && \
		apt-get clean
USER jenkins

ENV JENKINS_OPTS --prefix=/jenkins