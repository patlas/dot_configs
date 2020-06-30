#FROM  debian:buster-slim
FROM  debian:bullseye-slim

#COPY qemu-arm-static /usr/bin

#WORKDIR /krksrvbuild07_ws/p.las2
#COPY package*.json ./

RUN apt-get update \
    && apt-get -y install \
    #build-essential \
    wget \
    curl \
    tmux \
    git \
    #g++ \
    python3 \
    python3-pip \
    clangd \
    nodejs \
    npm \
    fzf \
    neovim 

# Add automatic curl for downloading plug
# Add automatic download dot_configs and copy init.vim into directory (~/.config/nvim) - create if first
# Manually install yarn
#COPY . .
#CMD ["npm", "start"]:w
