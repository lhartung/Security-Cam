# Security Cam v2
#  - Finds ip address webcam - used for detecting motion
# Version 1.10.00
FROM ubuntu:16.04
MAINTAINER Paradrop Team <info@paradrop.io>

# Install dependencies.  You can add additional packages here following the example.
RUN apt-get update && apt-get install -y \
#   <package> \
    iptables \
    python-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/seccam
WORKDIR /opt/seccam

# Install files required by the chute.
#
# COPY <path_inside_repository> <path_inside_container>
#
COPY requirements.txt seccam.py web /opt/seccam/
RUN pip install --requirement requirements.txt

EXPOSE 5000

CMD ["python", "-u", "seccam.py", "-m_sec", "2.0"]
