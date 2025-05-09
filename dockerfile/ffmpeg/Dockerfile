# 基于指定镜像
FROM tini0.19-libreoffice:7.4

# 设置华为云镜像源（可选，加速 apt 包下载，适用于 Ubuntu/Debian 系统）
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb http://repo.huaweicloud.com/ubuntu/ bionic main restricted" > /etc/apt/sources.list && \
    echo "deb http://repo.huaweicloud.com/ubuntu/ bionic-updates main restricted" >> /etc/apt/sources.list && \
    echo "deb http://repo.huaweicloud.com/ubuntu/ bionic universe" >> /etc/apt/sources.list && \
    echo "deb http://repo.huaweicloud.com/ubuntu/ bionic-updates universe" >> /etc/apt/sources.list && \
    echo "deb http://repo.huaweicloud.com/ubuntu/ bionic-security main restricted" >> /etc/apt/sources.list && \
    echo "deb http://repo.huaweicloud.com/ubuntu/ bionic-security universe" >> /etc/apt/sources.list

# 更新包索引并安装 ffmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 验证 ffmpeg 安装
RUN ffmpeg -version