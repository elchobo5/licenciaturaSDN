Set RandomNumberSeed = 0
Set SimSpeed = AS_FAST_AS_REAL_CLOCK
Set TickToNanoSec = 1
Set WireLogFlag = on
Set WirelessLogFlag = on
Set LteLogFlag = on
Set WiFiChannelCoding11a = on
Set WiFiChannelCoding11n = on
Set WiFiEnableBitError11a = off
Set WiFiEnableBitError11n = off
Set WAVEEnableBitError = off
Set WAVEChannelCoding = on
Set LTEChannelCoding = off
Set RunTimePacketAnimationNodeMovementAndGroupingStatus = off
Set IP_Prefix = 1.0.0.0


Create Node 1 as EXT_OF_CTRL with name = EXT_OF_CTRL1
	Define port 1
		Module Interface : Node1_Interface_PORT_1
			Set Node1_Interface_PORT_1.ip = 1.0.1.1
			Set Node1_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node1_ARP_PORT_1
			Set Node1_ARP_PORT_1.arpMode = RunARP
			Set Node1_ARP_PORT_1.flushInterval = 3000
			Set Node1_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node1_FIFO_PORT_1
			Set Node1_FIFO_PORT_1.max_qlen = 50
			Set Node1_FIFO_PORT_1.log_qlen = off
			Set Node1_FIFO_PORT_1.log_option = FullLog
			Set Node1_FIFO_PORT_1.samplerate = 1
			Set Node1_FIFO_PORT_1.logFileName = topo1.fifo_N1_P1_qlen.log
			Set Node1_FIFO_PORT_1.log_drop = off
			Set Node1_FIFO_PORT_1.drop_samplerate = 1
			Set Node1_FIFO_PORT_1.droplogFileName = topo1.fifo_N1_P1_drop.log

		Module TCPDUMP : Node1_TCPDUMP_PORT_1

		Module LO : Node1_LO_PORT_1

		Module MAC8023 : Node1_MAC8023_PORT_1
			Set Node1_MAC8023_PORT_1.mac = 0:1:0:0:0:2
			Set Node1_MAC8023_PORT_1.lock_mac = off
			Set Node1_MAC8023_PORT_1.PromisOpt = off
			Set Node1_MAC8023_PORT_1.mode = full
			Set Node1_MAC8023_PORT_1.log = off
			Set Node1_MAC8023_PORT_1.logInterval = 1
			Set Node1_MAC8023_PORT_1.NumCollision = off
			Set Node1_MAC8023_PORT_1.NumUniInPkt = off
			Set Node1_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node1_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node1_MAC8023_PORT_1.NumBroInPkt = off
			Set Node1_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node1_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node1_MAC8023_PORT_1.NumDrop = off
			Set Node1_MAC8023_PORT_1.InThrput = off
			Set Node1_MAC8023_PORT_1.OutThrput = off
			Set Node1_MAC8023_PORT_1.InOutThrput = off
			Set Node1_MAC8023_PORT_1.UniInLogFile = topo1.8023_N1_P1_UniIn.log
			Set Node1_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N1_P1_UniOut.log
			Set Node1_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N1_P1_UniInOut.log
			Set Node1_MAC8023_PORT_1.BroInLogFile = topo1.8023_N1_P1_BroIn.log
			Set Node1_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N1_P1_BroOut.log
			Set Node1_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N1_P1_BroInOut.log
			Set Node1_MAC8023_PORT_1.CollLogFile = topo1.8023_N1_P1_Coll.log
			Set Node1_MAC8023_PORT_1.DropLogFile = topo1.8023_N1_P1_Drop.log
			Set Node1_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N1_P1_InThrput.log
			Set Node1_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N1_P1_OutThrput.log
			Set Node1_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N1_P1_InOutThrput.log
			Set Node1_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node1_Phy_PORT_1
			Set Node1_Phy_PORT_1.Bw = 10
			Set Node1_Phy_PORT_1.BER = 0.0
			Set Node1_Phy_PORT_1.PropDelay = 1
			Set Node1_Phy_PORT_1.linkfail = off
			Set Node1_Phy_PORT_1.linkfailFileName = topo1.phy_N1_P1.linkfail

		Module Link : Node1_PORT_1
			Set Node1_PORT_1.guitag_remotenode = yes


		Bind Node1_Interface_PORT_1 Node1_ARP_PORT_1
		Bind Node1_ARP_PORT_1 Node1_FIFO_PORT_1
		Bind Node1_FIFO_PORT_1 Node1_TCPDUMP_PORT_1
		Bind Node1_TCPDUMP_PORT_1 Node1_LO_PORT_1
		Bind Node1_LO_PORT_1 Node1_MAC8023_PORT_1
		Bind Node1_MAC8023_PORT_1 Node1_Phy_PORT_1
		Bind Node1_Phy_PORT_1 Node1_PORT_1
	EndDefine

