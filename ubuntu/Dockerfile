FROM ubuntu

# 在ubuntu的系统中安装ping工具和curl

# 维护者
MAINTAINER zjzjzjzj1874

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install curl -y \
    && apt-get install iputils-ping -y

LABEL image.author="zjzjzjzj1874"