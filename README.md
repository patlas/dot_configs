# dot_configs

## beginning
0) Required packages: 
    - clangd
    - npm
    - nodejs
    - neovim
    - fzf
    - git

1) After install neovim create directory ~/.config/nvim
2) Copy nvim.init into ~/.config/nvim

## install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update && sudo apt install yarn

