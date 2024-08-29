FROM sagemath/sagemath

USER root
RUN pip install jupyterhub notebook
RUN npm install -g configurable-http-proxy

RUN useradd -ms /bin/bash jupyter
USER jupyter

EXPOSE 8000

COPY jupyterhub_config.py /home/jupyter/

CMD ["jupyterhub", "--config", "/home/jupyter/jupyterhub_config.py"]
