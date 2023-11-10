FROM cassandra:latest
COPY jolokia-jvm-1.7.2.jar .
COPY jmx_prometheus_javaagent-0.18.0.jar .
COPY cassandra.yml ./jmx_exporter.yml
ENV JVM_OPTS="$JVM_OPTS -javaagent:/jolokia-jvm-1.7.2.jar=port=9192,host=0.0.0.0 -javaagent:/jmx_prometheus_javaagent-0.18.0.jar=7070:/jmx_exporter.yml"
