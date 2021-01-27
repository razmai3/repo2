FROM debian:stretch

# Install git, supervisor, VNC, & X11 packages
RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      bash \
      fluxbox \
      git \
      firefox-esr \
      net-tools \
      unzip \
      wget \
      tar \
      novnc \
      socat \
      supervisor \
      x11vnc \
      python3-pip \
      xterm \
      xvfb
      

# Setup demo environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=yes \
    RUN_FLUXBOX=yes
COPY . /app
RUN pip3 install --upgrade pip
RUN pip3 install jupyter
RUN chmod +x /app/conf.d/websockify.sh
CMD ["/app/entrypoint.sh"]
