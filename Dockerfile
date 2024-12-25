#First Stage
FROM openjdk:25 AS builder
ADD . /spc
WORKDIR /spc
RUN chmod +x mvnw
RUN ./mvnw package

#Final Stage
FROM openjdk:19-jdk-alpine3.16 
EXPOSE 8080
WORKDIR /spc
COPY --from=builder /spc/target/*.jar spc.jar
CMD ["java", "-jar", "spc.jar"]

