FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY . /app
RUN chmod +x ./mvnw
RUN ./mvnw clean package -DskipTests
EXPOSE 8080
CMD ["java", "-jar", "target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar"]
