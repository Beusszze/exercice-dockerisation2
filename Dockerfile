#Construction de l'image
FROM maven:3.8.4-jdk-11 as BUILD
WORKDIR /app
COPY . .
RUN mvn package


FROM openjdk:11
WORKDIR /app
COPY --from="BUILD" . ./app.jar
EXPOSE 4200
CMD ["java", "-jar", "app.jar"]