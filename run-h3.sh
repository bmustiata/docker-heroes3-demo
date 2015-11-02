docker run \
    -e UID=$(id -u) \
    -e GID=$(id -g) \
    --rm \
    -p 8081:8081 \
    bmst/h3demo
