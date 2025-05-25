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

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

XDG_DATA_DIRS="${HOME}/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:${XDG_DATA_DIRS}"

autoload -Uz promptinit
promptinit
prompt redhat

alias ll='ls -lah'
alias code="${HOME}/Programs/VSCodium/VSCodium.AppImage"

export EDITOR=nvim
export ELECTRON_OZONE_PLATFORM_HINT=wayland
export GTK_THEME=Adwaita:dark
export _JAVA_AWT_WM_NONREPARENTING=1
export LIBRARY_PATH="${HOME}/Programs/llvm/lib/:$LIBRARY_PATH"
export PATH="${HOME}/Programs/clangd/bin/:${PATH}"
export PATH="${HOME}/Programs/cmake/bin:${PATH}"
export PATH="${HOME}/Programs/glsl-analyzer/bin/:${PATH}"
export PATH="${HOME}/Programs/llvm/bin/:${PATH}"
export PATH="${HOME}/Programs/lua-language-server/bin/:${PATH}"
export PATH="${HOME}/Programs/nvim/bin/:${PATH}"
export PATH="${HOME}/Programs/Python/bin/:${PATH}"
export PATH="${HOME}/Programs/spirv-cross/bin/:${PATH}"
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

chpwd() {
  [[ -t 1 ]] || return
  case $TERM in
    *xterm*|alacritty|rxvt|(dt|k|E)term) print -Pn "\e]2;%~\a"
      ;;
  esac
}

chpwd

# case $TERM in
#         *xterm*|alacritty|rxvt|(dt|k|E)term) print -Pn "\e]2;%~\a";
#         ;;
#  esac

