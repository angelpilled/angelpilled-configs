if status is-interactive
    # Commands to run in interactive sessions can go here
end

function !!
    eval sudo $history[1]
end

set fish_greeting

function fish_prompt
	set_color FF5FD7; echo -n (whoami);
	set_color FFFFFF; echo -n ' at ';
	set_color 00AFFA; echo -n (uname -n) "in";
	set_color FFD7AF; echo -n " "; echo (pwd | sed "s|^$HOME|~|");
	set_color FFFFFF; echo '$ '
end

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Beautifying commands
alias neofetch='neofetch | dotacat'
alias cow='fortune | cowsay'
alias startx='start-de.sh'

# Utilities
alias cpc='xclip -sel c <'
alias c='clear'
alias xampp='sudo /opt/lampp/manager-linux-x64.run'
export EDITOR=nvim

# "Short"cuts
alias nv='nvim'
alias yt-dlp-mp3='yt-dlp --downloader aria2c -x --audio-format mp3'
alias yt-dlp-mp4='yt-dlp --downloader aria2c -x --format mp4 -k'

# Fun commands
alias bad-apple='cvlc -V aa -q --no-video-title-show bad-apple.mp4'

# Typos
alias gti='git'
alias sl='ls'
