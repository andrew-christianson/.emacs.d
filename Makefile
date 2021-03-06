py-deps:
	pip install  pylint flake8 jedi
	git clone https://github.com/python-rope/ropemacs.git || true
	git clone https://github.com/python-rope/rope.git || true
	git clone https://github.com/pinard/Pymacs.git || true
	git clone https://github.com/python-rope/ropemode.git || true
	cd Pymacs && make && make install
	rm -rf ./Pymacs

haskell-deps:
	mkdir -p .haskell-environments
	cabal install alex happy
	cd .haskell-environments && cabal unpack ghc-mod || true
	$(eval GMD=$(shell ls .haskell-environments | grep ghc-mod))
	cd .haskell-environments/$(GMD) && cabal sandbox init
	cd .haskell-environments/$(GMD) && cabal install
	sudo ln -s `pwd`/.haskell-environments/$(GMD)/.cabal-sandbox/bin/ghc-mod /usr/local/bin/ghc-mod
	sudo ln -s `pwd`/.haskell-environments/$(GMD)/.cabal-sandbox/bin/ghc-modi /usr/local/bin/ghc-modi

install: py-deps haskell-deps
	cask install
