#!/bin/bash

mvn clean install -DskipTests
mkdir -p target/dependency
cd target/dependency && jar -xf ../*.jar && cd -

TIMESTAMP=$(date +"%Y%m%d%H%M%S")
echo "Old Tag: $TIMESTAMP"

docker tag transaction:latest transaction:$TIMESTAMP
docker build -t transaction:latest .