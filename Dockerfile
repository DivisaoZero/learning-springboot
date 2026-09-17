__marcelo é ele

# Etapa 1: compilar a aplicação
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN ./mvnw -N 2>/dev/null; mvn clean package -DskipTests

# Etapa 2: imagem final, mais leve, só para rodar
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

__roger sou eu
