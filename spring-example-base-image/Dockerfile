FROM amazoncorretto:17.0.1-al2
HEALTHCHECK --interval=3s --retries=20 CMD curl -f http://localhost:8080/actuator/health || exit 1
CMD java ${JAVA_OPTS:-"-Xmx64m"} -jar ${JAR:-"service.jar"}
