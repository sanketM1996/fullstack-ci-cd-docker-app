FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copy only the built JAR (already created by Jenkins)
COPY target/*.jar app.jar

# Run the application
ENTRYPOINT ["java","-jar","app.jar"]