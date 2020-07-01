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

# install vim-plug -> plugin manager
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt update && apt install yarn

RUN cd /tmp && git clone https://github.com/patlas/dot_configs.git \
    && cd /tmp/dot_configs && git checkout neovim && mkdir -p ~/.config/nvim/ && cp init.vim ~/.config/nvim/ && vim +'PlugInstall --sync' +qa

RUN cd ~/.config/nvim/autoload/plugged/coc.nvim && yarn install --frozen-lockfile

# Add automatic curl for downloading plug
# Add automatic download dot_configs and copy init.vim into directory (~/.config/nvim) - create if first
# Manually install yarn
#COPY . .
#CMD ["npm", "start"]:w
