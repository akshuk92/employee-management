# ---- Build Stage ----
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# ---- Runtime Stage ----
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
RUN groupadd -r appgroup && useradd -r -g appgroup appuser
COPY --from=build /app/target/employee-management.jar app.jar
COPY config/application.properties /app/config/application.properties
RUN chown -R appuser:appgroup /app
USER appuser
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
