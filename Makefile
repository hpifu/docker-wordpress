repository=wordpress

.PHONY: deploy remove build push

deploy:
	mkdir -p /var/docker/${repository}/data
	docker stack deploy -c stack.yml ${repository}

remove:
	docker stack rm ${repository}

logs:
	docker logs $$(docker ps --filter name=$(repository) -q)
