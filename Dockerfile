FROM openjdk:17-jdk-alpine

RUN apk add --no-cache busybox

RUN addgroup -S srivatsan && adduser -S srivatsan -G srivatsan
USER srivatsan:srivatsan

ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["java","-cp","app:app/lib/*","dev.srivatsan.transaction.TransactionApplication"]