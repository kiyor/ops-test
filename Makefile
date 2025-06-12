default: build push deploy

build:
	@echo "Building"
	docker build -t kiyor/ops-test .

push:
	@echo "Pushing"
	docker push kiyor/ops-test

deploy:
	@echo "Deploying"
	#kubectl rollout restart deployment/ops-test
