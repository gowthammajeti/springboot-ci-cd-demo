# 1. Base image (Java runtime)
FROM eclipse-temurin:17-jre

# 2. Set working directory inside container
WORKDIR /app

# 3. Copy the built JAR into the container
COPY target/*.jar app.jar

# 4. Expose the application port
EXPOSE 8081

# 5. Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
