# 使用官方Python 3.9镜像作为基础镜像
FROM python:3.9-slim

# 设置工作目录
WORKDIR /app

# 更新APT源为阿里云镜像，安装系统依赖，并清理apt缓存
RUN echo "deb https://mirrors.aliyun.com/debian/ stable main contrib non-free" > /etc/apt/sources.list \
    && echo "deb-src https://mirrors.aliyun.com/debian/ stable main contrib non-free" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        libglib2.0-0 \
        libsm6 \
        libxext6 \
        libxrender-dev \
        ffmpeg \
        libboost-all-dev \
    && rm -rf /var/lib/apt/lists/*  # 清理apt缓存，以减少镜像大小

# 复制requirements.txt到容器中
COPY requirements.txt /app/requirements.txt

# 安装PyTorch和相关依赖，使用官方PyTorch镜像提供的安装命令
RUN pip install --no-cache-dir \
    torch==1.8.0+cu111 -f https://download.pytorch.org/whl/torch_stable.html \
    torchvision==0.9.0+cu111 -f https://download.pytorch.org/whl/torch_stable.html \
    torchaudio==0.8.0 -f https://pytorch.org/get-started/previous-versions/  # 移除+cu111标签，以避免安装问题

# 安装其他Python依赖
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目文件到容器中
COPY . /app

# 暴露容器端口（根据需要设置）
EXPOSE 3001

# 设置默认执行命令（根据项目实际情况修改）
ENTRYPOINT ["python", "code/demo_final.py"]
