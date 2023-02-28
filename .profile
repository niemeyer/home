#if [ "$LOADED_PROFILE" = 1 ]; then
#    return
#fi
#export LOADED_PROFILE=1

export PATH=$HOME/bin:/snap/bin:/bin:/sbin:/usr/bin:/usr/sbin
export GOPATH=$HOME

export JAVA_HOME=/usr/lib/jvm/java-6-openjdk

# For Bazaar
export EMAIL='Gustavo Niemeyer <gustavo@niemeyer.net>'

# Remember that? :-)
export CVS_RSH=ssh

export EDITOR=vi

export GDK_SCALE=2
export GDK_DPI_SCALE=0.4

export LC_COLLATE=C

export ECR=626886203892.dkr.ecr.eu-central-1.amazonaws.com

if [ -f ~/.profile_local ]; then
    . ~/.profile_local
fi

if [ -f ~/.python_startup ]; then
    export PYTHONSTARTUP=~/.python_startup
fi

if [ $(hostname) = nomad ]; then
    unset DBUS_SESSION_BUS_ADDRESS
    setxkbmap -layout us -variant altgr-intl
    synclient PalmDetect=1
fi

# vim:et:ts=4:sw=4
