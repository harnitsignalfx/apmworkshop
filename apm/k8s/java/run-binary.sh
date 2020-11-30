curl -L https://github.com/signalfx/signalfx-java-tracing/releases/latest/download/signalfx-tracing.jar -o /opt/signalfx-tracing.jar
chmod 755 /opt/signalfx-tracing.jar
export SIGNALFX_SERVICE_NAME='k8s-java-reqs-client'
java \
-DtargetUrl=https://api.github.com \
-javaagent:/opt/signalfx-tracing.jar \
-jar ./target/java-app-1.0-SNAPSHOT.jar
