#!/bin/sh -l

echo "Cleaning build"
mvn clean
echo "Running unit & integration tests"
if [[ $1 != 'none' ]]; then
  mvn integration-test $1
else
  mvn integration-test
fi
if [[ "$?" -ne 0 ]] ; then
  echo 'could not perform tests'; exit $rc
else
  if [[ $2 != 'none' ]]; then
  mvn package $2
  else
    mvn package
  fi  
fi
