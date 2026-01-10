FROM ubuntu AS stage1
WORKDIR /app
RUN apt update && apt install maven -y && apt install openjdk-21-jdk -y
COPY . .
RUN mvn package
RUN mv target/*.jar app.jar


FROM eclipse-temurin:21.0.9_10-jdk-alpine-3.23
WORKDIR /build
COPY --from=stage1 /app/app.jar .
CMD ["java","-jar","app.jar"]
