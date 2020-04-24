#!/bin/sh -l

echo $PATH
echo $JAVA_HOME
echo "Cleaning build"
mvn clean
echo "Run unit tests"
mvn test
echo "Running unit & integration tests for Actionable Insights"
mvn integration-test
