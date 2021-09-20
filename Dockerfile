FROM gcr.io/divine-engine-326620/pygdal:latest

WORKDIR /app

# add requirements.txt to the image
COPY requirements.txt /app/requirements.txt

# install python dependencies
RUN pip install -r requirements.txt

COPY . /app/

# add project path to pythonpath
ENV PYTHONPATH $PYTHONPATH:/app/tilerservice

# RUN entrypoint
ENTRYPOINT ["bash", "-c", "./bin/entrypoint.sh"]