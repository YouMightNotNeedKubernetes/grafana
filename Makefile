-include .env.release

docker_stack_name = grafana

.PHONY: configs
configs: configs/grafana.ini

configs/grafana.ini:
	docker run -it --rm --entrypoint="/bin/sh" --volume=$(PWD)/configs:/configs grafana/grafana:$(GRAFANA_VERSION) -c "cp /etc/grafana/grafana.ini /configs/grafana.ini"

it:
	@echo "make [deploy|destroy]"

deploy:
	docker stack deploy -c docker-compose.yml $(docker_stack_name)

destroy:
	docker stack rm $(docker_stack_name)
