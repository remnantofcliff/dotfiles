.PHONY := alacritty neovim sway

alacritty: .config/alacritty/
	cp -r ${<} ~/${<}
neovim: .config/nvim/
	cp -r ${<} ~/${<}
sway: .config/sway/
	cp -r ${<} ~/${<}
