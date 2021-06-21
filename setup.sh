init() {
    sudo apt update
    sudo apt upgrade -y
}

install_common_utils() {
    sudo apt-get install -y curl xclip jq
}

install_node() {
    echo "Installing Node 14 JS LTS"
    
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt-get install -y nodejs
    mkdir ~/.npm-global
    npm config set prefix '~/.npm-global'
    echo '' >> ~/.bashrc
    echo 'PATH=~/.npm-global/bin:$PATH' | tee -a ~/.bashrc
    echo '' >> ~/.bashrc
}

install_git() {
    echo "Installing GIT"

    sudo apt-get install -y git gitk
    
    echo "Please write git name:"
    read GIT_NAME

    echo "Please write git email:"
    read GIT_EMAIL

    git config --global user.name $GIT_NAME
    git config --global user.email $GIT_EMAIL
    git config --global core.editor "code --wait"
    git config --global merge.ff only

    echo '' >> ~/.bashrc
    echo 'force_color_prompt=yes' >> ~/.bashrc
    echo 'color_prompt=yes' >> ~/.bashrc
    echo 'parse_git_branch() {' >> ~/.bashrc
    echo ' git branch 2> /dev/null | sed -e '\''/^[^*]/d'\'' -e '\''s/* \(.*\)/(\\1)/'\'' ' >> ~/.bashrc
    echo '}' >> ~/.bashrc
    echo 'if [ "$color_prompt" = yes ]; then' >> ~/.bashrc
    echo ' PS1='\''${debian_chroot:+($debian_chroot)}\[\\033[01;32m\]\u@\h\[\\033[00m\]:\[\\033[01;34m\]\w\[\\033[01;31m\]$(parse_git_branch)\[\\033[00m\]\$ '\'' ' >> ~/.bashrc
    echo 'else' >> ~/.bashrc
    echo ' PS1='\''${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '\'' ' >> ~/.bashrc
    echo 'fi' >> ~/.bashrc
    echo 'unset color_prompt force_color_prompt' >> ~/.bashrc
    echo '' >> ~/.bashrc
}


create_sh_key() {
    rm  ~/.ssh/id_rsa
    ssh-keygen -b 4096 -t rsa -P ""  -C $GIT_EMAIL -f ~/.ssh/id_rsa
    eval $(ssh-agent -s)
    xclip -sel clip <  ~/.ssh/id_rsa.pub
}


init
install_common_utils
install_git
create_sh_key
install_node
