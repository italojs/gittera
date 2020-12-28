NC="\033[0m" # No Color
LIGHT_GREY="\033[0;37m"
YELLOW="\033[1;33m"

PRINT(){
    MESSAGE=$1
    echo "> ${LIGHT_GREY} ${MESSAGE} ${NC}"
}

WARN(){
    MESSAGE=$1
    echo "> ${YELLOW} ${MESSAGE} ${NC}"
}

CURRENT_BRANCH=$(git branch | grep '^*' | sed 's/* //' )

MAIN_BRANCH=$1
if [ -z "$MAIN_BRANCH" ];
then
    PRINT "Type your main branch: "
    read MAIN_BRANCH
fi;

for BRANCH in `git branch --list|sed 's/\*//g'`;
  do 
    if [[ $BRANCH == release* ]];
    then
        PRINT "Entering into $BRANCH"
        git fetch
        git checkout $BRANCH
        git update-index -q --refresh
        if ! git diff-index --quiet HEAD --; then
            WARN "Working directory not clean, please commit your changes first"
            exit 0
        fi
        git pull
        git pull origin master
        PRINT "Send this code to remote? (y/n)"
        read input
        if echo $input | grep -iq "^y" ;then
            git push -u origin $BRANCH
        fi
    fi;
  done
git checkout $CURRENT_BRANCH;

