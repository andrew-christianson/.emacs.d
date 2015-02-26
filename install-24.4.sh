sudo apt-get -y build-dep emacs24
curl http://ftp.gnu.org/gnu/emacs/emacs-24.4.tar.gz | tar -xv
cd ./emacs-24.4 && ./configure && make
cd ./emacs-24.4 && sudo make install
