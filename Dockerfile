# Use an OpenJDK image as the base image
FROM openjdk:8-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files into the container
COPY pom.xml .

# Run the Maven build to download dependencies
RUN ./mvnw dependency:go-offline -B

# Copy the application source code into the container
COPY src/ /app/src/

# Build the application
RUN ./mvnw package -DskipTests

# Expose the port that the Spring Boot application will run on
EXPOSE 8080

# Run the Spring Boot application
CMD ["java", "-jar", "target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar"]
