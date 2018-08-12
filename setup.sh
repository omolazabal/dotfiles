ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/.zshrc-Linux ~/.zshrc-Linux
ln -s ~/dotfiles/zsh/.zshrc-Darwin ~/.zshrc-Darwin

OS="`uname`"
case $OS in
    'Linux')
        rm ~/.config/Code/User/setting.json
        rm ~/.config/Code/User/keybindings.json
        ln -s ~/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
        ln -s ~/dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json

        sudo apt-get install vim
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        vim -c ":PlugInstall" %~/.vconf -c ":qa"

        sudo apt-get install tmux
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        tmux source ~/.tmux.conf

        sudo apt-get install zsh
        sudo npm install --global pure-prompt
        chsh -s $(which zsh)
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        ;;
    'Darwin')
        rm ~/Library/Application\ Support/Code/User/settings.json
        rm ~/Library/Application\ Support/Code/User/keybindings.json
        ln -s ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
        ln -s ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

        brew install vim && brew install macvim
        brew link macvim
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        vim -c ":PlugInstall" %~/.vconf -c ":qa"

        brew install tmux
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        tmux source ~/.tmux.conf

        brew install zsh zsh-completions
        npm install --global pure-prompt
        chsh -s $(which zsh)
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        ;;
esac
