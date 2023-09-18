#!/bin/bash
platform=$(uname)

if [[ $platform == 'Linux' ]]; then
   echo "Linux detected";
  # sudo apt install -y zsh
elif [[ $platform == 'Darwin' ]]; then
   echo "macOS detected";
fi

chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sed -i "s|robbyrussell|powerlevel10k/powerlevel10k|" ~/.zshrc;
sed -i "s|^plugins=(git)$|plugins=(git ruby colorize zsh-autosuggestions zsh-syntax-highlighting)|" ~/.zshrc;