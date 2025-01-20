FROM yonggyo00/ubuntu
ARG JAR_FILE=build/libs/aiservice-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar

ENV SPRING_PROFILES_ACTIVE=default
ENV DB_HOST=localhost:1521
ENV DDL_AUTO=update
ENV PYTHON_PATH=/bin/python3.9
ENV PYTHON_SCRIPT=/cis-ai-service/

ENTRYPOINT ["java", "-jar", "-Ddb.host=${DB_HOST}", "-Ddb.password=${DB_PASSWORD}", "-Ddb.username=${DB_USERNAME}", "-Dddl.auto=${DDL_AUTO}", "-Dconfig.server=${CONFIG_SERVER}", "-Deureka.server=${EUREKA_SERVER}", "-Dhostname=${HOSTNAME}", "-Dpython.run.path=${PYTHON_PATH}", "-Dpython.script.path=${PYTHON_SCRIPT}", "app.jar"]

EXPOSE 3003