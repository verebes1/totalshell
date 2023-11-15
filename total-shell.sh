#!/bin/bash
platform=$(uname)
theme="s|robbyrussell|powerlevel10k/powerlevel10k|"
plugins='s|^plugins=(git)$|plugins=(git ruby colorize zsh-autosuggestions zsh-syntax-highlighting)|'
flag="-i"

if [[ $platform == 'Linux' ]]; then
  echo "Linux detected";
  sudo apt install -y zsh
  chsh -s $(which zsh)
  echo 'export PATH="'$PATH':$PATH"' >> $HOME/.zshrc
  sudo cat $HOME/.zshrc >> /root/.zshrc

elif [[ $platform == 'Darwin' ]]; then
  echo "macOS detected";
  flag="-i ''"
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cat $HOME/.zshrc.pre-oh-my-zsh >> $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sed $flag "$theme" $HOME/.zshrc;
sed $flag "$plugins" $HOME/.zshrc;