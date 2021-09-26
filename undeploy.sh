docker container stop pizzawale-tomcat-server
docker container stop pizzawale-mysql-db

docker container rm pizzawale-tomcat-server
docker container rm pizzawale-mysql-db

docker network rm pizzawale-network