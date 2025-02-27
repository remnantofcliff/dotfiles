.PHONY := all: alacritty neovim sway

all: alacritty neovim sway zsh

alacritty: .config/alacritty/
	cp -rf ${<} ~/${<}
neovim: .config/nvim/
	cp -rf ${<} ~/${<}
sway: .config/sway/
	cp -rf ${<} ~/${<}
zsh: .zshrc
	cp -rf ${<} ~/${<}
