# TestWebApp

Relevant commands:

- Build new docker image:
```
  cd dir_containing_Dockerfile && docker build -t node-web-app .
```
- Start docker container:
  
```
  docker run -d -p 3000:3000 node-web-app
```
My Docker Hub repositories can be found here:

```
https://hub.docker.com/u/sondberg
```
Using GitHub secrets
```
DOCKERHUB_USERNAME
DOCKERHUB_TOKEN
```
<h2>Git branching strategy</h2>
The default branch is main and is push protected ia policy.
