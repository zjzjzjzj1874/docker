### 如何构建一些常用镜像(示例)

- 构建一个Python镜像:
  `docker build -f Dockerfile-py --platform=linux/amd64 -t py-demo:latest .`