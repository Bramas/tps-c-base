update50
sudo apt-get update
curl https://gist.githubusercontent.com/Bramas/aa266e1cf92c0b7d5a36d5daa2fa2797/raw/9ccf1d8279217c693feab94b7b46aa9ebc47471d/udev_dpkg_workaround.sh | bash

sudo apt-get install libsdl2-dev

sudo apt-get install supervisor x11vnc xvfb fluxbox novnc

pushd ~
mkdir .plugins
cd .plugins
git clone https://github.com/Bramas/cloud9-vnc.git
cd cloud9-vnc
./install_cs50.sh
./run.sh
popd


echo 'LD_LIBRARY_PATH=/usr/local/lib' >> $HOME/.bashrc
echo 'LDLIBS="-lcrypt -lcs50 -lm -ltps -lSDL2 -lSDL2_ttf"' >> $HOME/.bashrc

source $HOME/.bashrc

git clone https://gitlab.com/bramas/libtps.h.git
pushd libtps.h
sudo make install
popd
rm -rf libtps.h

