# dot_configs

## beginning
0) Required packages: 
    - clangd
    - npm
    - nodejs
    - neovim
    - fzf
    - git
    - bat (modern version of cat with coloring)

1) After install neovim create directory ~/.config/nvim
2) Copy nvim.init into ~/.config/nvim

## install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## install yarn
1) from debian resources
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt update && sudo apt install yarn

2) from manual bash install
    curl -o- -L https://yarnpkg.com/install.sh | bash

## installing gruvbox theme in xterm
1) for a global installation the theme files need to be put into
    /usr/share/xfce4/terminal/colorschemes

2) for local
    mkdir -p ~/.local/share/xfce4/terminal/colorschemes
    cp *.theme ~/.local/share/xfce4/terminal/colorschemes/


## Configuring custom VIM workspace grepping
1) Create .vimws file inside project
2) Define variables:
- pws -> <string> variable responsibe for RegProjAdv - where to search RegEx (beginning directory)
- vccbws -> <string> variable responsile for RegProj - where to search RegEx (beginning direcotry)
- skip -> <string> which directory (names) skip during grep (space separated - string MUST begin with space)

Exemplary content of ".vimws" file:

let g:pws = "../../../"
let g:vccbws = "."
let g:skip = " bt/ Test/ Middleware OAM VNMB VTMB"
