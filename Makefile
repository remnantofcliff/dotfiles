.PHONY := all: alacritty neovim sway zshrc zshenv

all: alacritty neovim sway zshrc zshenv

alacritty: .config/alacritty
	rm -rf ~/${<}.old/
	mv ~/${<} ~/${<}.old/
	cp -r ${<} ~/${<}
neovim: .config/nvim
	rm -rf ~/${<}.old/
	mv ~/${<} ~/${<}.old/
	cp -r ${<} ~/${<}
sway: .config/sway
	rm -rf ~/${<}.old/
	mv ~/${<} ~/${<}.old/
	cp -r ${<} ~/${<}
zshrc: .zshrc
	rm -f ~/${<}.old
	mv ~/${<} ~/${<}.old
	cp -r ${<} ~/${<}
zshenv: .zshenv
	rm -f ~/${<}.old
	mv ~/${<} ~/${<}.old
	cp -r ${<} ~/${<}
