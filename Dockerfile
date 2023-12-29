FROM maven:3.8.5-openjdk-17 As build
COPY . .
RUN mvn clean package -DskipTest

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/adolService-0.0.1-SNAPSHOT.jar adol.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","adolService.jar"]


