#!/bin/sh

docker run --rm \
  -u gradle \
  -v "$PWD":/home/gradle/project \
  -w /home/gradle/project \
  docker.io/gradle:jdk21-alpine \
  gradle clean bootJar
