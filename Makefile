.PHONY := all: alacritty neovim sway

all: alacritty neovim sway zsh

alacritty: .config/alacritty/
	rm -rf ~/.config/alacritty.old/
	mv ~/${<} ~/.config/alacritty.old/
	cp -r ${<} ~/${<}
neovim: .config/nvim/
	rm -rf ~/.config/nvim.old/
	mv ~/${<} ~/.config/nvim.old/
	cp -r ${<} ~/${<}
sway: .config/sway/
	rm -rf ~/.config/sway.old/
	mv ~/${<} ~/.config/sway.old/
	cp -r ${<} ~/${<}
zsh: .zshrc
	rm -f ~/.zshrc.old
	mv ~/${<} ~/.zshrc.old
	cp -r ${<} ~/${<}
