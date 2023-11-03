GRAFANA_VERSION = latest
docker_stack_name = grafana

compose_files := -c docker-compose.yml
ifneq ("$(wildcard docker-compose.override.yml)","")
	compose_files += -c docker-compose.override.yml
endif

.PHONY: configs
configs: configs/grafana.ini

configs/grafana.ini:
	docker run -it --rm --entrypoint="/bin/sh" --volume=$(PWD)/configs:/configs grafana/grafana:$(GRAFANA_VERSION) -c "cp /etc/grafana/grafana.ini /configs/grafana.ini"

it:
	@echo "make [deploy|destroy]"

deploy:
	docker stack deploy $(compose_files) $(docker_stack_name)

destroy:
	docker stack rm $(docker_stack_name)
