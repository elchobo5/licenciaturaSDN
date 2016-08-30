#!/bin/bash
for i in {1..20}
do
   for j in {0..19}
   do
        c="_t"
        ovs-ofctl mod-port s$i s$i$c$j up
        ovs-ofctl mod-port s$i s$i$c$j Receive
   done
done
