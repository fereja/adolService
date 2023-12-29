FROM maven:3.8.5-openjdk-17 As build
COPY ..
RUN mvn clean package -DskipTest

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /targer/adolService-0.0.1-SANPSHOT.jar adol.jar
EXPOSE 8080
ENTRYPOING ["java","-jar","adolService.jar"]


