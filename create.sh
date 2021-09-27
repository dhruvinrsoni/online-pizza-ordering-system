docker container create --tty --interactive --name pizzawale-mysql-db --publish 3306:3306 dhruvinrsoni/pizzawale-mysqldb:1.0
docker container create --tty --interactive --name pizzawale-tomcat-server --publish 8080:8080 dhruvinrsoni/pizzawale-tomcatserver:1.0

docker network create --driver=bridge --gateway=10.5.0.1 --subnet=10.5.0.0/16 pizzawale-network
docker network connect --ip 10.5.0.5 pizzawale-network pizzawale-mysql-db
docker network connect --ip 10.5.0.6 pizzawale-network pizzawale-tomcat-server
