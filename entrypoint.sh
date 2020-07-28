#!/bin/sh -l

echo "Cleaning build"
mvn clean
echo "Run unit tests"
if [[ $1 != 'none' ]]; then
  mvn test $1
else
  mvn test
fi
echo "Running unit & integration tests"
if [[ $1 != 'none' ]]; then
  mvn integration-test $1
else
  mvn integration-test
fi
if [[ $2 != 'none' ]]; then
  mvn package $2
else
  mvn package
fi
