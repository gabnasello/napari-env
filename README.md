# Docker Image for Napari combined with Jupyter Lab

# Build the Docker Image

From the project folder, run the command below:

```bash build.sh```

# Run Docker container

## docker-compose approach (recommended)

Be aware that the user ```researcher``` within you Docker container won't share the same ID as the host user!

From the project folder, run the command below:

```docker-compose up```

## Alternative approach

You can run the following command:

```
docker run -it --rm \
               -p 8888:8888 \
               -e DISPLAY=$DISPLAY \
               -v /tmp/.X11-unix:/tmp/.X11-unix:ro  \
               gnasello/napari-env:2023-06-29
```

# Run Napari GUI

If you want to run the Napari GUI, remember to allow X server connection before running the container:

```
xhost +local:*
```

and disallow  server connection after running the container:

```
xhost -local:*
```