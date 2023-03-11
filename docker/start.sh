#!/bin/sh

podname="$(hostname)"
export ERLANG_NODE_ARG="ejabberd@$podname.$HEADLESS_SVC"
export ERL_MAX_PORTS=500000
echo ERLANG_NODE_ARG is $ERLANG_NODE_ARG

if [[ $podname == *-0 ]] 
then
   echo ============master Node==========   
   export CTL_ON_CREATE="register admin localhost $EJABBERD_ADMIN_PASS"
else
   echo ============slave Node===========
   podmaster="$(echo $podname | sed 's/-[0-9]\+/-0/g')"
   export CTL_ON_CREATE="join_cluster ejabberd@$podmaster.$HEADLESS_SVC"
   #export CTL_ON_START="registered_users localhost"
fi

/home/ejabberd/bin/ejabberdctl foreground -name $ERLANG_NODE_ARG
