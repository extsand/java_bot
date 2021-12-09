# More about Makefile
# https://guides.hexlet.io/makefile-as-task-runner/
# https://makefiletutorial.com/
# 
# Run example:
# export TELEGRAM_bot_token="sample:sample1234567890"
# make local-build TELEGRAM_bot_token=$TELEGRAM_bot_token

#VAR = value - required variable
#VAR ?= value - optional variable
# you can set optional var like arg 
## example: 
## make build-app APP_NAME=example

#app variables
APP_NAME ?= java-bot
ENV_NAME ?= dev
APP_TAG ?= latest
APP_IMAGE = $(AWS_REPOSITORY_NAME):$(APP_TAG)

#aws variables 
AWS_REGISTRY_ID ?= 530117518858
AWS_REPOSITORY_REGION ?= eu-central-1
AWS_PROFILE ?= academy
AWS_REPOSITORY_NAME = $(AWS_REGISTRY_ID).dkr.ecr.$(AWS_REPOSITORY_REGION).amazonaws.com/$(APP_NAME)-$(ENV_NAME)


#APP_WEBHOOK_LINK = https://telegrambotsimpl.herokuapp.com/
APP_LOADBALANCER_LINK = ${APP_LOADBALANCER_LINK_env}
APP_BOT_USERNAME = ${APP_BOT_USERNAME_env}
APP_BOT_TOKEN = ${APP_BOT_TOKEN_env}


.PHONY:build-app
build-app:
	echo "Login to AWS"
	$(MAKE) aws-ecr-login 
	echo "Build task started"
	docker build -t $(APP_IMAGE) ./.
	docker push $(APP_IMAGE)

	# docker run -it -p 80:8080 $(APP_IMAGE)
	echo "------ All task is done -------"

.PHONY: local-run
local-run:
	docker run -it -p $(LOCAL_PORT):5000 $(APP_IMAGE)


.PHONY: local-entrance
local-entrance:
	echo "local run and enter for docker container"
	docker exec -it $(shell docker ps | awk 'FNR == 2 {print $$1}') /bin/ash

# - log in to aws elastic container registry
# - for more about - read AWS CLI info
.PHONY:aws-ecr-login 
aws-ecr-login: 
	aws ecr get-login-password --region=$(AWS_REPOSITORY_REGION) | docker login --username AWS --password-stdin $(AWS_REGISTRY_ID).dkr.ecr.$(AWS_REPOSITORY_REGION).amazonaws.com
