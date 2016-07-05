# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
 source ~/perl5/perlbrew/etc/bashrc 
 source ~/perl5/perlbrew/etc/bashrc 
 source ~/perl5/perlbrew/etc/bashrc 


#branch名の表示
function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function precmd() {
	PROMPT="\h@\u:\W\$(parse_git_branch) \$ "
}
function proml {
    #git brach表示
    #ホワイト
	# PS1="\[\e[1;37m\]\h@\u:\W\$(parse_git_branch) \$ "

    #カラフル
	PS1="\[\e[0;36m\]\u@\[\e[0;32m\]\h:\[\e[0;35m\]\w\[\e[0;33m\]\$(parse_git_branch)\[\e[1;37m\]\n \$ "
}
proml

#gitのコマンド保管
source ~/git-completion.bash

