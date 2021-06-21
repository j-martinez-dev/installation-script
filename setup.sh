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
    
    echo "Upgrade NPM"
    npm install -g npm@latest
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

install_aws(){
    sudo apt-get install awscli
}

install_terraform(){
  sudo apt get terraformcurl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
  curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
  sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
  sudo apt-get update && sudo apt-get install terraform
}

install_java() {
    rm -rf ~/.m2

    sudo apt-get install -y openjdk-11-jdk maven
    mkdir ~/.m2
    mkdir ~/.m2/repository

    echo '<?xml version="1.0" encoding="UTF-8"?>' >> ~/.m2/settings.xml
    echo '<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" ' >> ~/.m2/settings.xml
    echo '  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">' >> ~/.m2/settings.xml
    echo "  <localRepository>/home/$USER/.m2/repository</localRepository>" >> ~/.m2/settings.xml
    echo '  <pluginGroups>' >> ~/.m2/settings.xml
    echo '  </pluginGroups>' >> ~/.m2/settings.xml
    echo '  <proxies>' >> ~/.m2/settings.xml
    echo '  </proxies>' >> ~/.m2/settings.xml
    echo '  <servers>' >> ~/.m2/settings.xml
    echo '  </servers>' >> ~/.m2/settings.xml
    echo '  <mirrors>' >> ~/.m2/settings.xml
    echo '  </mirrors>' >> ~/.m2/settings.xml
    echo '  <profiles>' >> ~/.m2/settings.xml
    echo '  </profiles>' >> ~/.m2/settings.xml
    echo '</settings>' >> ~/.m2/settings.xml
}

init
install_common_utils
install_git
create_sh_key
install_node
install_aws
install_terraform