EndCreate

Create Node 2 as OF_SW with name = OF_SW2
	Module OFSwitch : Node2_OFSwitch_0
		Set Node2_OFSwitch_0.guitag_addport = yes
		Set Node2_OFSwitch_0.flow_table_amount = 15
		Set Node2_OFSwitch_0.flow_table_entry_amount = 256
		Set Node2_OFSwitch_0.group_table_entry_amount = 256
		Set Node2_OFSwitch_0.table_miss_buffer_size = 1000
		Set Node2_OFSwitch_0.fifo_queue_size = 50
		Set Node2_OFSwitch_0.controller_ip = 1.0.1.1
	Define port 1
		Module MAC8023 : Node2_MAC8023_PORT_1

			Set Node2_OFSwitch_0.port1 = Node2_MAC8023_PORT_1
			Set Node2_OFSwitch_0.fixed_net1 = Node2_MAC8023_PORT_1.no
			Set Node2_MAC8023_PORT_1.recvtarget = Node2_OFSwitch_0

			Set Node2_MAC8023_PORT_1.mac = 0:1:0:0:0:3
			Set Node2_MAC8023_PORT_1.lock_mac = off
			Set Node2_MAC8023_PORT_1.PromisOpt = on
			Set Node2_MAC8023_PORT_1.mode = full
			Set Node2_MAC8023_PORT_1.log = off
			Set Node2_MAC8023_PORT_1.logInterval = 1
			Set Node2_MAC8023_PORT_1.NumCollision = off
			Set Node2_MAC8023_PORT_1.NumUniInPkt = off
			Set Node2_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node2_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node2_MAC8023_PORT_1.NumBroInPkt = off
			Set Node2_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node2_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node2_MAC8023_PORT_1.NumDrop = off
			Set Node2_MAC8023_PORT_1.InThrput = off
			Set Node2_MAC8023_PORT_1.OutThrput = off
			Set Node2_MAC8023_PORT_1.InOutThrput = off
			Set Node2_MAC8023_PORT_1.UniInLogFile = topo1.8023_N2_P1_UniIn.log
			Set Node2_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N2_P1_UniOut.log
			Set Node2_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N2_P1_UniInOut.log
			Set Node2_MAC8023_PORT_1.BroInLogFile = topo1.8023_N2_P1_BroIn.log
			Set Node2_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N2_P1_BroOut.log
			Set Node2_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N2_P1_BroInOut.log
			Set Node2_MAC8023_PORT_1.CollLogFile = topo1.8023_N2_P1_Coll.log
			Set Node2_MAC8023_PORT_1.DropLogFile = topo1.8023_N2_P1_Drop.log
			Set Node2_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N2_P1_InThrput.log
			Set Node2_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N2_P1_OutThrput.log
			Set Node2_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N2_P1_InOutThrput.log
			Set Node2_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node2_Phy_PORT_1
			Set Node2_Phy_PORT_1.Bw = 10
			Set Node2_Phy_PORT_1.BER = 0.0
			Set Node2_Phy_PORT_1.PropDelay = 1
			Set Node2_Phy_PORT_1.linkfail = off
			Set Node2_Phy_PORT_1.linkfailFileName = topo1.phy_N2_P1.linkfail

		Module Link : Node2_PORT_1
			Set Node2_PORT_1.guitag_remotenode = yes


		Bind Node2_MAC8023_PORT_1 Node2_Phy_PORT_1
		Bind Node2_Phy_PORT_1 Node2_PORT_1
	EndDefine

	Define port 2
		Module Interface : Node2_Interface_PORT_2

			Set Node2_OFSwitch_0.port2 = Node2_Interface_PORT_2
			Set Node2_OFSwitch_0.fixed_net2 = Node2_Interface_PORT_2.no
			Set Node2_Interface_PORT_2.recvtarget = Node2_OFSwitch_0

			Set Node2_Interface_PORT_2.ip = 1.0.1.3
			Set Node2_Interface_PORT_2.netmask = 255.255.255.0

		Module ARP : Node2_ARP_PORT_2
			Set Node2_ARP_PORT_2.arpMode = RunARP
			Set Node2_ARP_PORT_2.flushInterval = 3000
			Set Node2_ARP_PORT_2.ArpTableFileName = topo1.arp

		Module FIFO : Node2_FIFO_PORT_2
			Set Node2_FIFO_PORT_2.max_qlen = 50
			Set Node2_FIFO_PORT_2.log_qlen = off
			Set Node2_FIFO_PORT_2.log_option = FullLog
			Set Node2_FIFO_PORT_2.samplerate = 1
			Set Node2_FIFO_PORT_2.logFileName = topo1.fifo_N2_P2_qlen.log
			Set Node2_FIFO_PORT_2.log_drop = off
			Set Node2_FIFO_PORT_2.drop_samplerate = 1
			Set Node2_FIFO_PORT_2.droplogFileName = topo1.fifo_N2_P2_drop.log

		Module TCPDUMP : Node2_TCPDUMP_PORT_2

		Module MAC8023 : Node2_MAC8023_PORT_2
			Set Node2_MAC8023_PORT_2.mac = 0:1:0:0:0:4
			Set Node2_MAC8023_PORT_2.lock_mac = off
			Set Node2_MAC8023_PORT_2.PromisOpt = on
			Set Node2_MAC8023_PORT_2.mode = full
			Set Node2_MAC8023_PORT_2.log = off
			Set Node2_MAC8023_PORT_2.logInterval = 1
			Set Node2_MAC8023_PORT_2.NumCollision = off
			Set Node2_MAC8023_PORT_2.NumUniInPkt = off
			Set Node2_MAC8023_PORT_2.NumUniOutPkt = off
			Set Node2_MAC8023_PORT_2.NumUniInOutPkt = off
			Set Node2_MAC8023_PORT_2.NumBroInPkt = off
			Set Node2_MAC8023_PORT_2.NumBroOutPkt = off
			Set Node2_MAC8023_PORT_2.NumBroInOutPkt = off
			Set Node2_MAC8023_PORT_2.NumDrop = off
			Set Node2_MAC8023_PORT_2.InThrput = off
			Set Node2_MAC8023_PORT_2.OutThrput = off
			Set Node2_MAC8023_PORT_2.InOutThrput = off
			Set Node2_MAC8023_PORT_2.UniInLogFile = topo1.8023_N2_P2_UniIn.log
			Set Node2_MAC8023_PORT_2.UniOutLogFile = topo1.8023_N2_P2_UniOut.log
			Set Node2_MAC8023_PORT_2.UniInOutLogFile = topo1.8023_N2_P2_UniInOut.log
			Set Node2_MAC8023_PORT_2.BroInLogFile = topo1.8023_N2_P2_BroIn.log
			Set Node2_MAC8023_PORT_2.BroOutLogFile = topo1.8023_N2_P2_BroOut.log
			Set Node2_MAC8023_PORT_2.BroInOutLogFile = topo1.8023_N2_P2_BroInOut.log
			Set Node2_MAC8023_PORT_2.CollLogFile = topo1.8023_N2_P2_Coll.log
			Set Node2_MAC8023_PORT_2.DropLogFile = topo1.8023_N2_P2_Drop.log
			Set Node2_MAC8023_PORT_2.InThrputLogFile = topo1.8023_N2_P2_InThrput.log
			Set Node2_MAC8023_PORT_2.OutThrputLogFile = topo1.8023_N2_P2_OutThrput.log
			Set Node2_MAC8023_PORT_2.InOutThrputLogFile = topo1.8023_N2_P2_InOutThrput.log
			Set Node2_MAC8023_PORT_2.LinktoHub = 0

		Module Phy : Node2_Phy_PORT_2
			Set Node2_Phy_PORT_2.Bw = 10
			Set Node2_Phy_PORT_2.BER = 0.0
			Set Node2_Phy_PORT_2.PropDelay = 1
			Set Node2_Phy_PORT_2.linkfail = off
			Set Node2_Phy_PORT_2.linkfailFileName = topo1.phy_N2_P2.linkfail

		Module Link : Node2_PORT_2
			Set Node2_PORT_2.guitag_remotenode = yes


		Bind Node2_Interface_PORT_2 Node2_ARP_PORT_2
		Bind Node2_ARP_PORT_2 Node2_FIFO_PORT_2
		Bind Node2_FIFO_PORT_2 Node2_TCPDUMP_PORT_2
		Bind Node2_TCPDUMP_PORT_2 Node2_MAC8023_PORT_2
		Bind Node2_MAC8023_PORT_2 Node2_Phy_PORT_2
		Bind Node2_Phy_PORT_2 Node2_PORT_2
	EndDefine

