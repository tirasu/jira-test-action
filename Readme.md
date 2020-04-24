# Jira Plugin Tests Action

__Author__ Tiramisu Web Apps 

__Summary__

This github action performs mvn test & mvn integration test in docker container
with atlassian-sdk-8.0.16 installed.

__Example Usage__

```
name: Java CI with Maven

on: [push, pull_request]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - name : Checkout repo
      uses: actions/checkout@v2
    - name: Run tests in Docker
      uses: tirasu/jira-test-action@master
```

__Details__

This action sets up a container with latest java and Atlassian SDK 8.0.16 installed. The maven used by the action is set to the version provided with the Atlassian SDK. Additionally manually installs jta-1.0.1 and jndi-1.2.1 as these dependencies are known to cause problems when maven tries to fetch them automatically. 

With this set up commands `mvn test` and `mvn integration-test` commands are run.
