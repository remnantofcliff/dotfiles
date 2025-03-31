.PHONY := all: alacritty neovim sway

all: alacritty neovim sway zsh

alacritty: .config/alacritty/
	rm -r ~/.config/alacritty.old/
	mv ~/${<} ~/.config/alacritty.old/
	cp -r ${<} ~/${<}
neovim: .config/nvim/
	rm -r ~/.config/nvim.old/
	mv ~/${<} ~/.config/nvim.old/
	cp -r ${<} ~/${<}
sway: .config/sway/
	rm -r ~/.config/sway.old/
	mv ~/${<} ~/.config/sway.old/
	cp -r ${<} ~/${<}
zsh: .zshrc
	rm -r ~/.zshrc.old
	mv ~/${<} ~/.zshrc.old
	cp -r ${<} ~/${<}
