FROM python:3.9-slim

RUN apt-get update && \
    apt-get install -y \
    python3-pip \
    nodejs \
    npm

RUN pip3 install jupyterhub notebook dockerspawner

RUN npm install -g configurable-http-proxy

RUN useradd -ms /bin/bash jupyter
USER jupyter

EXPOSE 8000

RUN mkdir -p /srv/jupyterhub && chown -R 1000:1000 /srv/jupyterhub

# Copy configuration file
COPY jupyterhub_config.py /srv/jupyterhub/

USER 1000
CMD ["jupyterhub", "-f", "/srv/jupyterhub/jupyterhub_config.py"]
