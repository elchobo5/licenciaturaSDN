<?php
print_r("#The sections are strictly ordered.\n#Don't remove or rearrange any section\n\n");
print_r("[EmulationName]\n");
print_r("topo8\n");
print_r("\n");
print_r("[PhysicalTopology]\n");
print_r("#First line: Number of physical machines\n#Then, each line specifies a tuple:\n#type name ip cpu memory disk external_interface bandwidth\n");
print_r("6\n");
print_r("manager manager 192.168.227.130\n");
print_r("node node 192.168.227.131 4 512 8 eth0 1024\n");
print_r("node node2 192.168.227.129 4 512 8 eth0 1024\n");
print_r("node node3 192.168.227.128 4 512 8 eth0 1024\n");
print_r("node node4 192.168.227.127 4 512 8 eth0 1024\n");
print_r("node node5 192.168.227.126 4 512 8 eth0 1024\n");
print_r("\n");
print_r("[PhysicalMachineDelay]\n");
print_r("#Pairwise delay between any physical vms\n#If no delay between a pair is specified, default value will be considered\n#Default value of delay is 0\n#First line: Number of pair of machines have delay\n#Next, each line specifies a tuple\n#machine1, machine2, delay (ms)\n");
print_r("0\n");
print_r("\n");
print_r("[LogicalTopology]\n");
print_r("#First line: Number of switches, number of links\n#Each switch is represented by 's#'\n#Switch # should start with 1\n#Next, each line specifies a bidirectional link with the following format:\n# s# s# bandwidth delay\n");
print_r("73 72\n");
$nodoArbol = 2;
$hostArbol = 1;
$profundidad = 0;
for ($i = 0; $i < 73; $i++) {
	$j = $i + 1;
	if ($profundidad < 2) {
		for ($p = $nodoArbol; $p < $nodoArbol + 8; $p++) {
			print_r("s$j s$p 499 0\n");
		}
	}
	$nodoArbol = $nodoArbol + 8;
	if (($i == 0) || ($i == 8) || ($i == 64))
		$profundidad++;
}
print_r("\n");
print_r("[Images]\n");
print_r("#Number of images\n#each line image id, type, location\n");
print_r("2\n");
print_r("i1 tc base_tc.qcow2\n");
print_r("i2 ubuntu base_lubuntu_mini.qcow2\n");
print_r("\n");
print_r("[VirtualMachineProvision]\n");
print_r("#Start marker of this section. Don't remove\nHypervisor=kvm\nLibrary=lib-virt\nNetworkFile=resources/provisioning/libvirt/libvirt_network.xml\n#End marker of this section. Don't remove\n");
print_r("\n");
print_r("[VirtualMachines]\n");
print_r("#First line: Number of VMs\n#Each switch is represented by 'h#'\n#VM# should start with 1\n#Next, each line specifies a VM, the switch it is attached, CPU, B/W(Mbps), Memory(MB) and image:\n# VM# s# CPU B/W Memory i#\n");
print_r("512\n");
$nodoArbol = 2;
$hostArbol = 1;
$profundidad = 0;
for ($i = 0; $i < 73; $i++) {
	$j = $i + 1;
	if ($profundidad < 2) {
	}
	else {
		for ($p = $hostArbol; $p < $hostArbol + 8; $p++) {
			print_r("h$p s$j 1 300 64 i1\n");
		}
		$hostArbol = $hostArbol + 8;
	}
	$nodoArbol = $nodoArbol + 8;
	if (($i == 0) || ($i == 8) || ($i == 64))
		$profundidad++;
}
print_r("\n");
print_r("[Controllers]\n");
print_r("#First line: Number of controllers\n#Each controller is represented by 'c#'\n#Controller # should start with 1\n#Next, each line a tuple:\n# c# ip port\n");
print_r("1\n");
print_r("c1 192.168.227.130 6633\n");
print_r("\n");
print_r("[Switch2Controller]\n");
print_r("#First line: Number of switches\n#Next, each line specifies a switch and its controller\n# s# c#\n");
print_r("73\n");
for($i = 1; $i < 74; $i++) {
	print_r("s$i c1\n");
}
print_r("\n");
print_r("[Credentials]\n");
print_r("#User name of the dot nodes\nUserName=dot\n");
print_r("\n");
print_r("[OtherConfig]\n");
print_r("#\nOFVersion=1.0\n");
?>