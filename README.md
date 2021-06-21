# installation-script


wget https://raw.githubusercontent.com/panchitoboy/installation-script/master/setup.sh && sudo chmod +x setup.sh && ./setup.sh


# Mode windows + wsl

- Install notepad++ [link](https://notepad-plus-plus.org/downloads/)
- Install vscode [link](https://code.visualstudio.com/download)
- Install docker desktop [link](https://www.docker.com/products/docker-desktop)
- Install wsl2  
  - dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
  - dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
  - Download the Linux kernel update package [link](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
  - wsl --set-default-version 2

