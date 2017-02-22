export PROMPT="$(echo '%{\e[0;34m%}%2m'):$(echo '%{\e[0m%}%/')$(echo '%{\e[0m%} ')$(echo '%{\e[0;32m%}%#') $(echo '%{\e[0m%}')"

# Enable shell colors in OSX.  
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


# AudienceScience stuff
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export PATH=$PATH:~/vert.x-3.0.0-milestone5/bin/:/usr/local/mysql/bin/


setjdk () {
  if [ $# -ne 0 ]
    then
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
    if [ -n "${JAVA_HOME+x}" ]
      then
      removeFromPath $JAVA_HOME
    fi
    export JAVA_HOME=`/usr/libexec/java_home -v $@`
    export PATH=$JAVA_HOME/bin:$PATH
  fi
}

removeFromPath () {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

