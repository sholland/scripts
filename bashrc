PUPMODPATH='puppet apply --modulepath=~/git/sholland/mock-modules'
PUPENC='`pwd`/init --external_nodes=`pwd`/enc.sh --node_terminus=exec'
alias pupaptestmod="$PUPMODPATH $PUPENC"
alias dpupaptestmod="$PUPMODPATH $PUPENC --debug --trace"
alias testpupmod=$PUPMODPATH
alias dtestpupmod="$PUPMODPATH --debug --trace"
