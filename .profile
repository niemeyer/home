
export PATH=$HOME/bin:$PATH:/sbin:/usr/sbin:

export JAVA_HOME=/usr/lib/jvm/java-6-openjdk

# For Bazaar
export EMAIL='Gustavo Niemeyer <gustavo@niemeyer.net>'

# Remember that? :-)
export CVS_RSH=ssh

export EDITOR=vi

if [ -f ~/.profile_local ]; then
    . ~/.profile_local
fi

if [ -f ~/.python_startup ]; then
    export PYTHONSTARTUP=~/.python_startup
fi

# vim:et:ts=4:sw=4
