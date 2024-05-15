FROM lscr.io/linuxserver/webtop:amd64-ubuntu-kde-version-0f29909a

# Configure environment
ENV DOCKER_IMAGE_NAME='napari-env'
ENV VERSION='2023-10-16' 

# title
ENV TITLE=Napari

# ports and volumes
EXPOSE 3000

VOLUME /config

RUN apt-get update && \
    apt-get install -y vim git\ 
                       python-is-python3 \
                       python3-pip

# install python resources + graphical libraries used by qt and vispy
RUN apt-get update && \
    apt-get install -qqy  \
        build-essential \
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

# Install openCV
RUN apt install libopencv-dev python3-opencv -y

# Install Python packages
ADD requirements.txt /
RUN pip install -r /requirements.txt

COPY /desktop/napari.desktop /usr/share/applications/
COPY /desktop/napari.desktop /config/Desktop/
RUN chmod 777 /config/Desktop/napari.desktop

#COPY /desktop/jupyter.desktop /usr/share/applications/
COPY /desktop/jupyter.desktop /config/Desktop/
#RUN cp /usr/local/share/applications/jupyterlab.desktop /config/Desktop/jupyterlab.desktop
RUN chmod 777 /config/Desktop/jupyter.desktop

#RUN chmod 777 -R /config/.cache