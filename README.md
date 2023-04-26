# meetup-viz

The Plan: 

12 years of Meetup Data visualized with Dash/Plotly. 
This is a template that can be used with any Meetup data

## install 

minimum requirements poetry 1.4 (including OSX and ubuntu)

```sh
poetry env use python3.9
poetry shell
poetry install --only main 
gunicorn app:server
```

## Docker

how to build the docker image locally and run it

```
docker build -t meetup .
docker run -p 8000:8000 meetup

```

## deploy to fly.io

deploy on fly.io using the Docker container with


```sh
 fly launch --dockerfile Dockerfile
```

libraries are too heavy on other clouds, so Docker will do

For more information on Fly.io see: 
https://fly.io/docs/languages-and-frameworks/python/