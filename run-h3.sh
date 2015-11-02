#docker run \
#    -e DISPLAY="$DISPLAY" \
#    -e UID=$(id -u) \
#    -e GID=$(id -g) \
#    -v /tmp/.X11-unix:/tmp/.X11-unix \
#    -v /tmp:/tmp \
#    -v /usr/share/themes/:/usr/share/themes:ro \
#    -v /home/raptor/projects/docker-heroes3-demo/data:/data \
#    --rm \
#    -it \
#    -p 5901:5901 \
#    bmst/h3demo bash

docker run \
    -e UID=$(id -u) \
    -e GID=$(id -g) \
    --rm \
    -it \
    -p 5901:5901 \
    -p 8080:8080 \
    -p 8081:8081 \
    bmst/h3demo bash


