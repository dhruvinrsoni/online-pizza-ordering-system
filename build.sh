docker build -t pizzawale-mysqldb:1.0 -f .\Dockerfile-mysql .
docker build -t pizzawale-tomcatserver:1.0 -f .\Dockerfile-tomcat .

docker tag pizzawale-mysqldb:1.0 dhruvinrsoni/pizzawale-mysqldb:1.0
docker tag pizzawale-tomcatserver:1.0 dhruvinrsoni/pizzawale-tomcatserver:1.0

