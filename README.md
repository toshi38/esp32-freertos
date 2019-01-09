# esp32-freertos
A docker image for building ESP32 freeRTOS images (For example in CI)


# Building
Run `Docker build . -t <tagname>`

# Setting up travis
If you clone this, and want to have automatic deployment.  You can edit the `.travis.yml` file and configure the two
variables:
- `DOCKER_USERNAME`
- `DOCKER_PASSWORD`

Once you've configured the two variables on the build, after successful build on master the image will be pushed to
docker hub.  You'll also need to change the image name to something other than `toshi38/esp32-freertos`.
