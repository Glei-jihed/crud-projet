
FROM maven:latest as build


COPY . /app


WORKDIR /app


RUN mvn clean package


FROM openjdk:17-slim


COPY --from=build /app/target/crud-projet-1.0-SNAPSHOT.jar /usr/app/crud-projet-1.0-SNAPSHOT.jar


WORKDIR /usr/app


CMD ["java", "-jar", "crud-projet-1.0-SNAPSHOT.jar"]
