#!/bin/sh -l

echo "Cleaning build"
mvn clean
echo "Run unit tests"
mvn test
echo "Running unit & integration tests"
mvn integration-test
