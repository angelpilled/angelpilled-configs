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
alias yt-dlp-mp3='yt-dlp -o "%(title)s.%(ext)s" --downloader aria2c --audio-format mp3 -x'
alias yt-dlp-mp4='yt-dlp -o "%(title)s.%(ext)s" --downloader aria2c --format mp4 -k'
alias yt-dlp-mp4-date='yt-dlp -o "%(upload_date>%Y-%m-%d)s %(title)s.%(ext)s" --format mp4 -k --downloader aria2c'
alias rofimoji='rofimoji --action copy'

# Fun commands
alias bad-apple='cvlc -V aa -q --no-video-title-show bad-apple.mp4'
alias please='sudo'

# Typos
alias gti='git'
alias sl='ls'

function r
    # Define a temporary file to store the last visited directory
    set -l tempfile '/tmp/ranger_cd_'.(id -u)

    # Launch ranger and tell it to write the last visited directory to the tempfile
    ranger --choosedir=$tempfile $argv
    # Check if the tempfile exists and is not empty
    if test -s $tempfile
        # Read the directory from the tempfile
        set -l lastdir (cat $tempfile)
        # Change to the directory
        cd $lastdir
        # Optionally, clean up by removing the tempfile
        command rm -f $tempfile
    end
end

set -U fish_user_paths ~/.dotnet/tools $fish_user_paths
