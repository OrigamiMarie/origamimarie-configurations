# sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

# and let's have some EnvImprovement fun!
source /apollo/env/envImprovement/var/zshrc

export PROMPT="$(echo '%{\e[0;34m%}%2m'):$(echo '%{\e[0m%}%/')$(echo '%{\e[0m%} ')$(echo '%{\e[0;32m%}%#') $(echo '%{\e[0m%}')"

export BRAZIL_WORKSPACE_DEFAULT_LAYOUT=short
export LESS="-F -X -R"

export JAVA_PATH=/apollo/env/JDK7/jdk1.7.0
export JAVA_HOME=/apollo/env/JDK7/jdk1.7.0

#export ORACLE_HOME=/apollo/env/OracleEE/server/10.2.0.2/A15db
export PATH=$ORACLE_HOME/bin:$PATH
export ORACLE_SID=orc1
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH

export PATH=$PATH:/apollo/env/SDETools/bin:/apollo/env/envImprovement/bin:$JAVA_HOME/bin:$ORACLE_HOME/bin
export PATH=/home/maripaul/firefox:$PATH
export P4PORT=perforce:9591
export P4EDITOR=vim #(or your editor of choice)
export P4CONFIG=.p4config

p4v() {
    ~/perforce/bin/p4v &
}

idea12() {
    export JDK_HOME=$JAVA_HOME
    ~/bin/idea-IC-129.1359/bin/idea.sh &
}

or() {
    sqlplus cam_user@"'localhost:1521/orcl.amazon'"
}

selenium() {
    java -jar /apollo/env/SeleniumRC/lib/selenium-server.jar -firefoxProfileTemplate /rhel5pdi/home/maripaul/.mozilla/firefox/wvaqpwbx.selenium
}

dbvis_helper() {
    export INSTALL4J_JAVA_HOME_OVERRIDE=/apollo/env/JDK7/jdk1.7.0/jre
    exec dbvis
}
