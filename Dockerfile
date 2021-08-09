FROM adoptopenjdk:11-openj9 AS build
COPY . /work
WORKDIR /work
RUN ./gradlew clean build

RUN curl -L https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/tag/v1.4.1/download/opentelemetry-javaagent-all.jar -o opentelemetry-javaagent-all.jar

FROM adoptopenjdk:11-jre-openj9
COPY --from=build /work/build/libs/opentelemetry-0.0.1-SNAPSHOT.jar app.jar
COPY --from=build /work/opentelemetry-javaagent-all.jar opentelemetry-javaagent-all.jar

ENV OTEL_TRACES_EXPORTER=jaeger

ENV OTEL_RESOURCE_ATTRIBUTES=service.name=myapp

CMD java -javaagent:opentelemetry-javaagent-all.jar -jar /app.jar