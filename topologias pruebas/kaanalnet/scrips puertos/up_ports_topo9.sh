#!/bin/bash
for i in {1..127}
do
   for j in {0..128}
   do
        c="_t"
        ovs-ofctl mod-port s$i s$i$c$j up
        ovs-ofctl mod-port s$i s$i$c$j Receive
   done
done

