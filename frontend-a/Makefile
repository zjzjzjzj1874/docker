# 开发环境构建
dev:
	yarn install
	yarn run build:dev

# 测试环境构建
test:
	yarn install
	yarn run build:test

# 生产环境构建
pro:
	yarn install
	yarn run build:pro

# 构建镜像,请传入版本号和环境 实例 => make image TAG=latest BRANCH_ENV=dev
image:
	sudo docker build -f Dockerfile --build-arg buildEnv=${BRANCH_ENV} -t frontend:${TAG} .
	#sudo docker build -f Dockerfile --platform=linux/amd64 --build-arg buildEnv=${BRANCH_ENV} -t swr.cn-north-4.myhuaweicloud.com/ywaq/chatgpu-ui-2c:${BRANCH_ENV}-${TAG} .

push:
	sudo docker push swr.cn-north-4.myhuaweicloud.com/ywaq/chatgpu-ui-2c:${BRANCH_ENV}-${TAG}
	sudo docker image prune -f

