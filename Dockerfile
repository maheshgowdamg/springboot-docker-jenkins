FROM openjdk:17-jdk-slim

WORKDIR /app
COPY ./target/*.jar app.jar
ENV SPRING_DATASOURCE_URL=jdbc:mysql://43.204.100.226:3306/myapplication?createDatabaseIfNotExist=true
ENV SPRING_DATASOURCE_USERNAME=root
ENV SPRING_DATASOURCE_PASSWORD=1234
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "app.jar"]