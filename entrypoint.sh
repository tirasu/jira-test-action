#!/bin/sh -l

echo "Cleaning build"
mvn clean
echo "Running unit & integration tests"
if [[ $1 != 'none' ]]; then
  mvn integration-test $1
  if [[ "$?" -ne 0 ]] ; then
    echo 'could not perform tests'; exit $rc
  fi  
else
  mvn integration-test
  if [[ "$?" -ne 0 ]] ; then
    echo 'could not perform tests'; exit $rc
  fi
fi

if [[ $2 != 'none' ]]; then
  mvn package $2
else
  mvn package
fi  
