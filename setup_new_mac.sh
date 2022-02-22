#!/bin/bash -e

echo "change shell to bash"
chsh -s /bin/bash

echo "install homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "install software"
packages="tmux vim gnupg2 pinentry-mac gopass git ansible"
for package in ${packages}; do
  brew install ${package}
done

echo "install tmux-plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "install spf13"
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh && rm spf13-vim.sh

echo "install tmux-themepack"
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack

#echo "decrypting gpg key for gopass"
#ansible-vault decrypt ${gpg_path}


echo "initial instllation is complete.  Things that haven't been automated"
echo "that you may need to install include:"
echo "- Docker Desktop"

