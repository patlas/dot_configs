# dot_configs
Dot configs for vim, etc
* vimrc insert into ~/.vimrc
* copy vim directory to ~/.vim
* desert.vim insert into /usr/share/vim/vim*/colors/desert.vim
* terminalrc insert into ~/.config/xfce4/terminal/terminalrc

# vim-rtags
* do not forget to download and compile rtags and link rdm and rc into system PATH
* remember to manually start rdm daemon
* if want to use cmake when calling cmake required flag: cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 . -> cause generation compile_commands.json
* after start vim call: ":RtagsLoadCompilationDb <path_to_file_compile_commands.json>
* after all vim-rtags works fine and shortcuts can be used
