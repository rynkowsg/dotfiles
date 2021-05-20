mkrc ~/.bash_profile
mkrc ~/.bashrc
mkrc ~/.zshrc
mkrc ~/.aliases
mkrc ~/.rcrc

git submodule add https://github.com/ohmyzsh/ohmyzsh.git refs/oh-my-zsh

mkrc -t macos ~/.fzf.bash
mkrc -t macos ~/.fzf.zsh

mkrc -t macos ~/.iterm2_shell_integration.bash
mkrc -t macos ~/.iterm2_shell_integration.zsh
mkrc -t macos ~/.iterm2_shell_integration.fish
mkrc -t macos ~/.iterm2_shell_integration.tcsh

mkrc -t macos ~/.gitconfig