EndCreate

Create Node 3 as OF_SW with name = OF_SW3
	Module OFSwitch : Node3_OFSwitch_0
		Set Node3_OFSwitch_0.guitag_addport = yes
		Set Node3_OFSwitch_0.guitag_addport = yes
		Set Node3_OFSwitch_0.guitag_addport = yes
		Set Node3_OFSwitch_0.flow_table_amount = 15
		Set Node3_OFSwitch_0.flow_table_entry_amount = 256
		Set Node3_OFSwitch_0.group_table_entry_amount = 256
		Set Node3_OFSwitch_0.table_miss_buffer_size = 1000
		Set Node3_OFSwitch_0.fifo_queue_size = 50
		Set Node3_OFSwitch_0.controller_ip = 1.0.1.1
	Define port 1
		Module Interface : Node3_Interface_PORT_1

			Set Node3_OFSwitch_0.port1 = Node3_Interface_PORT_1
			Set Node3_OFSwitch_0.fixed_net1 = Node3_Interface_PORT_1.no
			Set Node3_Interface_PORT_1.recvtarget = Node3_OFSwitch_0

			Set Node3_Interface_PORT_1.ip = 1.0.1.2
			Set Node3_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node3_ARP_PORT_1
			Set Node3_ARP_PORT_1.arpMode = RunARP
			Set Node3_ARP_PORT_1.flushInterval = 3000
			Set Node3_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node3_FIFO_PORT_1
			Set Node3_FIFO_PORT_1.max_qlen = 50
			Set Node3_FIFO_PORT_1.log_qlen = off
			Set Node3_FIFO_PORT_1.log_option = FullLog
			Set Node3_FIFO_PORT_1.samplerate = 1
			Set Node3_FIFO_PORT_1.logFileName = topo1.fifo_N3_P1_qlen.log
			Set Node3_FIFO_PORT_1.log_drop = off
			Set Node3_FIFO_PORT_1.drop_samplerate = 1
			Set Node3_FIFO_PORT_1.droplogFileName = topo1.fifo_N3_P1_drop.log

		Module TCPDUMP : Node3_TCPDUMP_PORT_1

		Module MAC8023 : Node3_MAC8023_PORT_1
			Set Node3_MAC8023_PORT_1.mac = 0:1:0:0:0:5
			Set Node3_MAC8023_PORT_1.lock_mac = off
			Set Node3_MAC8023_PORT_1.PromisOpt = on
			Set Node3_MAC8023_PORT_1.mode = full
			Set Node3_MAC8023_PORT_1.log = off
			Set Node3_MAC8023_PORT_1.logInterval = 1
			Set Node3_MAC8023_PORT_1.NumCollision = off
			Set Node3_MAC8023_PORT_1.NumUniInPkt = off
			Set Node3_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node3_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node3_MAC8023_PORT_1.NumBroInPkt = off
			Set Node3_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node3_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node3_MAC8023_PORT_1.NumDrop = off
			Set Node3_MAC8023_PORT_1.InThrput = off
			Set Node3_MAC8023_PORT_1.OutThrput = off
			Set Node3_MAC8023_PORT_1.InOutThrput = off
			Set Node3_MAC8023_PORT_1.UniInLogFile = topo1.8023_N3_P1_UniIn.log
			Set Node3_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N3_P1_UniOut.log
			Set Node3_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N3_P1_UniInOut.log
			Set Node3_MAC8023_PORT_1.BroInLogFile = topo1.8023_N3_P1_BroIn.log
			Set Node3_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N3_P1_BroOut.log
			Set Node3_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N3_P1_BroInOut.log
			Set Node3_MAC8023_PORT_1.CollLogFile = topo1.8023_N3_P1_Coll.log
			Set Node3_MAC8023_PORT_1.DropLogFile = topo1.8023_N3_P1_Drop.log
			Set Node3_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N3_P1_InThrput.log
			Set Node3_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N3_P1_OutThrput.log
			Set Node3_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N3_P1_InOutThrput.log
			Set Node3_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node3_Phy_PORT_1
			Set Node3_Phy_PORT_1.Bw = 10
			Set Node3_Phy_PORT_1.BER = 0.0
			Set Node3_Phy_PORT_1.PropDelay = 1
			Set Node3_Phy_PORT_1.linkfail = off
			Set Node3_Phy_PORT_1.linkfailFileName = topo1.phy_N3_P1.linkfail

		Module Link : Node3_PORT_1
			Set Node3_PORT_1.guitag_remotenode = yes


		Bind Node3_Interface_PORT_1 Node3_ARP_PORT_1
		Bind Node3_ARP_PORT_1 Node3_FIFO_PORT_1
		Bind Node3_FIFO_PORT_1 Node3_TCPDUMP_PORT_1
		Bind Node3_TCPDUMP_PORT_1 Node3_MAC8023_PORT_1
		Bind Node3_MAC8023_PORT_1 Node3_Phy_PORT_1
		Bind Node3_Phy_PORT_1 Node3_PORT_1
	EndDefine

	Define port 2
		Module MAC8023 : Node3_MAC8023_PORT_2

			Set Node3_OFSwitch_0.port2 = Node3_MAC8023_PORT_2
			Set Node3_OFSwitch_0.fixed_net2 = Node3_MAC8023_PORT_2.no
			Set Node3_MAC8023_PORT_2.recvtarget = Node3_OFSwitch_0

			Set Node3_MAC8023_PORT_2.mac = 0:1:0:0:0:6
			Set Node3_MAC8023_PORT_2.lock_mac = off
			Set Node3_MAC8023_PORT_2.PromisOpt = on
			Set Node3_MAC8023_PORT_2.mode = full
			Set Node3_MAC8023_PORT_2.log = off
			Set Node3_MAC8023_PORT_2.logInterval = 1
			Set Node3_MAC8023_PORT_2.NumCollision = off
			Set Node3_MAC8023_PORT_2.NumUniInPkt = off
			Set Node3_MAC8023_PORT_2.NumUniOutPkt = off
			Set Node3_MAC8023_PORT_2.NumUniInOutPkt = off
			Set Node3_MAC8023_PORT_2.NumBroInPkt = off
			Set Node3_MAC8023_PORT_2.NumBroOutPkt = off
			Set Node3_MAC8023_PORT_2.NumBroInOutPkt = off
			Set Node3_MAC8023_PORT_2.NumDrop = off
			Set Node3_MAC8023_PORT_2.InThrput = off
			Set Node3_MAC8023_PORT_2.OutThrput = off
			Set Node3_MAC8023_PORT_2.InOutThrput = off
			Set Node3_MAC8023_PORT_2.UniInLogFile = topo1.8023_N3_P2_UniIn.log
			Set Node3_MAC8023_PORT_2.UniOutLogFile = topo1.8023_N3_P2_UniOut.log
			Set Node3_MAC8023_PORT_2.UniInOutLogFile = topo1.8023_N3_P2_UniInOut.log
			Set Node3_MAC8023_PORT_2.BroInLogFile = topo1.8023_N3_P2_BroIn.log
			Set Node3_MAC8023_PORT_2.BroOutLogFile = topo1.8023_N3_P2_BroOut.log
			Set Node3_MAC8023_PORT_2.BroInOutLogFile = topo1.8023_N3_P2_BroInOut.log
			Set Node3_MAC8023_PORT_2.CollLogFile = topo1.8023_N3_P2_Coll.log
			Set Node3_MAC8023_PORT_2.DropLogFile = topo1.8023_N3_P2_Drop.log
			Set Node3_MAC8023_PORT_2.InThrputLogFile = topo1.8023_N3_P2_InThrput.log
			Set Node3_MAC8023_PORT_2.OutThrputLogFile = topo1.8023_N3_P2_OutThrput.log
			Set Node3_MAC8023_PORT_2.InOutThrputLogFile = topo1.8023_N3_P2_InOutThrput.log
			Set Node3_MAC8023_PORT_2.LinktoHub = 0

		Module Phy : Node3_Phy_PORT_2
			Set Node3_Phy_PORT_2.Bw = 10
			Set Node3_Phy_PORT_2.BER = 0.0
			Set Node3_Phy_PORT_2.PropDelay = 1
			Set Node3_Phy_PORT_2.linkfail = off
			Set Node3_Phy_PORT_2.linkfailFileName = topo1.phy_N3_P2.linkfail

		Module Link : Node3_PORT_2
			Set Node3_PORT_2.guitag_remotenode = yes


		Bind Node3_MAC8023_PORT_2 Node3_Phy_PORT_2
		Bind Node3_Phy_PORT_2 Node3_PORT_2
	EndDefine

