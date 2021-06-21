install_intellij() {
    sudo rm -rf /opt/intellij
    sudo mkdir /opt/intellij
    wget https://download.jetbrains.com/idea/ideaIU-2021.1.2.tar.gz
    tar -xvzf ideaIU-2021.1.2.tar.gz
    rm ideaIU-2021.1.2.tar.gz
    sudo mv idea-I**/* /opt/intellij
    rm -rf idea-I*
    echo "alias intellij='nohup sh /opt/intellij/bin/idea.sh > /dev/null 2>&1&'" >> ~/.bashrc
    # lombook plugin 
    # eclipse formatter 
    # maven settings
}

install_intellij
