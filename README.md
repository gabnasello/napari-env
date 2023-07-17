# Docker Image for Napari combined with Jupyter Lab

# Build the Docker Image

From the project folder, run the command below:

```bash build.sh```

# Run docker container

## Standard approach (recommended)

From the project folder, run the command below:

```docker-compose up -d```

## Alternative approach

You can run the following command:

```docker run -it -d -p 3000:3000 gnasello/napari-env:latest```

# Use the Docker

Open ```localhost:3000``` in your browser to get a virtual desktop.