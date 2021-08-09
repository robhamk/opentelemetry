# Getting Started

# Start Jaeger
### Docker command
docker run -d --name jaeger \
-e COLLECTOR_ZIPKIN_HOST_PORT=:9411 \
-p 5775:5775/udp \
-p 6831:6831/udp \
-p 6832:6832/udp \
-p 5778:5778 \
-p 16686:16686 \
-p 14268:14268 \
-p 14250:14250 \
-p 9411:9411 \
jaegertracing/all-in-one:1.25

### Launch UI:
<pre><code>http://localhost:16686
</code></pre>

# Start both agent and app
### Command line
<pre><code>java -javaagent:path/to/opentelemetry-javaagent-all.jar -jar myapp.jar
</code></pre>

### Intellij Run/Debug Configurations
VM Options:
<pre><code>-javaagent:$ProjectFileDir$/lib/opentelemetry-javaagent-all.jar
</code></pre>
Environment Variables: 
<pre><code>otel.resource.attributes=service.name=myapp;otel.traces.exporter=jaeger
</code></pre>

### Reference Documentation

For further reference, please consider the following sections:

* [Jaeger Guide](https://www.jaegertracing.io/docs/1.25/getting-started/)
* [Java Instrumentation](https://github.com/open-telemetry/opentelemetry-java-instrumentation)

### Additional Links


