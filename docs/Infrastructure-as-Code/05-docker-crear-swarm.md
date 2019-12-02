## Configuration de Swarm Manager

1. Desde la terminal del servidor con el usuario ec2-user connectese a una de las maquinas, este sera el docker swarm mananger `ssh -i "demo.pem" ec2-user@<IP>`
2. Cambiese al usuario root con el comando `sudo -i`
3. Verifique que el servicio de docker este corriendo `service docker status`
4. Si el servicio no esta corriendo inicielo con el comando `service docker start`
5. Inicie el swarm manager con el comando `docker swarm init`
6. Obtenga el comando para unir nodos a docker swarm corriendo `docker swarm join-token worker` 
7. Copie el resultado y guardelo

## Agregar un nodo worker

1. Desde la terminal del servidor con el usuario ec2-user connectese a una de las maquinas, este sera el docker swarm worker `ssh -i "demo.pem" ec2-user@<IP>`
2. Cambiese al usuario root con el comando `sudo -i`
3. Verifique que el servicio de docker este corriendo `service docker status`
4. Si el servicio no esta corriendo inicielo con el comando `service docker start`
5. Una el nodo al docker swarm correindo el comando copiado en la seccion anterior


## Verficacion 

1. Corra el comando `docker node ls` debera mostrarle dos contenedores como miembros del cluster

## Instalacion de portainer

Portainer es una UI para poder ver el estado del cluster de docker para instalarla corra el comando

`docker service create --name portainer_agent --network portainer_agent_network --publish mode=host,target=8000,published=8000 -e AGENT_CLUSTER_ADDR=tasks.portainer_agent --mode global --mount type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock --mount type=bind,src=//var/lib/docker/volumes,dst=/var/lib/docker/volumes –-mount type=bind,src=/,dst=/host portainer/agent`

Puede verificar la instalacion en la dirrecion de su balancer

https://<balancerurl>:8000
