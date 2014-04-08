#! /bin/bash -e

exp_id=$1

[ ! $exp_id ] && echo "usage: $0 <exp_id>" && false

cd "$(dirname "$0")"
NODES_LIST=$(./get_failed_nodes.sh $exp_id)

nodes=$NODES_LIST
while [ "$nodes" ]; do
for node in $nodes
do
    ssh $node 2>/dev/null '
	source /etc/profile;
	cat /var/log/gateway-server/gateway-server.log \
	| grep -e ERROR -B 2 -A 3 | head -n 6 \
	| egrep "Flash firmware failed on (gwt|m3)"
	ftdi-devices-list -t 4232 | grep -q ControlNode || echo FTDI: No Control Node
	ftdi-devices-list -t 2232 | grep -q Description || echo FTDI: No Open Node
    ' > /tmp/$$.$node || echo $node >> /tmp/$$.failed &
    [ $[ i = (i+1) % 10 ] = 0 ] && sleep 1
done
wait
nodes=$(touch /tmp/$$.failed; cat /tmp/$$.failed; \rm /tmp/$$.failed)
done

for node in $NODES_LIST
do
	echo -n "$node: "
	cat /tmp/$$.$node | tr '\n' ' '
	\rm /tmp/$$.$node
	echo
done
