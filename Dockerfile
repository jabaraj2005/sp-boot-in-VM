FROM eclipse-temurin:21.0.9_10-jdk-alpine-3.23
WORKDIR /build
COPY --from=stage1 /app/app.jar .
CMD ["java","-jar","app.jar"]
