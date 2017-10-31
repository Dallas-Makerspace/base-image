# base-image

Demostration of release system via github releases for docker images.

## Howto


### Create the release
After loading environment from `docker-machine(1)` execute `./publish.sh` to 
build and deploy the nightly release with timestamps.

### Loading the image
Use `./import.sh` to deploy the image to a remote swarm cluster or docker 
engine node.

This retreaves the latest released image and places inside the inventory of
docker images.

### Running an image

As usual, `docker run -d ${IMAGE_NAME}:latest` will run the imported image.
