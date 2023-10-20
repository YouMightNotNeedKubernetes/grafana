# grafana
Docker Stack deployment for Grafana's Dashboard.

## Getting Started

You might need to create swarm-scoped overlay network called `dockerswarm_monitoring` for all the stacks to communicate if you haven't already.

```sh
$ docker network create --scope=swarm --driver overlay --attachable dockerswarm_monitoring
```

We provided a base configuration file for Grafana. You can find it in the `config` folder.  
Please make a copy as `configs/grafana.ini`, make sure to change the following values:

## Deployment

To deploy the stack, run the following command:

```sh
$ make deploy
```

## Destroy

To destroy the stack, run the following command:

```sh
$ make destroy
```
