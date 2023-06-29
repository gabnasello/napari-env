# docker-stacks/r-notebook [https://github.com/jupyter/docker-stacks/tree/master/r-notebook]
# https://hub.docker.com/r/jupyter/r-notebook/dockerfile

FROM jupyter/base-notebook:python-3.10.6

# Configure environment
ENV DOCKER_IMAGE_NAME='napari-env'
ENV VERSION='2023-06-29' 

USER root
# install python resources + graphical libraries used by qt and vispy
RUN apt-get update && \
    apt-get install -qqy  \
        build-essential \
        git \
        mesa-utils \
        libgl1-mesa-glx \
        libglib2.0-0 \
        libfontconfig1 \
        libxrender1 \
        libdbus-1-3 \
        libxkbcommon-x11-0 \
        libxi6 \
        libxcb-icccm4 \
        libxcb-image0 \
        libxcb-keysyms1 \
        libxcb-randr0 \
        libxcb-render-util0 \
        libxcb-xinerama0 \
        libxcb-xinput0 \
        libxcb-xfixes0 \
        libxcb-shape0 \
        && apt-get clean
USER jovyan

# Install Python packages
ADD requirements.txt /
RUN pip install -r /requirements.txt

# Set the jl command to create a JupytetLab shortcut
ADD scripts/launch_jupyterlab.sh /
RUN echo "alias jl='bash /launch_jupyterlab.sh'" >> ~/.bashrc

ADD scripts/entrypoint.sh /
ADD scripts/message.sh /
RUN echo "bash /message.sh" >> ~/.bashrc