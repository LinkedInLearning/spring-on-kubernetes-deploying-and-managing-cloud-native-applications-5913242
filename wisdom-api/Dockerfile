FROM maven:3.9.8-eclipse-temurin-21-alpine AS build

RUN mkdir /workdir
WORKDIR /workdir
COPY pom.xml /workdir
COPY src /workdir/src

RUN mvn clean package

FROM eclipse-temurin:21.0.4_7-jre-alpine
EXPOSE 8080

RUN mkdir /deploy
COPY --from=build /workdir/target/*.jar /deploy/app.jar
CMD ["java", "-jar", "/deploy/app.jar"]
