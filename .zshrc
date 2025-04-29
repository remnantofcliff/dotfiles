# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '${HOME}/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
XDG_DATA_DIRS="${HOME}/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:${XDG_DATA_DIRS}"

autoload -Uz promptinit
promptinit
prompt redhat

alias ll='ls -lah'
alias code="${HOME}/Programs/VSCodium/VSCodium.AppImage"

export EDITOR=nvim
export ELECTRON_OZONE_PLATFORM_HINT=wayland
export GTK_THEME=Adwaita:dark
export LIBRARY_PATH="${HOME}/Programs/llvm/lib/:$LIBRARY_PATH"
export PATH="${HOME}/Programs/clangd/bin/:${PATH}"
export PATH="${HOME}/Programs/cmake/bin:${PATH}"
export PATH="${HOME}/Programs/glsl-analyzer/bin/:${PATH}"
export PATH="${HOME}/Programs/llvm/bin/:${PATH}"
export PATH="${HOME}/Programs/lua-language-server/bin/:${PATH}"
export PATH="${HOME}/Programs/nvim/bin/:${PATH}"
export PATH="${HOME}/Programs/Python/bin/:${PATH}"
export QT_STYLE_OVERRIDE=Adwaita-Dark
export QT_QPA_PLATFORM=wayland
export SDL_VIDEODRIVER=wayland
export TERMINAL=/usr/bin/alacritty

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

