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
	yarn run build

# 构建镜像,请传入版本号和环境 实例 => make image TAG=latest MODE=test
image:
	docker build -f Dockerfile --build-arg mode=${MODE} -t hello:${TAG} .