EndCreate

Create Node 4 as OF_CTRL_SW with name = OF_CTRL_SW4
	Module Switch : Node4_Switch_0
		Set Node4_Switch_0.guitag_addport = yes
		Set Node4_Switch_0.SWITCH_MODE = KnowInAdvance
		Set Node4_Switch_0.flushInterval = 3000
		Set Node4_Switch_0.SpanningTreeProtocol = off
		Set Node4_Switch_0.HelloTime = 2
		Set Node4_Switch_0.MaxAge = 20
		Set Node4_Switch_0.ForwardDelay = 15
		Set Node4_Switch_0.SwitchTableFileName = topo1.sw_N4.smt
	Define port 1
		Module FIFO : Node4_FIFO_PORT_1

			Set Node4_Switch_0.port1 = Node4_FIFO_PORT_1
			Set Node4_Switch_0.fixed_net1 = Node4_FIFO_PORT_1.no
			Set Node4_FIFO_PORT_1.recvtarget = Node4_Switch_0

			Set Node4_FIFO_PORT_1.max_qlen = 50
			Set Node4_FIFO_PORT_1.log_qlen = off
			Set Node4_FIFO_PORT_1.log_option = FullLog
			Set Node4_FIFO_PORT_1.samplerate = 1
			Set Node4_FIFO_PORT_1.logFileName = topo1.fifo_N4_P1_qlen.log
			Set Node4_FIFO_PORT_1.log_drop = off
			Set Node4_FIFO_PORT_1.drop_samplerate = 1
			Set Node4_FIFO_PORT_1.droplogFileName = topo1.fifo_N4_P1_drop.log

		Module MAC8023 : Node4_MAC8023_PORT_1
			Set Node4_MAC8023_PORT_1.mac = 0:1:0:0:0:7
			Set Node4_MAC8023_PORT_1.lock_mac = off
			Set Node4_MAC8023_PORT_1.PromisOpt = on
			Set Node4_MAC8023_PORT_1.mode = full
			Set Node4_MAC8023_PORT_1.log = off
			Set Node4_MAC8023_PORT_1.logInterval = 1
			Set Node4_MAC8023_PORT_1.NumCollision = off
			Set Node4_MAC8023_PORT_1.NumUniInPkt = off
			Set Node4_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node4_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node4_MAC8023_PORT_1.NumBroInPkt = off
			Set Node4_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node4_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node4_MAC8023_PORT_1.NumDrop = off
			Set Node4_MAC8023_PORT_1.InThrput = off
			Set Node4_MAC8023_PORT_1.OutThrput = off
			Set Node4_MAC8023_PORT_1.InOutThrput = off
			Set Node4_MAC8023_PORT_1.UniInLogFile = topo1.8023_N4_P1_UniIn.log
			Set Node4_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N4_P1_UniOut.log
			Set Node4_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N4_P1_UniInOut.log
			Set Node4_MAC8023_PORT_1.BroInLogFile = topo1.8023_N4_P1_BroIn.log
			Set Node4_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N4_P1_BroOut.log
			Set Node4_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N4_P1_BroInOut.log
			Set Node4_MAC8023_PORT_1.CollLogFile = topo1.8023_N4_P1_Coll.log
			Set Node4_MAC8023_PORT_1.DropLogFile = topo1.8023_N4_P1_Drop.log
			Set Node4_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N4_P1_InThrput.log
			Set Node4_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N4_P1_OutThrput.log
			Set Node4_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N4_P1_InOutThrput.log
			Set Node4_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node4_Phy_PORT_1
			Set Node4_Phy_PORT_1.Bw = 10
			Set Node4_Phy_PORT_1.BER = 0.0
			Set Node4_Phy_PORT_1.PropDelay = 1
			Set Node4_Phy_PORT_1.linkfail = off
			Set Node4_Phy_PORT_1.linkfailFileName = topo1.phy_N4_P1.linkfail

		Module Link : Node4_PORT_1
			Set Node4_PORT_1.guitag_remotenode = yes


		Bind Node4_FIFO_PORT_1 Node4_MAC8023_PORT_1
		Bind Node4_MAC8023_PORT_1 Node4_Phy_PORT_1
		Bind Node4_Phy_PORT_1 Node4_PORT_1
	EndDefine

	Define port 2
		Module FIFO : Node4_FIFO_PORT_2

			Set Node4_Switch_0.port2 = Node4_FIFO_PORT_2
			Set Node4_Switch_0.fixed_net2 = Node4_FIFO_PORT_2.no
			Set Node4_FIFO_PORT_2.recvtarget = Node4_Switch_0

			Set Node4_FIFO_PORT_2.max_qlen = 50
			Set Node4_FIFO_PORT_2.log_qlen = off
			Set Node4_FIFO_PORT_2.log_option = FullLog
			Set Node4_FIFO_PORT_2.samplerate = 1
			Set Node4_FIFO_PORT_2.logFileName = topo1.fifo_N4_P2_qlen.log
			Set Node4_FIFO_PORT_2.log_drop = off
			Set Node4_FIFO_PORT_2.drop_samplerate = 1
			Set Node4_FIFO_PORT_2.droplogFileName = topo1.fifo_N4_P2_drop.log

		Module MAC8023 : Node4_MAC8023_PORT_2
			Set Node4_MAC8023_PORT_2.mac = 0:1:0:0:0:8
			Set Node4_MAC8023_PORT_2.lock_mac = off
			Set Node4_MAC8023_PORT_2.PromisOpt = on
			Set Node4_MAC8023_PORT_2.mode = full
			Set Node4_MAC8023_PORT_2.log = off
			Set Node4_MAC8023_PORT_2.logInterval = 1
			Set Node4_MAC8023_PORT_2.NumCollision = off
			Set Node4_MAC8023_PORT_2.NumUniInPkt = off
			Set Node4_MAC8023_PORT_2.NumUniOutPkt = off
			Set Node4_MAC8023_PORT_2.NumUniInOutPkt = off
			Set Node4_MAC8023_PORT_2.NumBroInPkt = off
			Set Node4_MAC8023_PORT_2.NumBroOutPkt = off
			Set Node4_MAC8023_PORT_2.NumBroInOutPkt = off
			Set Node4_MAC8023_PORT_2.NumDrop = off
			Set Node4_MAC8023_PORT_2.InThrput = off
			Set Node4_MAC8023_PORT_2.OutThrput = off
			Set Node4_MAC8023_PORT_2.InOutThrput = off
			Set Node4_MAC8023_PORT_2.UniInLogFile = topo1.8023_N4_P2_UniIn.log
			Set Node4_MAC8023_PORT_2.UniOutLogFile = topo1.8023_N4_P2_UniOut.log
			Set Node4_MAC8023_PORT_2.UniInOutLogFile = topo1.8023_N4_P2_UniInOut.log
			Set Node4_MAC8023_PORT_2.BroInLogFile = topo1.8023_N4_P2_BroIn.log
			Set Node4_MAC8023_PORT_2.BroOutLogFile = topo1.8023_N4_P2_BroOut.log
			Set Node4_MAC8023_PORT_2.BroInOutLogFile = topo1.8023_N4_P2_BroInOut.log
			Set Node4_MAC8023_PORT_2.CollLogFile = topo1.8023_N4_P2_Coll.log
			Set Node4_MAC8023_PORT_2.DropLogFile = topo1.8023_N4_P2_Drop.log
			Set Node4_MAC8023_PORT_2.InThrputLogFile = topo1.8023_N4_P2_InThrput.log
			Set Node4_MAC8023_PORT_2.OutThrputLogFile = topo1.8023_N4_P2_OutThrput.log
			Set Node4_MAC8023_PORT_2.InOutThrputLogFile = topo1.8023_N4_P2_InOutThrput.log
			Set Node4_MAC8023_PORT_2.LinktoHub = 0

		Module Phy : Node4_Phy_PORT_2
			Set Node4_Phy_PORT_2.Bw = 10
			Set Node4_Phy_PORT_2.BER = 0.0
			Set Node4_Phy_PORT_2.PropDelay = 1
			Set Node4_Phy_PORT_2.linkfail = off
			Set Node4_Phy_PORT_2.linkfailFileName = topo1.phy_N4_P2.linkfail

		Module Link : Node4_PORT_2
			Set Node4_PORT_2.guitag_remotenode = yes


		Bind Node4_FIFO_PORT_2 Node4_MAC8023_PORT_2
		Bind Node4_MAC8023_PORT_2 Node4_Phy_PORT_2
		Bind Node4_Phy_PORT_2 Node4_PORT_2
	EndDefine

	Define port 3
		Module FIFO : Node4_FIFO_PORT_3

			Set Node4_Switch_0.port3 = Node4_FIFO_PORT_3
			Set Node4_Switch_0.fixed_net3 = Node4_FIFO_PORT_3.no
			Set Node4_FIFO_PORT_3.recvtarget = Node4_Switch_0

			Set Node4_FIFO_PORT_3.max_qlen = 50
			Set Node4_FIFO_PORT_3.log_qlen = off
			Set Node4_FIFO_PORT_3.log_option = FullLog
			Set Node4_FIFO_PORT_3.samplerate = 1
			Set Node4_FIFO_PORT_3.logFileName = topo1.fifo_N4_P3_qlen.log
			Set Node4_FIFO_PORT_3.log_drop = off
			Set Node4_FIFO_PORT_3.drop_samplerate = 1
			Set Node4_FIFO_PORT_3.droplogFileName = topo1.fifo_N4_P3_drop.log

		Module MAC8023 : Node4_MAC8023_PORT_3
			Set Node4_MAC8023_PORT_3.mac = 0:1:0:0:0:9
			Set Node4_MAC8023_PORT_3.lock_mac = off
			Set Node4_MAC8023_PORT_3.PromisOpt = on
			Set Node4_MAC8023_PORT_3.mode = full
			Set Node4_MAC8023_PORT_3.log = off
			Set Node4_MAC8023_PORT_3.logInterval = 1
			Set Node4_MAC8023_PORT_3.NumCollision = off
			Set Node4_MAC8023_PORT_3.NumUniInPkt = off
			Set Node4_MAC8023_PORT_3.NumUniOutPkt = off
			Set Node4_MAC8023_PORT_3.NumUniInOutPkt = off
			Set Node4_MAC8023_PORT_3.NumBroInPkt = off
			Set Node4_MAC8023_PORT_3.NumBroOutPkt = off
			Set Node4_MAC8023_PORT_3.NumBroInOutPkt = off
			Set Node4_MAC8023_PORT_3.NumDrop = off
			Set Node4_MAC8023_PORT_3.InThrput = off
			Set Node4_MAC8023_PORT_3.OutThrput = off
			Set Node4_MAC8023_PORT_3.InOutThrput = off
			Set Node4_MAC8023_PORT_3.UniInLogFile = topo1.8023_N4_P3_UniIn.log
			Set Node4_MAC8023_PORT_3.UniOutLogFile = topo1.8023_N4_P3_UniOut.log
			Set Node4_MAC8023_PORT_3.UniInOutLogFile = topo1.8023_N4_P3_UniInOut.log
			Set Node4_MAC8023_PORT_3.BroInLogFile = topo1.8023_N4_P3_BroIn.log
			Set Node4_MAC8023_PORT_3.BroOutLogFile = topo1.8023_N4_P3_BroOut.log
			Set Node4_MAC8023_PORT_3.BroInOutLogFile = topo1.8023_N4_P3_BroInOut.log
			Set Node4_MAC8023_PORT_3.CollLogFile = topo1.8023_N4_P3_Coll.log
			Set Node4_MAC8023_PORT_3.DropLogFile = topo1.8023_N4_P3_Drop.log
			Set Node4_MAC8023_PORT_3.InThrputLogFile = topo1.8023_N4_P3_InThrput.log
			Set Node4_MAC8023_PORT_3.OutThrputLogFile = topo1.8023_N4_P3_OutThrput.log
			Set Node4_MAC8023_PORT_3.InOutThrputLogFile = topo1.8023_N4_P3_InOutThrput.log
			Set Node4_MAC8023_PORT_3.LinktoHub = 0

		Module Phy : Node4_Phy_PORT_3
			Set Node4_Phy_PORT_3.Bw = 10
			Set Node4_Phy_PORT_3.BER = 0.0
			Set Node4_Phy_PORT_3.PropDelay = 1
			Set Node4_Phy_PORT_3.linkfail = off
			Set Node4_Phy_PORT_3.linkfailFileName = topo1.phy_N4_P3.linkfail

		Module Link : Node4_PORT_3
			Set Node4_PORT_3.guitag_remotenode = yes


		Bind Node4_FIFO_PORT_3 Node4_MAC8023_PORT_3
		Bind Node4_MAC8023_PORT_3 Node4_Phy_PORT_3
		Bind Node4_Phy_PORT_3 Node4_PORT_3
	EndDefine

EndCreate

Connect WIRE 1.Node1_PORT_1 4.Node4_PORT_2


Connect WIRE 2.Node2_PORT_1 3.Node3_PORT_2


Connect WIRE 2.Node2_PORT_2 4.Node4_PORT_3


Connect WIRE 3.Node3_PORT_1 4.Node4_PORT_1




Run 30
