c = get_config()
c.JupyterHub.spawner_class = 'dockerspawner.DockerSpawner'
c.DockerSpawner.image = 'sagemath/sagemath'
c.DockerSpawner.network_name = 'bridge'
c.DockerSpawner.remove = True
c.JupyterHub.bind_url = 'http://:8000'
c.JupyterHub.hub_ip = '0.0.0.0'
c.JupyterHub.ssl_key = 'ssl.key'
c.JupyterHub.ssl_cert = 'ssl.cert'
