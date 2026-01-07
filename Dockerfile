FROM ubuntu
WORKDIR /app
RUN apt update && apt install maven -y && apt install openjdk-21-jdk -y
COPY . .
RUN mvn package
RUN mv target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
