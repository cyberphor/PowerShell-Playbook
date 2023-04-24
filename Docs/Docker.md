## Docker
This file contains Docker commands I think I need to remember. 

```bash
# build an image from a Dockerfile
docker build .

# list images
docker image ls 

# delete an image by image id
docker image rm <IMAGE_ID>

# ???
docker image prune -f

# ???
docker container prune -f

# ???
docker run -it <image:tag> /bin/bash
```