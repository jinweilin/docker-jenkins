# docker-jenkins

## Build
```
docker build -t jenkins:1.642.2 .
```
## Start
```
mkdir /opt/jenkins_home
docker run -d -p 8080:8080 -p 50000:50000 --name jenkins -v /opt/jenkins_home:/var/jenkins_home jenkins:1.642.2
```