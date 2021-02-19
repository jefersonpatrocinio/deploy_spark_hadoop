network:
	docker network create -d overlay --attachable workbench

hadoop:
	docker stack deploy -c docker-compose-hadoop.yml hadoop

spark:
	docker stack deploy -c docker-compose-spark.yml spark

app:
	docker stack deploy -c docker-compose-services.yml app

portainer:
	docker stack deploy --compose-file=docker-compose-portainer.yml portainer
