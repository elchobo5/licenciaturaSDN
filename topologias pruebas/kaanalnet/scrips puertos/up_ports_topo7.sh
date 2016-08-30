#!/bin/bash
for i in {1..50}
do
   for j in {0..2}
   do
        c="_t"
        ovs-ofctl mod-port s$i s$i$c$j up
        ovs-ofctl mod-port s$i s$i$c$j Receive
   done
done

