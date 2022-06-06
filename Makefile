# 运行测试用例
test:
	go test -race ./..

echo:
	echo "hello from makefile"

linters-install:
	@golangci-lint --version >/dev/null 2>&1 || { \
		echo "installing linting tools..."; \
		curl -sfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh| sh -s v1.41.1; \
	}

lint: linters-install
	golangci-lint run

# 格式化项目代码
fmt:
	goimports -l -w .

# 整理项目依赖
tidy:
	go mod tidy

# 构建所有服务 - 基于docker-compose
all:
	sudo -E docker-compose build
	sudo -E docker-compose push

# 构建access-rpc
access-rpc:
	sudo -E docker-compose build access-rpc
	sudo -E docker-compose push access-rpc

# 构建access-api:
access-api:
	sudo -E docker-compose build access-api
	sudo -E docker-compose push access-api

# 构建users-rpc:
users-rpc:
	sudo -E docker-compose build users-rpc
	sudo -E docker-compose push users-rpc

# 构建users-api:
users-api:
	sudo -E docker-compose build users-api
	sudo -E docker-compose push users-api

# 构建admin-api:
admin-api:
	sudo -E docker-compose build  -admin-api
	sudo -E docker-compose push  -admin-api

# 构建server-api:
server-api:
	sudo -E docker-compose build  server-api
	sudo -E docker-compose push  server-api

# 构建audit-api:
audit-api:
	sudo -E docker-compose build  audit-api
	sudo -E docker-compose push  audit-api

# 构建task-api:
task-api:
	sudo -E docker-compose build  task-api
	sudo -E docker-compose push  task-api

# 重启所有服务 - 基于docker-compose
all-start:
	sudo -E docker-compose down
	sudo -E docker-compose pull
	sudo -E docker-compose up -d


# 重启access-rpc:
access-rpc-start:
	sudo -E docker-compose stop access-rpc
	sudo -E docker-compose pull access-rpc
	sudo -E docker-compose up -d access-rpc

# 重启access-api:
access-api-start:
	sudo -E docker-compose stop  access-api
	sudo -E docker-compose pull  access-api
	sudo -E docker-compose up -d access-api

# 重启users-rpc:
users-rpc-start:
	sudo -E docker-compose  stop  users-rpc
	sudo -E docker-compose  pull  users-rpc
	sudo -E docker-compose  up -d users-rpc

# 重启users-api:
users-api-start:
	sudo -E docker-compose stop  users-api
	sudo -E docker-compose pull  users-api
	sudo -E docker-compose up -d users-api

# 重启admin-api:
admin-api-start:
	sudo -E docker-compose stop  admin-api
	sudo -E docker-compose pull  admin-api
	sudo -E docker-compose up -d admin-api

# 重启 server-api:
 server-api-start:
	sudo -E docker-compose stop  server-api
	sudo -E docker-compose pull  server-api
	sudo -E docker-compose up -d server-api

# 重启audit-api:
audit-api-start:
	sudo -E docker-compose stop  audit-api
	sudo -E docker-compose pull  audit-api
	sudo -E docker-compose up -d audit-api

# 重启task-api:
task-api-start:
	sudo -E docker-compose stop  task-api
	sudo -E docker-compose pull  task-api
	sudo -E docker-compose up -d task-api

# 清理docker，释放无用空间
clean-docker:
	sudo -E docker container prune -f
	sudo -E docker image prune -f

env:
	echo DOCKER_TAG="${DOCKER_TAG}" >> .env
	echo PROJECT="${PROJECT}" >> .env
	echo HUB_DOMAIN="${HUB_DOMAIN}" >> .env
	echo BRANCH_ENV="${BRANCH_ENV}" >> .env

.PHONY: test echo