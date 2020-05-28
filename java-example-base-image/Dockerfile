FROM openjdk:8u252-slim-buster
RUN apt-get update && apt-get install -y  curl
CMD java ${JAVA_OPTS:-"-Xmx64m"} -jar ${JAR:-"service.jar"}
