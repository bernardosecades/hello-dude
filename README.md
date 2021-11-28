# Docker image to make tests in kubernetes

If you run the container from image `bernardosecades/hello-dude:v1`:

```
docker run -d -p 8080:8080 <imageID-hello-dude>
```

you can make a curl:

```
curl localhost:8080/hello
```

you will see a response like this:

```
[2021-11-28 16:13:58.462743801 +0000 UTC m=+8.271303881] Hello dude!!
```

## Create docker image

Create image (with tag v1 for example):
```
docker build . -t bernardosecades/hello-dude:v1
```

Check image created:
```
docker images | grep hello
```

or
```
docker images | head
```

Run the container:

```
docker run -d -p 8080:8080 <imageID>
```

## Publish image in docker hub

```
docker login
```

```
docker push bernardosecades/hello-dude:v1
```

Download images from docker hub:

```
docker pull bernardosecades/hello-dude:v1
```


See: 

https://hub.docker.com/u/bernardosecades

