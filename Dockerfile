FROM adoptopenjdk/openjdk11:jdk-11.0.11_9-centos AS build
RUN curl -L https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent-all.jar -o opentelemetry-javaagent-all.jar

FROM adoptopenjdk/openjdk11:jre-11.0.11_9-alpine
COPY /build/libs/opentelemetry-0.0.1-SNAPSHOT.jar app.jar
COPY --from=build opentelemetry-javaagent-all.jar opentelemetry-javaagent-all.jar

ENV OTEL_PROPAGATORS=jaeger
ENV OTEL_SERVICE_NAME=app

CMD java -javaagent:opentelemetry-javaagent-all.jar -jar app.jar