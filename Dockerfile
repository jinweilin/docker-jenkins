FROM jenkins

USER root
RUN cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
    echo 'Asia/Taipei' > /etc/timezone && date
RUN sed -e 's;UTC=yes;UTC=no;' -i /etc/default/rcS
RUN apt-get update && \ 
		apt-get install -y rsync
USER jenkins

ENV JENKINS_OPTS --prefix=/jenkins