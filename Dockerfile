FROM openjdk:8-jdk-slim AS builder
COPY HelloWorld.java /app/
WORKDIR /app
RUN javac HelloWorld.java

FROM openjdk:8-jre-slim
COPY --from=builder /app/HelloWorld.class /app/
WORKDIR /app
CMD ["java", "HelloWorld"]
