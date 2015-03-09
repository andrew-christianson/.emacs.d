py-deps:
	pip install rope ropemacs pylint flake8 jedi
	git clone https://github.com/pinard/Pymacs.git
	cd Pymacs && make && make install
	rm -rf ./Pymacs
