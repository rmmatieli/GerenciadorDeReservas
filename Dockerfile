# Set the base image
FROM maven:3.6.3-jdk-11-slim AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml file to the container
COPY pom.xml .

# Download project dependencies
RUN mvn dependency:go-offline

# Copy the source code to the container
COPY src ./src

# Build the project
RUN mvn package -DskipTests

# Set the base image for the runtime container
FROM openjdk:11-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file to the container
COPY --from=build /app/target/GerenciadorDeReservas-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080
EXPOSE 8080

# Start the application
CMD ["java", "-jar", "app.jar"]
