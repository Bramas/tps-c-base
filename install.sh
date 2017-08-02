update50
sudo apt-get update
curl https://gist.githubusercontent.com/Bramas/aa266e1cf92c0b7d5a36d5daa2fa2797/raw/9ccf1d8279217c693feab94b7b46aa9ebc47471d/udev_dpkg_workaround.sh | bash

sudo apt-get install -y clang
sudo apt-get install -y libsdl2-dev libsdl2-ttf-dev

sudo apt-get install -y supervisor x11vnc xvfb fluxbox novnc

pushd ~
mkdir .plugins
cd .plugins
git clone https://github.com/Bramas/cloud9-vnc.git
cd cloud9-vnc
sudo ./install.sh <<-EOF
yes
EOF
c9vnc
popd


echo 'export LD_LIBRARY_PATH=/usr/local/lib' >> $HOME/.bashrc
echo 'export CC=clang' >> $HOME/.bashrc
echo 'export LDLIBS="-lcrypt -lm -ltps -lSDL2 -lSDL2_ttf"' >> $HOME/.bashrc
echo 'export CFLAGS="-fsanitize=integer -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wshadow"' >> $HOME/.bashrc
echo 'alias tps-debug=debug50' >> $HOME/.bashrc

source $HOME/.bashrc

git clone https://gitlab.com/bramas/libtps.h.git
pushd libtps.h
sudo make install
popd
sudo rm -rf libtps.h


