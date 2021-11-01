FROM gcr.io/divine-engine-326620/pygdal:latest

WORKDIR /app

# Get pipenv installed and pipfiles copied
RUN pip install pipenv
COPY Pipfile* /app/

# install python dependencies
RUN pipenv lock --keep-outdated --requirements > requirements.txt
RUN pip install -r requirements.txt

COPY . /app/

# add project path to pythonpath
ENV PYTHONPATH $PYTHONPATH:/app/tilerservice

# RUN entrypoint
ENTRYPOINT ["bash", "-c", "./bin/entrypoint.sh"]