FROM python:3.8.12-buster

# Be able to install packages non-interactively
ARG DEBIAN_FRONTEND=noninteractive

# install apt-utils
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

# install rsync install GEOS install PROJ4 install GDAL
RUN apt-get update && apt-get install -y \
        ssh \
        rsync \
        libgeos-3.7.1 node-proj4 libjs-proj4 gdal-bin python-gdal python3-gdal libgdal-dev

# upgrade pip
RUN pip install --upgrade pip

# install numpy before the requiremets.txt file to ensure that numpy is there before installing GDAL (else it generates an error where gdal does 
# not find 'gdal_array')
RUN pip install numpy