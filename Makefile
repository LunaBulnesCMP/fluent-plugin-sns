COMPONENT ?= fluentd
export COMPOSE_DOCKER_CLI_BUILD := 1
export DOCKER_BUILDKIT := 1
DOCKER_COMPOSE := ops/docker/docker-compose.yml
CODE_CONTAINER := fluentd
export GITHUB_TOKEN=$(shell git config --get github-oauth.github.com)
export ENV ?= dev

status:
	@docker-compose -p ${COMPONENT} -f ${DOCKER_COMPOSE} ps

dev:
	@docker-compose -p ${COMPONENT} -f ${DOCKER_COMPOSE} up -d --build

nodev:
	@docker-compose -p ${COMPONENT} -f ${DOCKER_COMPOSE} kill
	@docker-compose -p ${COMPONENT} -f ${DOCKER_COMPOSE} rm -f

log: logs
logs:
	@docker-compose -p ${COMPONENT} -f ${DOCKER_COMPOSE} logs -f ${CODE_CONTAINER}

errors:
	@docker-compose -p ${COMPONENT} -f ${DOCKER_COMPOSE} logs -f ${CODE_CONTAINER} | grep --color=always -E 'ERROR|CRITICAL'

enter:
	@./ops/scripts/enter.sh ${COMPONENT}

gem:
	@rm -f fluent-plugin*.gem
	@rake gemspec
	@gem build *.gemspec
