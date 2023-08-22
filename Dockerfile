# Use an OpenJDK image as the base image
FROM openjdk:8-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files into the container
COPY . /app

# Run Maven to download dependencies and build the application
RUN ./mvnw clean package -DskipTests

# Expose the port that the Spring Boot application will run on
EXPOSE 8080

# Run the Spring Boot application
CMD ["java", "-jar", "target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar"]
