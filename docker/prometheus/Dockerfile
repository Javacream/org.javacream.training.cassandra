FROM cassandra:latest
COPY jmx_prometheus_javaagent-0.18.0.jar .
COPY cassandra.yml ./jmx_exporter.yml
ENV JVM_OPTS="$JVM_OPTS -javaagent:/jmx_prometheus_javaagent-0.18.0.jar=7070:/jmx_exporter.yml"
