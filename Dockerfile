FROM yonggyo00/ubuntu
ARG JAR_FILE=build/libs/aiservice-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar
RUN mkdir uploads

ENV SPRING_PROFILES_ACTIVE=default
ENV DB_HOST=localhost:1521
ENV DDL_AUTO=update
ENV FILE_PATH=/uploads/
ENV FILE_URL=/uploads/
ENV PYTHON_PATH=/bin/python3.9
ENV PYTHON_SCRIPT=/cis-ai-service/

ENTRYPOINT ["java", "-jar", "-Ddb.host=${DB_HOST}", "-Ddb.password=${DB_PASSWORD}", "-Ddb.username=${DB_USERNAME}", "-Dddl.auto=${DDL_AUTO}", "-Dconfig.server=${CONFIG_SERVER}", "-Deureka.server=${EUREKA_SERVER}", "-Dhostname=${HOSTNAME}", "-Dfile.path=${FILE_PATH}", "-Dfile.url=${FILE_URL}", "app.jar"]

EXPOSE 3003