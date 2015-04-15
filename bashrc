PUPMODPATH='puppet apply --modulepath=~/git/sholland/mock-modules'
PUPENC='`pwd`/init --external_nodes=`pwd`/enc.sh --node_terminus=exec'
alias pupaptestmod="$PUPMODPATH $PUPENC"
alias dpupaptestmod="$PUPMODPATH $PUPENC --debug --trace"
alias testpupmod=$PUPMODPATH
alias dtestpupmod="$PUPMODPATH --debug --trace"
export PATH=$PATH:~/git/sholland/scripts
alias prodlin='ssh_add_count=`ssh-add -l | wc -l`; [ $ssh_add_count > 0 ] || ssh-add ;ssh 172.20.1.3'
alias intlin='ssh 172.20.132.3'
