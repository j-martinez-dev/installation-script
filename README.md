# installation-script


wget https://raw.githubusercontent.com/panchitoboy/installation-script/main/setup.sh && sudo chmod +x setup.sh && ./setup.sh


# Mode windows + wsl

- Install VcXsrv [link](https://sourceforge.net/projects/vcxsrv/files/vcxsrv/)
- Install notepad++ [link](https://notepad-plus-plus.org/downloads/)
- Install vscode [link](https://code.visualstudio.com/download)
- Install docker desktop [link](https://www.docker.com/products/docker-desktop)
- Install wsl2  
  - dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
  - dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
  - Download the Linux kernel update package [link](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
  - wsl --set-default-version 2
- wget https://raw.githubusercontent.com/panchitoboy/installation-script/main/setup-wsl.sh && sudo chmod +x setup-wsl.sh && ./setup-wsl.sh
