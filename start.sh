#!/bin/bash

echo "Stopping Running Transaction Containers: $(docker stop transaction)"
echo "Deleting Existing Transaction Containers: $(docker rm transaction)"

mvn clean install -DskipTests
mkdir -p target/dependency
cd target/dependency && jar -xf ../*.jar && cd -

TIMESTAMP=$(date +"%Y%m%d%H%M%S")
echo "Tagging Old Binary with: $TIMESTAMP"

docker tag transaction:latest transaction:$TIMESTAMP
docker build -t transaction:latest .

docker run --name transaction -e DB_HOST=postgres --network database -d transaction