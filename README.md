# TestWebApp

Relevant commands:

- Build new docker image:
```
  cd dir_containing_Dockerfile && docker build -t node-web-page .
```
- Start docker container:
  
```
  docker run -d -p 3000:3000 node-web-page
```
