FROM cassandra:latest
COPY jolokia.agent.jar .
ENV JVM_OPTS=-javaagent:/jolokia.agent.jar=port=9192,host=0.0.0.0
