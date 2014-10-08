#	----------
#	PATHS
#	----------

# homebrews should always take precedence
export PATH=/usr/local/bin:$PATH

# go path
export GOPATH=/Users/colingerber/go/
export PATH=$GOPATH/bin:$PATH

# Setting PATH for EPD_free-7.3-1
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
# export PATH

# Setting PATH for Python 3.3
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.3/bin:${PATH}"
# export PATH

# added by Anaconda 1.6.1 installer
export PATH="/Users/colingerber/anaconda/bin:$PATH:/usr/local/pgsql/bin"

# add my custom modules to python path
PYTHONPATH="${PYTHONPATH}:/Users/colingerber/Documents/Programming/Personal/Python_modules"
export PYTHONPATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# export PATH

# Ruby Gems Paths
export PATH=$(brew --prefix ruby)/bin:$PATH

#   Change Prompt
#   ------------------------------------------------------------
    export PS1="________________________________________________________________________________\n| \w @ \h (\u) \t \n| => "
    export PS2="| => "

#	-------------------------
#	INSTALLED CLI FUNCTIONS
#	-------------------------
# istats, imgurr, weather, htop, tmux, lsp
# lsp:
# -t : time since change
# -s : size of files
# -p : left align



#	------------
#	ALIASES
#	------------

alias ll='ls -alFt'
alias up='cd ..'
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias s='tmux'                              # s:            run tmux
alias myip='curl ip.appspot.com'            # myip:         My IP
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias harbinger='ssh colin.gerber@ischool.berkeley.edu'   # ischool server

#	-------
#	GIT
#	-------

workdone(){
    default="1 day ago"
    git log --committer=moglenstar@gmail.com --pretty=format:"%Cgreen%ar (%h)%n%Creset> %s %b%n" --since="${1:-$default}" --no-merges
}
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"	# git tree


#	-------------
#	FUNCTIONS
#	-------------

function myenvs { cd /Users/colingerber/anaconda/envs; ls; cd -;}		# show my anaconda envs

function profile { cd; nano .bash_profile;}		# opens profile in nano

function weather { curl -s "http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query=${@:-94704}"|perl -ne '/<title>([^<]+)/&&printf "\x1B[0;34m%s\x1B[0m: ",$1;/<fcttext>([^<]+)/&&print $1,"\n"';}		# gets the weather for the next two days

function server { python -m SimpleHTTPServer $1; }		# runs a local python server in the current directory. Add number input for different ports.

function cdl { cd $1; ls;}		    # cd and list

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

#	---------------------------
#	adding colors to terminal
#	---------------------------

export CLICOLOR=1

export LSCOLORS=CxFxGxDxBxegedabagaced


#   ---------------------------
#   4.  SEARCHING
#   ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string


