# configs
This is a repositiory containing all of my configuration files!

# Current Configuration
* bashrc + bash_aliases
* vimrc (dated) + init.vim
    * requires the vim-plug program [https://github.com/janegunn/vim-plug](github.com/janegunn/vim-plug)
    * installation for Neovim on windows
    ```powershell
        iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
        ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
    ```
* alacritty.yml
