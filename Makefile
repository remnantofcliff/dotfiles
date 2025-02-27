.PHONY := all: alacritty neovim sway

all: alacritty neovim sway zsh

alacritty: .config/alacritty/
	cp -r ${<} ~/${<}
neovim: .config/nvim/
	cp -r ${<} ~/${<}
sway: .config/sway/
	cp -r ${<} ~/${<}
zsh: .zshrc
	cp -r ${<} ~/${<}
