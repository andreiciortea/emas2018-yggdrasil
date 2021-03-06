#!/bin/bash

echo -e '\n\nCreating environment...'
curl -i -X POST \
  http://localhost:8080/environments/ \
  -H 'content-type: text/turtle' \
  -H 'slug: env1' \
  -d '<> a <http://w3id.org/eve#Environment> ;
<http://w3id.org/eve#contains> <http://localhost:8080/workspaces/wksp1> .'

sleep 1

echo -e '\n\nCreating workspace...'
curl -i -X POST \
  http://localhost:8080/workspaces/ \
  -H 'content-type: text/turtle' \
  -H 'slug: wksp1' \
  -d '<> a <http://w3id.org/eve#Workspace> ;
<http://w3id.org/eve#hasName> "wksp1" ;
<http://w3id.org/eve#contains> <http://localhost:8080/artifacts/event-gen> .'

sleep 1

echo -e '\n\nCreating event-gen artifact...'
curl -i -X POST \
  http://localhost:8080/artifacts/ \
  -H 'content-type: text/turtle' \
  -H 'slug: event-gen' \
  -d '<> a <http://w3id.org/eve#Artifact> ;
<http://w3id.org/eve#hasName> "event-gen" ;
<http://w3id.org/eve#hasCartagoArtifact> "emas.EventGeneratorArtifact" .'

