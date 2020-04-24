#!/bin/sh -l

echo "Cleaning build"
mvn clean
echo "Run unit tests"
if [[ $1 != 'none' ]]; then
  mvn $1 test
else
  mvn test
fi
echo "Running unit & integration tests"
mvn integration-test
