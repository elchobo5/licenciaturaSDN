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

	Define port 3
		Module MAC8023 : Node2_MAC8023_PORT_3

			Set Node2_OFSwitch_0.port3 = Node2_MAC8023_PORT_3
			Set Node2_OFSwitch_0.fixed_net3 = Node2_MAC8023_PORT_3.no
			Set Node2_MAC8023_PORT_3.recvtarget = Node2_OFSwitch_0

			Set Node2_MAC8023_PORT_3.mac = 0:1:0:0:0:5
			Set Node2_MAC8023_PORT_3.lock_mac = off
			Set Node2_MAC8023_PORT_3.PromisOpt = on
			Set Node2_MAC8023_PORT_3.mode = full
			Set Node2_MAC8023_PORT_3.log = off
			Set Node2_MAC8023_PORT_3.logInterval = 1
			Set Node2_MAC8023_PORT_3.NumCollision = off
			Set Node2_MAC8023_PORT_3.NumUniInPkt = off
			Set Node2_MAC8023_PORT_3.NumUniOutPkt = off
			Set Node2_MAC8023_PORT_3.NumUniInOutPkt = off
			Set Node2_MAC8023_PORT_3.NumBroInPkt = off
			Set Node2_MAC8023_PORT_3.NumBroOutPkt = off
			Set Node2_MAC8023_PORT_3.NumBroInOutPkt = off
			Set Node2_MAC8023_PORT_3.NumDrop = off
			Set Node2_MAC8023_PORT_3.InThrput = off
			Set Node2_MAC8023_PORT_3.OutThrput = off
			Set Node2_MAC8023_PORT_3.InOutThrput = off
			Set Node2_MAC8023_PORT_3.UniInLogFile = topo1.8023_N2_P3_UniIn.log
			Set Node2_MAC8023_PORT_3.UniOutLogFile = topo1.8023_N2_P3_UniOut.log
			Set Node2_MAC8023_PORT_3.UniInOutLogFile = topo1.8023_N2_P3_UniInOut.log
			Set Node2_MAC8023_PORT_3.BroInLogFile = topo1.8023_N2_P3_BroIn.log
			Set Node2_MAC8023_PORT_3.BroOutLogFile = topo1.8023_N2_P3_BroOut.log
			Set Node2_MAC8023_PORT_3.BroInOutLogFile = topo1.8023_N2_P3_BroInOut.log
			Set Node2_MAC8023_PORT_3.CollLogFile = topo1.8023_N2_P3_Coll.log
			Set Node2_MAC8023_PORT_3.DropLogFile = topo1.8023_N2_P3_Drop.log
			Set Node2_MAC8023_PORT_3.InThrputLogFile = topo1.8023_N2_P3_InThrput.log
			Set Node2_MAC8023_PORT_3.OutThrputLogFile = topo1.8023_N2_P3_OutThrput.log
			Set Node2_MAC8023_PORT_3.InOutThrputLogFile = topo1.8023_N2_P3_InOutThrput.log
			Set Node2_MAC8023_PORT_3.LinktoHub = 0

		Module Phy : Node2_Phy_PORT_3
			Set Node2_Phy_PORT_3.Bw = 10
			Set Node2_Phy_PORT_3.BER = 0.0
			Set Node2_Phy_PORT_3.PropDelay = 1
			Set Node2_Phy_PORT_3.linkfail = off
			Set Node2_Phy_PORT_3.linkfailFileName = topo1.phy_N2_P3.linkfail

		Module Link : Node2_PORT_3
			Set Node2_PORT_3.guitag_remotenode = yes


		Bind Node2_MAC8023_PORT_3 Node2_Phy_PORT_3
		Bind Node2_Phy_PORT_3 Node2_PORT_3
	EndDefine

	Define port 4
		Module MAC8023 : Node2_MAC8023_PORT_4

			Set Node2_OFSwitch_0.port4 = Node2_MAC8023_PORT_4
			Set Node2_OFSwitch_0.fixed_net4 = Node2_MAC8023_PORT_4.no
			Set Node2_MAC8023_PORT_4.recvtarget = Node2_OFSwitch_0

			Set Node2_MAC8023_PORT_4.mac = 0:1:0:0:0:6
			Set Node2_MAC8023_PORT_4.lock_mac = off
			Set Node2_MAC8023_PORT_4.PromisOpt = on
			Set Node2_MAC8023_PORT_4.mode = full
			Set Node2_MAC8023_PORT_4.log = off
			Set Node2_MAC8023_PORT_4.logInterval = 1
			Set Node2_MAC8023_PORT_4.NumCollision = off
			Set Node2_MAC8023_PORT_4.NumUniInPkt = off
			Set Node2_MAC8023_PORT_4.NumUniOutPkt = off
			Set Node2_MAC8023_PORT_4.NumUniInOutPkt = off
			Set Node2_MAC8023_PORT_4.NumBroInPkt = off
			Set Node2_MAC8023_PORT_4.NumBroOutPkt = off
			Set Node2_MAC8023_PORT_4.NumBroInOutPkt = off
			Set Node2_MAC8023_PORT_4.NumDrop = off
			Set Node2_MAC8023_PORT_4.InThrput = off
			Set Node2_MAC8023_PORT_4.OutThrput = off
			Set Node2_MAC8023_PORT_4.InOutThrput = off
			Set Node2_MAC8023_PORT_4.UniInLogFile = topo1.8023_N2_P4_UniIn.log
			Set Node2_MAC8023_PORT_4.UniOutLogFile = topo1.8023_N2_P4_UniOut.log
			Set Node2_MAC8023_PORT_4.UniInOutLogFile = topo1.8023_N2_P4_UniInOut.log
			Set Node2_MAC8023_PORT_4.BroInLogFile = topo1.8023_N2_P4_BroIn.log
			Set Node2_MAC8023_PORT_4.BroOutLogFile = topo1.8023_N2_P4_BroOut.log
			Set Node2_MAC8023_PORT_4.BroInOutLogFile = topo1.8023_N2_P4_BroInOut.log
			Set Node2_MAC8023_PORT_4.CollLogFile = topo1.8023_N2_P4_Coll.log
			Set Node2_MAC8023_PORT_4.DropLogFile = topo1.8023_N2_P4_Drop.log
			Set Node2_MAC8023_PORT_4.InThrputLogFile = topo1.8023_N2_P4_InThrput.log
			Set Node2_MAC8023_PORT_4.OutThrputLogFile = topo1.8023_N2_P4_OutThrput.log
			Set Node2_MAC8023_PORT_4.InOutThrputLogFile = topo1.8023_N2_P4_InOutThrput.log
			Set Node2_MAC8023_PORT_4.LinktoHub = 0

		Module Phy : Node2_Phy_PORT_4
			Set Node2_Phy_PORT_4.Bw = 10
			Set Node2_Phy_PORT_4.BER = 0.0
			Set Node2_Phy_PORT_4.PropDelay = 1
			Set Node2_Phy_PORT_4.linkfail = off
			Set Node2_Phy_PORT_4.linkfailFileName = topo1.phy_N2_P4.linkfail

		Module Link : Node2_PORT_4
			Set Node2_PORT_4.guitag_remotenode = yes


		Bind Node2_MAC8023_PORT_4 Node2_Phy_PORT_4
		Bind Node2_Phy_PORT_4 Node2_PORT_4
	EndDefine

	Define port 5
		Module MAC8023 : Node2_MAC8023_PORT_5

			Set Node2_OFSwitch_0.port5 = Node2_MAC8023_PORT_5
			Set Node2_OFSwitch_0.fixed_net5 = Node2_MAC8023_PORT_5.no
			Set Node2_MAC8023_PORT_5.recvtarget = Node2_OFSwitch_0

			Set Node2_MAC8023_PORT_5.mac = 0:1:0:0:0:7
			Set Node2_MAC8023_PORT_5.lock_mac = off
			Set Node2_MAC8023_PORT_5.PromisOpt = on
			Set Node2_MAC8023_PORT_5.mode = full
			Set Node2_MAC8023_PORT_5.log = off
			Set Node2_MAC8023_PORT_5.logInterval = 1
			Set Node2_MAC8023_PORT_5.NumCollision = off
			Set Node2_MAC8023_PORT_5.NumUniInPkt = off
			Set Node2_MAC8023_PORT_5.NumUniOutPkt = off
			Set Node2_MAC8023_PORT_5.NumUniInOutPkt = off
			Set Node2_MAC8023_PORT_5.NumBroInPkt = off
			Set Node2_MAC8023_PORT_5.NumBroOutPkt = off
			Set Node2_MAC8023_PORT_5.NumBroInOutPkt = off
			Set Node2_MAC8023_PORT_5.NumDrop = off
			Set Node2_MAC8023_PORT_5.InThrput = off
			Set Node2_MAC8023_PORT_5.OutThrput = off
			Set Node2_MAC8023_PORT_5.InOutThrput = off
			Set Node2_MAC8023_PORT_5.UniInLogFile = topo1.8023_N2_P5_UniIn.log
			Set Node2_MAC8023_PORT_5.UniOutLogFile = topo1.8023_N2_P5_UniOut.log
			Set Node2_MAC8023_PORT_5.UniInOutLogFile = topo1.8023_N2_P5_UniInOut.log
			Set Node2_MAC8023_PORT_5.BroInLogFile = topo1.8023_N2_P5_BroIn.log
			Set Node2_MAC8023_PORT_5.BroOutLogFile = topo1.8023_N2_P5_BroOut.log
			Set Node2_MAC8023_PORT_5.BroInOutLogFile = topo1.8023_N2_P5_BroInOut.log
			Set Node2_MAC8023_PORT_5.CollLogFile = topo1.8023_N2_P5_Coll.log
			Set Node2_MAC8023_PORT_5.DropLogFile = topo1.8023_N2_P5_Drop.log
			Set Node2_MAC8023_PORT_5.InThrputLogFile = topo1.8023_N2_P5_InThrput.log
			Set Node2_MAC8023_PORT_5.OutThrputLogFile = topo1.8023_N2_P5_OutThrput.log
			Set Node2_MAC8023_PORT_5.InOutThrputLogFile = topo1.8023_N2_P5_InOutThrput.log
			Set Node2_MAC8023_PORT_5.LinktoHub = 0

		Module Phy : Node2_Phy_PORT_5
			Set Node2_Phy_PORT_5.Bw = 10
			Set Node2_Phy_PORT_5.BER = 0.0
			Set Node2_Phy_PORT_5.PropDelay = 1
			Set Node2_Phy_PORT_5.linkfail = off
			Set Node2_Phy_PORT_5.linkfailFileName = topo1.phy_N2_P5.linkfail

		Module Link : Node2_PORT_5
			Set Node2_PORT_5.guitag_remotenode = yes


		Bind Node2_MAC8023_PORT_5 Node2_Phy_PORT_5
		Bind Node2_Phy_PORT_5 Node2_PORT_5
	EndDefine

	Define port 6
		Module MAC8023 : Node2_MAC8023_PORT_6

			Set Node2_OFSwitch_0.port6 = Node2_MAC8023_PORT_6
			Set Node2_OFSwitch_0.fixed_net6 = Node2_MAC8023_PORT_6.no
			Set Node2_MAC8023_PORT_6.recvtarget = Node2_OFSwitch_0

			Set Node2_MAC8023_PORT_6.mac = 0:1:0:0:0:8
			Set Node2_MAC8023_PORT_6.lock_mac = off
			Set Node2_MAC8023_PORT_6.PromisOpt = on
			Set Node2_MAC8023_PORT_6.mode = full
			Set Node2_MAC8023_PORT_6.log = off
			Set Node2_MAC8023_PORT_6.logInterval = 1
			Set Node2_MAC8023_PORT_6.NumCollision = off
			Set Node2_MAC8023_PORT_6.NumUniInPkt = off
			Set Node2_MAC8023_PORT_6.NumUniOutPkt = off
			Set Node2_MAC8023_PORT_6.NumUniInOutPkt = off
			Set Node2_MAC8023_PORT_6.NumBroInPkt = off
			Set Node2_MAC8023_PORT_6.NumBroOutPkt = off
			Set Node2_MAC8023_PORT_6.NumBroInOutPkt = off
			Set Node2_MAC8023_PORT_6.NumDrop = off
			Set Node2_MAC8023_PORT_6.InThrput = off
			Set Node2_MAC8023_PORT_6.OutThrput = off
			Set Node2_MAC8023_PORT_6.InOutThrput = off
			Set Node2_MAC8023_PORT_6.UniInLogFile = topo1.8023_N2_P6_UniIn.log
			Set Node2_MAC8023_PORT_6.UniOutLogFile = topo1.8023_N2_P6_UniOut.log
			Set Node2_MAC8023_PORT_6.UniInOutLogFile = topo1.8023_N2_P6_UniInOut.log
			Set Node2_MAC8023_PORT_6.BroInLogFile = topo1.8023_N2_P6_BroIn.log
			Set Node2_MAC8023_PORT_6.BroOutLogFile = topo1.8023_N2_P6_BroOut.log
			Set Node2_MAC8023_PORT_6.BroInOutLogFile = topo1.8023_N2_P6_BroInOut.log
			Set Node2_MAC8023_PORT_6.CollLogFile = topo1.8023_N2_P6_Coll.log
			Set Node2_MAC8023_PORT_6.DropLogFile = topo1.8023_N2_P6_Drop.log
			Set Node2_MAC8023_PORT_6.InThrputLogFile = topo1.8023_N2_P6_InThrput.log
			Set Node2_MAC8023_PORT_6.OutThrputLogFile = topo1.8023_N2_P6_OutThrput.log
			Set Node2_MAC8023_PORT_6.InOutThrputLogFile = topo1.8023_N2_P6_InOutThrput.log
			Set Node2_MAC8023_PORT_6.LinktoHub = 0

		Module Phy : Node2_Phy_PORT_6
			Set Node2_Phy_PORT_6.Bw = 10
			Set Node2_Phy_PORT_6.BER = 0.0
			Set Node2_Phy_PORT_6.PropDelay = 1
			Set Node2_Phy_PORT_6.linkfail = off
			Set Node2_Phy_PORT_6.linkfailFileName = topo1.phy_N2_P6.linkfail

		Module Link : Node2_PORT_6
			Set Node2_PORT_6.guitag_remotenode = yes


		Bind Node2_MAC8023_PORT_6 Node2_Phy_PORT_6
		Bind Node2_Phy_PORT_6 Node2_PORT_6
	EndDefine

	Define port 7
		Module MAC8023 : Node2_MAC8023_PORT_7

			Set Node2_OFSwitch_0.port7 = Node2_MAC8023_PORT_7
			Set Node2_OFSwitch_0.fixed_net7 = Node2_MAC8023_PORT_7.no
			Set Node2_MAC8023_PORT_7.recvtarget = Node2_OFSwitch_0

			Set Node2_MAC8023_PORT_7.mac = 0:1:0:0:0:9
			Set Node2_MAC8023_PORT_7.lock_mac = off
			Set Node2_MAC8023_PORT_7.PromisOpt = on
			Set Node2_MAC8023_PORT_7.mode = full
			Set Node2_MAC8023_PORT_7.log = off
			Set Node2_MAC8023_PORT_7.logInterval = 1
			Set Node2_MAC8023_PORT_7.NumCollision = off
			Set Node2_MAC8023_PORT_7.NumUniInPkt = off
			Set Node2_MAC8023_PORT_7.NumUniOutPkt = off
			Set Node2_MAC8023_PORT_7.NumUniInOutPkt = off
			Set Node2_MAC8023_PORT_7.NumBroInPkt = off
			Set Node2_MAC8023_PORT_7.NumBroOutPkt = off
			Set Node2_MAC8023_PORT_7.NumBroInOutPkt = off
			Set Node2_MAC8023_PORT_7.NumDrop = off
			Set Node2_MAC8023_PORT_7.InThrput = off
			Set Node2_MAC8023_PORT_7.OutThrput = off
			Set Node2_MAC8023_PORT_7.InOutThrput = off
			Set Node2_MAC8023_PORT_7.UniInLogFile = topo1.8023_N2_P7_UniIn.log
			Set Node2_MAC8023_PORT_7.UniOutLogFile = topo1.8023_N2_P7_UniOut.log
			Set Node2_MAC8023_PORT_7.UniInOutLogFile = topo1.8023_N2_P7_UniInOut.log
			Set Node2_MAC8023_PORT_7.BroInLogFile = topo1.8023_N2_P7_BroIn.log
			Set Node2_MAC8023_PORT_7.BroOutLogFile = topo1.8023_N2_P7_BroOut.log
			Set Node2_MAC8023_PORT_7.BroInOutLogFile = topo1.8023_N2_P7_BroInOut.log
			Set Node2_MAC8023_PORT_7.CollLogFile = topo1.8023_N2_P7_Coll.log
			Set Node2_MAC8023_PORT_7.DropLogFile = topo1.8023_N2_P7_Drop.log
			Set Node2_MAC8023_PORT_7.InThrputLogFile = topo1.8023_N2_P7_InThrput.log
			Set Node2_MAC8023_PORT_7.OutThrputLogFile = topo1.8023_N2_P7_OutThrput.log
			Set Node2_MAC8023_PORT_7.InOutThrputLogFile = topo1.8023_N2_P7_InOutThrput.log
			Set Node2_MAC8023_PORT_7.LinktoHub = 0

		Module Phy : Node2_Phy_PORT_7
			Set Node2_Phy_PORT_7.Bw = 10
			Set Node2_Phy_PORT_7.BER = 0.0
			Set Node2_Phy_PORT_7.PropDelay = 1
			Set Node2_Phy_PORT_7.linkfail = off
			Set Node2_Phy_PORT_7.linkfailFileName = topo1.phy_N2_P7.linkfail

		Module Link : Node2_PORT_7
			Set Node2_PORT_7.guitag_remotenode = yes


		Bind Node2_MAC8023_PORT_7 Node2_Phy_PORT_7
		Bind Node2_Phy_PORT_7 Node2_PORT_7
	EndDefine

	Define port 8
		Module MAC8023 : Node2_MAC8023_PORT_8

			Set Node2_OFSwitch_0.port8 = Node2_MAC8023_PORT_8
			Set Node2_OFSwitch_0.fixed_net8 = Node2_MAC8023_PORT_8.no
			Set Node2_MAC8023_PORT_8.recvtarget = Node2_OFSwitch_0

			Set Node2_MAC8023_PORT_8.mac = 0:1:0:0:0:a
			Set Node2_MAC8023_PORT_8.lock_mac = off
			Set Node2_MAC8023_PORT_8.PromisOpt = on
			Set Node2_MAC8023_PORT_8.mode = full
			Set Node2_MAC8023_PORT_8.log = off
			Set Node2_MAC8023_PORT_8.logInterval = 1
			Set Node2_MAC8023_PORT_8.NumCollision = off
			Set Node2_MAC8023_PORT_8.NumUniInPkt = off
			Set Node2_MAC8023_PORT_8.NumUniOutPkt = off
			Set Node2_MAC8023_PORT_8.NumUniInOutPkt = off
			Set Node2_MAC8023_PORT_8.NumBroInPkt = off
			Set Node2_MAC8023_PORT_8.NumBroOutPkt = off
			Set Node2_MAC8023_PORT_8.NumBroInOutPkt = off
			Set Node2_MAC8023_PORT_8.NumDrop = off
			Set Node2_MAC8023_PORT_8.InThrput = off
			Set Node2_MAC8023_PORT_8.OutThrput = off
			Set Node2_MAC8023_PORT_8.InOutThrput = off
			Set Node2_MAC8023_PORT_8.UniInLogFile = topo1.8023_N2_P8_UniIn.log
			Set Node2_MAC8023_PORT_8.UniOutLogFile = topo1.8023_N2_P8_UniOut.log
			Set Node2_MAC8023_PORT_8.UniInOutLogFile = topo1.8023_N2_P8_UniInOut.log
			Set Node2_MAC8023_PORT_8.BroInLogFile = topo1.8023_N2_P8_BroIn.log
			Set Node2_MAC8023_PORT_8.BroOutLogFile = topo1.8023_N2_P8_BroOut.log
			Set Node2_MAC8023_PORT_8.BroInOutLogFile = topo1.8023_N2_P8_BroInOut.log
			Set Node2_MAC8023_PORT_8.CollLogFile = topo1.8023_N2_P8_Coll.log
			Set Node2_MAC8023_PORT_8.DropLogFile = topo1.8023_N2_P8_Drop.log
			Set Node2_MAC8023_PORT_8.InThrputLogFile = topo1.8023_N2_P8_InThrput.log
			Set Node2_MAC8023_PORT_8.OutThrputLogFile = topo1.8023_N2_P8_OutThrput.log
			Set Node2_MAC8023_PORT_8.InOutThrputLogFile = topo1.8023_N2_P8_InOutThrput.log
			Set Node2_MAC8023_PORT_8.LinktoHub = 0

		Module Phy : Node2_Phy_PORT_8
			Set Node2_Phy_PORT_8.Bw = 10
			Set Node2_Phy_PORT_8.BER = 0.0
			Set Node2_Phy_PORT_8.PropDelay = 1
			Set Node2_Phy_PORT_8.linkfail = off
			Set Node2_Phy_PORT_8.linkfailFileName = topo1.phy_N2_P8.linkfail

		Module Link : Node2_PORT_8
			Set Node2_PORT_8.guitag_remotenode = yes


		Bind Node2_MAC8023_PORT_8 Node2_Phy_PORT_8
		Bind Node2_Phy_PORT_8 Node2_PORT_8
	EndDefine

	Define port 9
		Module MAC8023 : Node2_MAC8023_PORT_9

			Set Node2_OFSwitch_0.port9 = Node2_MAC8023_PORT_9
			Set Node2_OFSwitch_0.fixed_net9 = Node2_MAC8023_PORT_9.no
			Set Node2_MAC8023_PORT_9.recvtarget = Node2_OFSwitch_0

			Set Node2_MAC8023_PORT_9.mac = 0:1:0:0:0:b
			Set Node2_MAC8023_PORT_9.lock_mac = off
			Set Node2_MAC8023_PORT_9.PromisOpt = on
			Set Node2_MAC8023_PORT_9.mode = full
			Set Node2_MAC8023_PORT_9.log = off
			Set Node2_MAC8023_PORT_9.logInterval = 1
			Set Node2_MAC8023_PORT_9.NumCollision = off
			Set Node2_MAC8023_PORT_9.NumUniInPkt = off
			Set Node2_MAC8023_PORT_9.NumUniOutPkt = off
			Set Node2_MAC8023_PORT_9.NumUniInOutPkt = off
			Set Node2_MAC8023_PORT_9.NumBroInPkt = off
			Set Node2_MAC8023_PORT_9.NumBroOutPkt = off
			Set Node2_MAC8023_PORT_9.NumBroInOutPkt = off
			Set Node2_MAC8023_PORT_9.NumDrop = off
			Set Node2_MAC8023_PORT_9.InThrput = off
			Set Node2_MAC8023_PORT_9.OutThrput = off
			Set Node2_MAC8023_PORT_9.InOutThrput = off
			Set Node2_MAC8023_PORT_9.UniInLogFile = topo1.8023_N2_P9_UniIn.log
			Set Node2_MAC8023_PORT_9.UniOutLogFile = topo1.8023_N2_P9_UniOut.log
			Set Node2_MAC8023_PORT_9.UniInOutLogFile = topo1.8023_N2_P9_UniInOut.log
			Set Node2_MAC8023_PORT_9.BroInLogFile = topo1.8023_N2_P9_BroIn.log
			Set Node2_MAC8023_PORT_9.BroOutLogFile = topo1.8023_N2_P9_BroOut.log
			Set Node2_MAC8023_PORT_9.BroInOutLogFile = topo1.8023_N2_P9_BroInOut.log
			Set Node2_MAC8023_PORT_9.CollLogFile = topo1.8023_N2_P9_Coll.log
			Set Node2_MAC8023_PORT_9.DropLogFile = topo1.8023_N2_P9_Drop.log
			Set Node2_MAC8023_PORT_9.InThrputLogFile = topo1.8023_N2_P9_InThrput.log
			Set Node2_MAC8023_PORT_9.OutThrputLogFile = topo1.8023_N2_P9_OutThrput.log
			Set Node2_MAC8023_PORT_9.InOutThrputLogFile = topo1.8023_N2_P9_InOutThrput.log
			Set Node2_MAC8023_PORT_9.LinktoHub = 0

		Module Phy : Node2_Phy_PORT_9
			Set Node2_Phy_PORT_9.Bw = 10
			Set Node2_Phy_PORT_9.BER = 0.0
			Set Node2_Phy_PORT_9.PropDelay = 1
			Set Node2_Phy_PORT_9.linkfail = off
			Set Node2_Phy_PORT_9.linkfailFileName = topo1.phy_N2_P9.linkfail

		Module Link : Node2_PORT_9
			Set Node2_PORT_9.guitag_remotenode = yes


		Bind Node2_MAC8023_PORT_9 Node2_Phy_PORT_9
		Bind Node2_Phy_PORT_9 Node2_PORT_9
	EndDefine

	Define port 10
		Module MAC8023 : Node2_MAC8023_PORT_10

			Set Node2_OFSwitch_0.port10 = Node2_MAC8023_PORT_10
			Set Node2_OFSwitch_0.fixed_net10 = Node2_MAC8023_PORT_10.no
			Set Node2_MAC8023_PORT_10.recvtarget = Node2_OFSwitch_0

			Set Node2_MAC8023_PORT_10.mac = 0:1:0:0:0:c
			Set Node2_MAC8023_PORT_10.lock_mac = off
			Set Node2_MAC8023_PORT_10.PromisOpt = on
			Set Node2_MAC8023_PORT_10.mode = full
			Set Node2_MAC8023_PORT_10.log = off
			Set Node2_MAC8023_PORT_10.logInterval = 1
			Set Node2_MAC8023_PORT_10.NumCollision = off
			Set Node2_MAC8023_PORT_10.NumUniInPkt = off
			Set Node2_MAC8023_PORT_10.NumUniOutPkt = off
			Set Node2_MAC8023_PORT_10.NumUniInOutPkt = off
			Set Node2_MAC8023_PORT_10.NumBroInPkt = off
			Set Node2_MAC8023_PORT_10.NumBroOutPkt = off
			Set Node2_MAC8023_PORT_10.NumBroInOutPkt = off
			Set Node2_MAC8023_PORT_10.NumDrop = off
			Set Node2_MAC8023_PORT_10.InThrput = off
			Set Node2_MAC8023_PORT_10.OutThrput = off
			Set Node2_MAC8023_PORT_10.InOutThrput = off
			Set Node2_MAC8023_PORT_10.UniInLogFile = topo1.8023_N2_P10_UniIn.log
			Set Node2_MAC8023_PORT_10.UniOutLogFile = topo1.8023_N2_P10_UniOut.log
			Set Node2_MAC8023_PORT_10.UniInOutLogFile = topo1.8023_N2_P10_UniInOut.log
			Set Node2_MAC8023_PORT_10.BroInLogFile = topo1.8023_N2_P10_BroIn.log
			Set Node2_MAC8023_PORT_10.BroOutLogFile = topo1.8023_N2_P10_BroOut.log
			Set Node2_MAC8023_PORT_10.BroInOutLogFile = topo1.8023_N2_P10_BroInOut.log
			Set Node2_MAC8023_PORT_10.CollLogFile = topo1.8023_N2_P10_Coll.log
			Set Node2_MAC8023_PORT_10.DropLogFile = topo1.8023_N2_P10_Drop.log
			Set Node2_MAC8023_PORT_10.InThrputLogFile = topo1.8023_N2_P10_InThrput.log
			Set Node2_MAC8023_PORT_10.OutThrputLogFile = topo1.8023_N2_P10_OutThrput.log
			Set Node2_MAC8023_PORT_10.InOutThrputLogFile = topo1.8023_N2_P10_InOutThrput.log
			Set Node2_MAC8023_PORT_10.LinktoHub = 0

		Module Phy : Node2_Phy_PORT_10
			Set Node2_Phy_PORT_10.Bw = 10
			Set Node2_Phy_PORT_10.BER = 0.0
			Set Node2_Phy_PORT_10.PropDelay = 1
			Set Node2_Phy_PORT_10.linkfail = off
			Set Node2_Phy_PORT_10.linkfailFileName = topo1.phy_N2_P10.linkfail

		Module Link : Node2_PORT_10
			Set Node2_PORT_10.guitag_remotenode = yes


		Bind Node2_MAC8023_PORT_10 Node2_Phy_PORT_10
		Bind Node2_Phy_PORT_10 Node2_PORT_10
	EndDefine

	Define port 11
		Module MAC8023 : Node2_MAC8023_PORT_11

			Set Node2_OFSwitch_0.port11 = Node2_MAC8023_PORT_11
			Set Node2_OFSwitch_0.fixed_net11 = Node2_MAC8023_PORT_11.no
			Set Node2_MAC8023_PORT_11.recvtarget = Node2_OFSwitch_0

			Set Node2_MAC8023_PORT_11.mac = 0:1:0:0:0:d
			Set Node2_MAC8023_PORT_11.lock_mac = off
			Set Node2_MAC8023_PORT_11.PromisOpt = on
			Set Node2_MAC8023_PORT_11.mode = full
			Set Node2_MAC8023_PORT_11.log = off
			Set Node2_MAC8023_PORT_11.logInterval = 1
			Set Node2_MAC8023_PORT_11.NumCollision = off
			Set Node2_MAC8023_PORT_11.NumUniInPkt = off
			Set Node2_MAC8023_PORT_11.NumUniOutPkt = off
			Set Node2_MAC8023_PORT_11.NumUniInOutPkt = off
			Set Node2_MAC8023_PORT_11.NumBroInPkt = off
			Set Node2_MAC8023_PORT_11.NumBroOutPkt = off
			Set Node2_MAC8023_PORT_11.NumBroInOutPkt = off
			Set Node2_MAC8023_PORT_11.NumDrop = off
			Set Node2_MAC8023_PORT_11.InThrput = off
			Set Node2_MAC8023_PORT_11.OutThrput = off
			Set Node2_MAC8023_PORT_11.InOutThrput = off
			Set Node2_MAC8023_PORT_11.UniInLogFile = topo1.8023_N2_P11_UniIn.log
			Set Node2_MAC8023_PORT_11.UniOutLogFile = topo1.8023_N2_P11_UniOut.log
			Set Node2_MAC8023_PORT_11.UniInOutLogFile = topo1.8023_N2_P11_UniInOut.log
			Set Node2_MAC8023_PORT_11.BroInLogFile = topo1.8023_N2_P11_BroIn.log
			Set Node2_MAC8023_PORT_11.BroOutLogFile = topo1.8023_N2_P11_BroOut.log
			Set Node2_MAC8023_PORT_11.BroInOutLogFile = topo1.8023_N2_P11_BroInOut.log
			Set Node2_MAC8023_PORT_11.CollLogFile = topo1.8023_N2_P11_Coll.log
			Set Node2_MAC8023_PORT_11.DropLogFile = topo1.8023_N2_P11_Drop.log
			Set Node2_MAC8023_PORT_11.InThrputLogFile = topo1.8023_N2_P11_InThrput.log
			Set Node2_MAC8023_PORT_11.OutThrputLogFile = topo1.8023_N2_P11_OutThrput.log
			Set Node2_MAC8023_PORT_11.InOutThrputLogFile = topo1.8023_N2_P11_InOutThrput.log
			Set Node2_MAC8023_PORT_11.LinktoHub = 0

		Module Phy : Node2_Phy_PORT_11
			Set Node2_Phy_PORT_11.Bw = 10
			Set Node2_Phy_PORT_11.BER = 0.0
			Set Node2_Phy_PORT_11.PropDelay = 1
			Set Node2_Phy_PORT_11.linkfail = off
			Set Node2_Phy_PORT_11.linkfailFileName = topo1.phy_N2_P11.linkfail

		Module Link : Node2_PORT_11
			Set Node2_PORT_11.guitag_remotenode = yes


		Bind Node2_MAC8023_PORT_11 Node2_Phy_PORT_11
		Bind Node2_Phy_PORT_11 Node2_PORT_11
	EndDefine

	Define port 12
		Module MAC8023 : Node2_MAC8023_PORT_12

			Set Node2_OFSwitch_0.port12 = Node2_MAC8023_PORT_12
			Set Node2_OFSwitch_0.fixed_net12 = Node2_MAC8023_PORT_12.no
			Set Node2_MAC8023_PORT_12.recvtarget = Node2_OFSwitch_0

			Set Node2_MAC8023_PORT_12.mac = 0:1:0:0:0:e
			Set Node2_MAC8023_PORT_12.lock_mac = off
			Set Node2_MAC8023_PORT_12.PromisOpt = on
			Set Node2_MAC8023_PORT_12.mode = full
			Set Node2_MAC8023_PORT_12.log = off
			Set Node2_MAC8023_PORT_12.logInterval = 1
			Set Node2_MAC8023_PORT_12.NumCollision = off
			Set Node2_MAC8023_PORT_12.NumUniInPkt = off
			Set Node2_MAC8023_PORT_12.NumUniOutPkt = off
			Set Node2_MAC8023_PORT_12.NumUniInOutPkt = off
			Set Node2_MAC8023_PORT_12.NumBroInPkt = off
			Set Node2_MAC8023_PORT_12.NumBroOutPkt = off
			Set Node2_MAC8023_PORT_12.NumBroInOutPkt = off
			Set Node2_MAC8023_PORT_12.NumDrop = off
			Set Node2_MAC8023_PORT_12.InThrput = off
			Set Node2_MAC8023_PORT_12.OutThrput = off
			Set Node2_MAC8023_PORT_12.InOutThrput = off
			Set Node2_MAC8023_PORT_12.UniInLogFile = topo1.8023_N2_P12_UniIn.log
			Set Node2_MAC8023_PORT_12.UniOutLogFile = topo1.8023_N2_P12_UniOut.log
			Set Node2_MAC8023_PORT_12.UniInOutLogFile = topo1.8023_N2_P12_UniInOut.log
			Set Node2_MAC8023_PORT_12.BroInLogFile = topo1.8023_N2_P12_BroIn.log
			Set Node2_MAC8023_PORT_12.BroOutLogFile = topo1.8023_N2_P12_BroOut.log
			Set Node2_MAC8023_PORT_12.BroInOutLogFile = topo1.8023_N2_P12_BroInOut.log
			Set Node2_MAC8023_PORT_12.CollLogFile = topo1.8023_N2_P12_Coll.log
			Set Node2_MAC8023_PORT_12.DropLogFile = topo1.8023_N2_P12_Drop.log
			Set Node2_MAC8023_PORT_12.InThrputLogFile = topo1.8023_N2_P12_InThrput.log
			Set Node2_MAC8023_PORT_12.OutThrputLogFile = topo1.8023_N2_P12_OutThrput.log
			Set Node2_MAC8023_PORT_12.InOutThrputLogFile = topo1.8023_N2_P12_InOutThrput.log
			Set Node2_MAC8023_PORT_12.LinktoHub = 0

		Module Phy : Node2_Phy_PORT_12
			Set Node2_Phy_PORT_12.Bw = 10
			Set Node2_Phy_PORT_12.BER = 0.0
			Set Node2_Phy_PORT_12.PropDelay = 1
			Set Node2_Phy_PORT_12.linkfail = off
			Set Node2_Phy_PORT_12.linkfailFileName = topo1.phy_N2_P12.linkfail

		Module Link : Node2_PORT_12
			Set Node2_PORT_12.guitag_remotenode = yes


		Bind Node2_MAC8023_PORT_12 Node2_Phy_PORT_12
		Bind Node2_Phy_PORT_12 Node2_PORT_12
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
			Set Node3_MAC8023_PORT_1.mac = 0:1:0:0:0:f
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

			Set Node3_MAC8023_PORT_2.mac = 0:1:0:0:0:10
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

	Define port 3
		Module MAC8023 : Node3_MAC8023_PORT_3

			Set Node3_OFSwitch_0.port3 = Node3_MAC8023_PORT_3
			Set Node3_OFSwitch_0.fixed_net3 = Node3_MAC8023_PORT_3.no
			Set Node3_MAC8023_PORT_3.recvtarget = Node3_OFSwitch_0

			Set Node3_MAC8023_PORT_3.mac = 0:1:0:0:0:11
			Set Node3_MAC8023_PORT_3.lock_mac = off
			Set Node3_MAC8023_PORT_3.PromisOpt = on
			Set Node3_MAC8023_PORT_3.mode = full
			Set Node3_MAC8023_PORT_3.log = off
			Set Node3_MAC8023_PORT_3.logInterval = 1
			Set Node3_MAC8023_PORT_3.NumCollision = off
			Set Node3_MAC8023_PORT_3.NumUniInPkt = off
			Set Node3_MAC8023_PORT_3.NumUniOutPkt = off
			Set Node3_MAC8023_PORT_3.NumUniInOutPkt = off
			Set Node3_MAC8023_PORT_3.NumBroInPkt = off
			Set Node3_MAC8023_PORT_3.NumBroOutPkt = off
			Set Node3_MAC8023_PORT_3.NumBroInOutPkt = off
			Set Node3_MAC8023_PORT_3.NumDrop = off
			Set Node3_MAC8023_PORT_3.InThrput = off
			Set Node3_MAC8023_PORT_3.OutThrput = off
			Set Node3_MAC8023_PORT_3.InOutThrput = off
			Set Node3_MAC8023_PORT_3.UniInLogFile = topo1.8023_N3_P3_UniIn.log
			Set Node3_MAC8023_PORT_3.UniOutLogFile = topo1.8023_N3_P3_UniOut.log
			Set Node3_MAC8023_PORT_3.UniInOutLogFile = topo1.8023_N3_P3_UniInOut.log
			Set Node3_MAC8023_PORT_3.BroInLogFile = topo1.8023_N3_P3_BroIn.log
			Set Node3_MAC8023_PORT_3.BroOutLogFile = topo1.8023_N3_P3_BroOut.log
			Set Node3_MAC8023_PORT_3.BroInOutLogFile = topo1.8023_N3_P3_BroInOut.log
			Set Node3_MAC8023_PORT_3.CollLogFile = topo1.8023_N3_P3_Coll.log
			Set Node3_MAC8023_PORT_3.DropLogFile = topo1.8023_N3_P3_Drop.log
			Set Node3_MAC8023_PORT_3.InThrputLogFile = topo1.8023_N3_P3_InThrput.log
			Set Node3_MAC8023_PORT_3.OutThrputLogFile = topo1.8023_N3_P3_OutThrput.log
			Set Node3_MAC8023_PORT_3.InOutThrputLogFile = topo1.8023_N3_P3_InOutThrput.log
			Set Node3_MAC8023_PORT_3.LinktoHub = 0

		Module Phy : Node3_Phy_PORT_3
			Set Node3_Phy_PORT_3.Bw = 10
			Set Node3_Phy_PORT_3.BER = 0.0
			Set Node3_Phy_PORT_3.PropDelay = 1
			Set Node3_Phy_PORT_3.linkfail = off
			Set Node3_Phy_PORT_3.linkfailFileName = topo1.phy_N3_P3.linkfail

		Module Link : Node3_PORT_3
			Set Node3_PORT_3.guitag_remotenode = yes


		Bind Node3_MAC8023_PORT_3 Node3_Phy_PORT_3
		Bind Node3_Phy_PORT_3 Node3_PORT_3
	EndDefine

	Define port 4
		Module MAC8023 : Node3_MAC8023_PORT_4

			Set Node3_OFSwitch_0.port4 = Node3_MAC8023_PORT_4
			Set Node3_OFSwitch_0.fixed_net4 = Node3_MAC8023_PORT_4.no
			Set Node3_MAC8023_PORT_4.recvtarget = Node3_OFSwitch_0

			Set Node3_MAC8023_PORT_4.mac = 0:1:0:0:0:12
			Set Node3_MAC8023_PORT_4.lock_mac = off
			Set Node3_MAC8023_PORT_4.PromisOpt = on
			Set Node3_MAC8023_PORT_4.mode = full
			Set Node3_MAC8023_PORT_4.log = off
			Set Node3_MAC8023_PORT_4.logInterval = 1
			Set Node3_MAC8023_PORT_4.NumCollision = off
			Set Node3_MAC8023_PORT_4.NumUniInPkt = off
			Set Node3_MAC8023_PORT_4.NumUniOutPkt = off
			Set Node3_MAC8023_PORT_4.NumUniInOutPkt = off
			Set Node3_MAC8023_PORT_4.NumBroInPkt = off
			Set Node3_MAC8023_PORT_4.NumBroOutPkt = off
			Set Node3_MAC8023_PORT_4.NumBroInOutPkt = off
			Set Node3_MAC8023_PORT_4.NumDrop = off
			Set Node3_MAC8023_PORT_4.InThrput = off
			Set Node3_MAC8023_PORT_4.OutThrput = off
			Set Node3_MAC8023_PORT_4.InOutThrput = off
			Set Node3_MAC8023_PORT_4.UniInLogFile = topo1.8023_N3_P4_UniIn.log
			Set Node3_MAC8023_PORT_4.UniOutLogFile = topo1.8023_N3_P4_UniOut.log
			Set Node3_MAC8023_PORT_4.UniInOutLogFile = topo1.8023_N3_P4_UniInOut.log
			Set Node3_MAC8023_PORT_4.BroInLogFile = topo1.8023_N3_P4_BroIn.log
			Set Node3_MAC8023_PORT_4.BroOutLogFile = topo1.8023_N3_P4_BroOut.log
			Set Node3_MAC8023_PORT_4.BroInOutLogFile = topo1.8023_N3_P4_BroInOut.log
			Set Node3_MAC8023_PORT_4.CollLogFile = topo1.8023_N3_P4_Coll.log
			Set Node3_MAC8023_PORT_4.DropLogFile = topo1.8023_N3_P4_Drop.log
			Set Node3_MAC8023_PORT_4.InThrputLogFile = topo1.8023_N3_P4_InThrput.log
			Set Node3_MAC8023_PORT_4.OutThrputLogFile = topo1.8023_N3_P4_OutThrput.log
			Set Node3_MAC8023_PORT_4.InOutThrputLogFile = topo1.8023_N3_P4_InOutThrput.log
			Set Node3_MAC8023_PORT_4.LinktoHub = 0

		Module Phy : Node3_Phy_PORT_4
			Set Node3_Phy_PORT_4.Bw = 10
			Set Node3_Phy_PORT_4.BER = 0.0
			Set Node3_Phy_PORT_4.PropDelay = 1
			Set Node3_Phy_PORT_4.linkfail = off
			Set Node3_Phy_PORT_4.linkfailFileName = topo1.phy_N3_P4.linkfail

		Module Link : Node3_PORT_4
			Set Node3_PORT_4.guitag_remotenode = yes


		Bind Node3_MAC8023_PORT_4 Node3_Phy_PORT_4
		Bind Node3_Phy_PORT_4 Node3_PORT_4
	EndDefine

	Define port 5
		Module MAC8023 : Node3_MAC8023_PORT_5

			Set Node3_OFSwitch_0.port5 = Node3_MAC8023_PORT_5
			Set Node3_OFSwitch_0.fixed_net5 = Node3_MAC8023_PORT_5.no
			Set Node3_MAC8023_PORT_5.recvtarget = Node3_OFSwitch_0

			Set Node3_MAC8023_PORT_5.mac = 0:1:0:0:0:13
			Set Node3_MAC8023_PORT_5.lock_mac = off
			Set Node3_MAC8023_PORT_5.PromisOpt = on
			Set Node3_MAC8023_PORT_5.mode = full
			Set Node3_MAC8023_PORT_5.log = off
			Set Node3_MAC8023_PORT_5.logInterval = 1
			Set Node3_MAC8023_PORT_5.NumCollision = off
			Set Node3_MAC8023_PORT_5.NumUniInPkt = off
			Set Node3_MAC8023_PORT_5.NumUniOutPkt = off
			Set Node3_MAC8023_PORT_5.NumUniInOutPkt = off
			Set Node3_MAC8023_PORT_5.NumBroInPkt = off
			Set Node3_MAC8023_PORT_5.NumBroOutPkt = off
			Set Node3_MAC8023_PORT_5.NumBroInOutPkt = off
			Set Node3_MAC8023_PORT_5.NumDrop = off
			Set Node3_MAC8023_PORT_5.InThrput = off
			Set Node3_MAC8023_PORT_5.OutThrput = off
			Set Node3_MAC8023_PORT_5.InOutThrput = off
			Set Node3_MAC8023_PORT_5.UniInLogFile = topo1.8023_N3_P5_UniIn.log
			Set Node3_MAC8023_PORT_5.UniOutLogFile = topo1.8023_N3_P5_UniOut.log
			Set Node3_MAC8023_PORT_5.UniInOutLogFile = topo1.8023_N3_P5_UniInOut.log
			Set Node3_MAC8023_PORT_5.BroInLogFile = topo1.8023_N3_P5_BroIn.log
			Set Node3_MAC8023_PORT_5.BroOutLogFile = topo1.8023_N3_P5_BroOut.log
			Set Node3_MAC8023_PORT_5.BroInOutLogFile = topo1.8023_N3_P5_BroInOut.log
			Set Node3_MAC8023_PORT_5.CollLogFile = topo1.8023_N3_P5_Coll.log
			Set Node3_MAC8023_PORT_5.DropLogFile = topo1.8023_N3_P5_Drop.log
			Set Node3_MAC8023_PORT_5.InThrputLogFile = topo1.8023_N3_P5_InThrput.log
			Set Node3_MAC8023_PORT_5.OutThrputLogFile = topo1.8023_N3_P5_OutThrput.log
			Set Node3_MAC8023_PORT_5.InOutThrputLogFile = topo1.8023_N3_P5_InOutThrput.log
			Set Node3_MAC8023_PORT_5.LinktoHub = 0

		Module Phy : Node3_Phy_PORT_5
			Set Node3_Phy_PORT_5.Bw = 10
			Set Node3_Phy_PORT_5.BER = 0.0
			Set Node3_Phy_PORT_5.PropDelay = 1
			Set Node3_Phy_PORT_5.linkfail = off
			Set Node3_Phy_PORT_5.linkfailFileName = topo1.phy_N3_P5.linkfail

		Module Link : Node3_PORT_5
			Set Node3_PORT_5.guitag_remotenode = yes


		Bind Node3_MAC8023_PORT_5 Node3_Phy_PORT_5
		Bind Node3_Phy_PORT_5 Node3_PORT_5
	EndDefine

	Define port 6
		Module MAC8023 : Node3_MAC8023_PORT_6

			Set Node3_OFSwitch_0.port6 = Node3_MAC8023_PORT_6
			Set Node3_OFSwitch_0.fixed_net6 = Node3_MAC8023_PORT_6.no
			Set Node3_MAC8023_PORT_6.recvtarget = Node3_OFSwitch_0

			Set Node3_MAC8023_PORT_6.mac = 0:1:0:0:0:14
			Set Node3_MAC8023_PORT_6.lock_mac = off
			Set Node3_MAC8023_PORT_6.PromisOpt = on
			Set Node3_MAC8023_PORT_6.mode = full
			Set Node3_MAC8023_PORT_6.log = off
			Set Node3_MAC8023_PORT_6.logInterval = 1
			Set Node3_MAC8023_PORT_6.NumCollision = off
			Set Node3_MAC8023_PORT_6.NumUniInPkt = off
			Set Node3_MAC8023_PORT_6.NumUniOutPkt = off
			Set Node3_MAC8023_PORT_6.NumUniInOutPkt = off
			Set Node3_MAC8023_PORT_6.NumBroInPkt = off
			Set Node3_MAC8023_PORT_6.NumBroOutPkt = off
			Set Node3_MAC8023_PORT_6.NumBroInOutPkt = off
			Set Node3_MAC8023_PORT_6.NumDrop = off
			Set Node3_MAC8023_PORT_6.InThrput = off
			Set Node3_MAC8023_PORT_6.OutThrput = off
			Set Node3_MAC8023_PORT_6.InOutThrput = off
			Set Node3_MAC8023_PORT_6.UniInLogFile = topo1.8023_N3_P6_UniIn.log
			Set Node3_MAC8023_PORT_6.UniOutLogFile = topo1.8023_N3_P6_UniOut.log
			Set Node3_MAC8023_PORT_6.UniInOutLogFile = topo1.8023_N3_P6_UniInOut.log
			Set Node3_MAC8023_PORT_6.BroInLogFile = topo1.8023_N3_P6_BroIn.log
			Set Node3_MAC8023_PORT_6.BroOutLogFile = topo1.8023_N3_P6_BroOut.log
			Set Node3_MAC8023_PORT_6.BroInOutLogFile = topo1.8023_N3_P6_BroInOut.log
			Set Node3_MAC8023_PORT_6.CollLogFile = topo1.8023_N3_P6_Coll.log
			Set Node3_MAC8023_PORT_6.DropLogFile = topo1.8023_N3_P6_Drop.log
			Set Node3_MAC8023_PORT_6.InThrputLogFile = topo1.8023_N3_P6_InThrput.log
			Set Node3_MAC8023_PORT_6.OutThrputLogFile = topo1.8023_N3_P6_OutThrput.log
			Set Node3_MAC8023_PORT_6.InOutThrputLogFile = topo1.8023_N3_P6_InOutThrput.log
			Set Node3_MAC8023_PORT_6.LinktoHub = 0

		Module Phy : Node3_Phy_PORT_6
			Set Node3_Phy_PORT_6.Bw = 10
			Set Node3_Phy_PORT_6.BER = 0.0
			Set Node3_Phy_PORT_6.PropDelay = 1
			Set Node3_Phy_PORT_6.linkfail = off
			Set Node3_Phy_PORT_6.linkfailFileName = topo1.phy_N3_P6.linkfail

		Module Link : Node3_PORT_6
			Set Node3_PORT_6.guitag_remotenode = yes


		Bind Node3_MAC8023_PORT_6 Node3_Phy_PORT_6
		Bind Node3_Phy_PORT_6 Node3_PORT_6
	EndDefine

	Define port 7
		Module MAC8023 : Node3_MAC8023_PORT_7

			Set Node3_OFSwitch_0.port7 = Node3_MAC8023_PORT_7
			Set Node3_OFSwitch_0.fixed_net7 = Node3_MAC8023_PORT_7.no
			Set Node3_MAC8023_PORT_7.recvtarget = Node3_OFSwitch_0

			Set Node3_MAC8023_PORT_7.mac = 0:1:0:0:0:15
			Set Node3_MAC8023_PORT_7.lock_mac = off
			Set Node3_MAC8023_PORT_7.PromisOpt = on
			Set Node3_MAC8023_PORT_7.mode = full
			Set Node3_MAC8023_PORT_7.log = off
			Set Node3_MAC8023_PORT_7.logInterval = 1
			Set Node3_MAC8023_PORT_7.NumCollision = off
			Set Node3_MAC8023_PORT_7.NumUniInPkt = off
			Set Node3_MAC8023_PORT_7.NumUniOutPkt = off
			Set Node3_MAC8023_PORT_7.NumUniInOutPkt = off
			Set Node3_MAC8023_PORT_7.NumBroInPkt = off
			Set Node3_MAC8023_PORT_7.NumBroOutPkt = off
			Set Node3_MAC8023_PORT_7.NumBroInOutPkt = off
			Set Node3_MAC8023_PORT_7.NumDrop = off
			Set Node3_MAC8023_PORT_7.InThrput = off
			Set Node3_MAC8023_PORT_7.OutThrput = off
			Set Node3_MAC8023_PORT_7.InOutThrput = off
			Set Node3_MAC8023_PORT_7.UniInLogFile = topo1.8023_N3_P7_UniIn.log
			Set Node3_MAC8023_PORT_7.UniOutLogFile = topo1.8023_N3_P7_UniOut.log
			Set Node3_MAC8023_PORT_7.UniInOutLogFile = topo1.8023_N3_P7_UniInOut.log
			Set Node3_MAC8023_PORT_7.BroInLogFile = topo1.8023_N3_P7_BroIn.log
			Set Node3_MAC8023_PORT_7.BroOutLogFile = topo1.8023_N3_P7_BroOut.log
			Set Node3_MAC8023_PORT_7.BroInOutLogFile = topo1.8023_N3_P7_BroInOut.log
			Set Node3_MAC8023_PORT_7.CollLogFile = topo1.8023_N3_P7_Coll.log
			Set Node3_MAC8023_PORT_7.DropLogFile = topo1.8023_N3_P7_Drop.log
			Set Node3_MAC8023_PORT_7.InThrputLogFile = topo1.8023_N3_P7_InThrput.log
			Set Node3_MAC8023_PORT_7.OutThrputLogFile = topo1.8023_N3_P7_OutThrput.log
			Set Node3_MAC8023_PORT_7.InOutThrputLogFile = topo1.8023_N3_P7_InOutThrput.log
			Set Node3_MAC8023_PORT_7.LinktoHub = 0

		Module Phy : Node3_Phy_PORT_7
			Set Node3_Phy_PORT_7.Bw = 10
			Set Node3_Phy_PORT_7.BER = 0.0
			Set Node3_Phy_PORT_7.PropDelay = 1
			Set Node3_Phy_PORT_7.linkfail = off
			Set Node3_Phy_PORT_7.linkfailFileName = topo1.phy_N3_P7.linkfail

		Module Link : Node3_PORT_7
			Set Node3_PORT_7.guitag_remotenode = yes


		Bind Node3_MAC8023_PORT_7 Node3_Phy_PORT_7
		Bind Node3_Phy_PORT_7 Node3_PORT_7
	EndDefine

	Define port 8
		Module MAC8023 : Node3_MAC8023_PORT_8

			Set Node3_OFSwitch_0.port8 = Node3_MAC8023_PORT_8
			Set Node3_OFSwitch_0.fixed_net8 = Node3_MAC8023_PORT_8.no
			Set Node3_MAC8023_PORT_8.recvtarget = Node3_OFSwitch_0

			Set Node3_MAC8023_PORT_8.mac = 0:1:0:0:0:16
			Set Node3_MAC8023_PORT_8.lock_mac = off
			Set Node3_MAC8023_PORT_8.PromisOpt = on
			Set Node3_MAC8023_PORT_8.mode = full
			Set Node3_MAC8023_PORT_8.log = off
			Set Node3_MAC8023_PORT_8.logInterval = 1
			Set Node3_MAC8023_PORT_8.NumCollision = off
			Set Node3_MAC8023_PORT_8.NumUniInPkt = off
			Set Node3_MAC8023_PORT_8.NumUniOutPkt = off
			Set Node3_MAC8023_PORT_8.NumUniInOutPkt = off
			Set Node3_MAC8023_PORT_8.NumBroInPkt = off
			Set Node3_MAC8023_PORT_8.NumBroOutPkt = off
			Set Node3_MAC8023_PORT_8.NumBroInOutPkt = off
			Set Node3_MAC8023_PORT_8.NumDrop = off
			Set Node3_MAC8023_PORT_8.InThrput = off
			Set Node3_MAC8023_PORT_8.OutThrput = off
			Set Node3_MAC8023_PORT_8.InOutThrput = off
			Set Node3_MAC8023_PORT_8.UniInLogFile = topo1.8023_N3_P8_UniIn.log
			Set Node3_MAC8023_PORT_8.UniOutLogFile = topo1.8023_N3_P8_UniOut.log
			Set Node3_MAC8023_PORT_8.UniInOutLogFile = topo1.8023_N3_P8_UniInOut.log
			Set Node3_MAC8023_PORT_8.BroInLogFile = topo1.8023_N3_P8_BroIn.log
			Set Node3_MAC8023_PORT_8.BroOutLogFile = topo1.8023_N3_P8_BroOut.log
			Set Node3_MAC8023_PORT_8.BroInOutLogFile = topo1.8023_N3_P8_BroInOut.log
			Set Node3_MAC8023_PORT_8.CollLogFile = topo1.8023_N3_P8_Coll.log
			Set Node3_MAC8023_PORT_8.DropLogFile = topo1.8023_N3_P8_Drop.log
			Set Node3_MAC8023_PORT_8.InThrputLogFile = topo1.8023_N3_P8_InThrput.log
			Set Node3_MAC8023_PORT_8.OutThrputLogFile = topo1.8023_N3_P8_OutThrput.log
			Set Node3_MAC8023_PORT_8.InOutThrputLogFile = topo1.8023_N3_P8_InOutThrput.log
			Set Node3_MAC8023_PORT_8.LinktoHub = 0

		Module Phy : Node3_Phy_PORT_8
			Set Node3_Phy_PORT_8.Bw = 10
			Set Node3_Phy_PORT_8.BER = 0.0
			Set Node3_Phy_PORT_8.PropDelay = 1
			Set Node3_Phy_PORT_8.linkfail = off
			Set Node3_Phy_PORT_8.linkfailFileName = topo1.phy_N3_P8.linkfail

		Module Link : Node3_PORT_8
			Set Node3_PORT_8.guitag_remotenode = yes


		Bind Node3_MAC8023_PORT_8 Node3_Phy_PORT_8
		Bind Node3_Phy_PORT_8 Node3_PORT_8
	EndDefine

	Define port 9
		Module MAC8023 : Node3_MAC8023_PORT_9

			Set Node3_OFSwitch_0.port9 = Node3_MAC8023_PORT_9
			Set Node3_OFSwitch_0.fixed_net9 = Node3_MAC8023_PORT_9.no
			Set Node3_MAC8023_PORT_9.recvtarget = Node3_OFSwitch_0

			Set Node3_MAC8023_PORT_9.mac = 0:1:0:0:0:17
			Set Node3_MAC8023_PORT_9.lock_mac = off
			Set Node3_MAC8023_PORT_9.PromisOpt = on
			Set Node3_MAC8023_PORT_9.mode = full
			Set Node3_MAC8023_PORT_9.log = off
			Set Node3_MAC8023_PORT_9.logInterval = 1
			Set Node3_MAC8023_PORT_9.NumCollision = off
			Set Node3_MAC8023_PORT_9.NumUniInPkt = off
			Set Node3_MAC8023_PORT_9.NumUniOutPkt = off
			Set Node3_MAC8023_PORT_9.NumUniInOutPkt = off
			Set Node3_MAC8023_PORT_9.NumBroInPkt = off
			Set Node3_MAC8023_PORT_9.NumBroOutPkt = off
			Set Node3_MAC8023_PORT_9.NumBroInOutPkt = off
			Set Node3_MAC8023_PORT_9.NumDrop = off
			Set Node3_MAC8023_PORT_9.InThrput = off
			Set Node3_MAC8023_PORT_9.OutThrput = off
			Set Node3_MAC8023_PORT_9.InOutThrput = off
			Set Node3_MAC8023_PORT_9.UniInLogFile = topo1.8023_N3_P9_UniIn.log
			Set Node3_MAC8023_PORT_9.UniOutLogFile = topo1.8023_N3_P9_UniOut.log
			Set Node3_MAC8023_PORT_9.UniInOutLogFile = topo1.8023_N3_P9_UniInOut.log
			Set Node3_MAC8023_PORT_9.BroInLogFile = topo1.8023_N3_P9_BroIn.log
			Set Node3_MAC8023_PORT_9.BroOutLogFile = topo1.8023_N3_P9_BroOut.log
			Set Node3_MAC8023_PORT_9.BroInOutLogFile = topo1.8023_N3_P9_BroInOut.log
			Set Node3_MAC8023_PORT_9.CollLogFile = topo1.8023_N3_P9_Coll.log
			Set Node3_MAC8023_PORT_9.DropLogFile = topo1.8023_N3_P9_Drop.log
			Set Node3_MAC8023_PORT_9.InThrputLogFile = topo1.8023_N3_P9_InThrput.log
			Set Node3_MAC8023_PORT_9.OutThrputLogFile = topo1.8023_N3_P9_OutThrput.log
			Set Node3_MAC8023_PORT_9.InOutThrputLogFile = topo1.8023_N3_P9_InOutThrput.log
			Set Node3_MAC8023_PORT_9.LinktoHub = 0

		Module Phy : Node3_Phy_PORT_9
			Set Node3_Phy_PORT_9.Bw = 10
			Set Node3_Phy_PORT_9.BER = 0.0
			Set Node3_Phy_PORT_9.PropDelay = 1
			Set Node3_Phy_PORT_9.linkfail = off
			Set Node3_Phy_PORT_9.linkfailFileName = topo1.phy_N3_P9.linkfail

		Module Link : Node3_PORT_9
			Set Node3_PORT_9.guitag_remotenode = yes


		Bind Node3_MAC8023_PORT_9 Node3_Phy_PORT_9
		Bind Node3_Phy_PORT_9 Node3_PORT_9
	EndDefine

	Define port 10
		Module MAC8023 : Node3_MAC8023_PORT_10

			Set Node3_OFSwitch_0.port10 = Node3_MAC8023_PORT_10
			Set Node3_OFSwitch_0.fixed_net10 = Node3_MAC8023_PORT_10.no
			Set Node3_MAC8023_PORT_10.recvtarget = Node3_OFSwitch_0

			Set Node3_MAC8023_PORT_10.mac = 0:1:0:0:0:18
			Set Node3_MAC8023_PORT_10.lock_mac = off
			Set Node3_MAC8023_PORT_10.PromisOpt = on
			Set Node3_MAC8023_PORT_10.mode = full
			Set Node3_MAC8023_PORT_10.log = off
			Set Node3_MAC8023_PORT_10.logInterval = 1
			Set Node3_MAC8023_PORT_10.NumCollision = off
			Set Node3_MAC8023_PORT_10.NumUniInPkt = off
			Set Node3_MAC8023_PORT_10.NumUniOutPkt = off
			Set Node3_MAC8023_PORT_10.NumUniInOutPkt = off
			Set Node3_MAC8023_PORT_10.NumBroInPkt = off
			Set Node3_MAC8023_PORT_10.NumBroOutPkt = off
			Set Node3_MAC8023_PORT_10.NumBroInOutPkt = off
			Set Node3_MAC8023_PORT_10.NumDrop = off
			Set Node3_MAC8023_PORT_10.InThrput = off
			Set Node3_MAC8023_PORT_10.OutThrput = off
			Set Node3_MAC8023_PORT_10.InOutThrput = off
			Set Node3_MAC8023_PORT_10.UniInLogFile = topo1.8023_N3_P10_UniIn.log
			Set Node3_MAC8023_PORT_10.UniOutLogFile = topo1.8023_N3_P10_UniOut.log
			Set Node3_MAC8023_PORT_10.UniInOutLogFile = topo1.8023_N3_P10_UniInOut.log
			Set Node3_MAC8023_PORT_10.BroInLogFile = topo1.8023_N3_P10_BroIn.log
			Set Node3_MAC8023_PORT_10.BroOutLogFile = topo1.8023_N3_P10_BroOut.log
			Set Node3_MAC8023_PORT_10.BroInOutLogFile = topo1.8023_N3_P10_BroInOut.log
			Set Node3_MAC8023_PORT_10.CollLogFile = topo1.8023_N3_P10_Coll.log
			Set Node3_MAC8023_PORT_10.DropLogFile = topo1.8023_N3_P10_Drop.log
			Set Node3_MAC8023_PORT_10.InThrputLogFile = topo1.8023_N3_P10_InThrput.log
			Set Node3_MAC8023_PORT_10.OutThrputLogFile = topo1.8023_N3_P10_OutThrput.log
			Set Node3_MAC8023_PORT_10.InOutThrputLogFile = topo1.8023_N3_P10_InOutThrput.log
			Set Node3_MAC8023_PORT_10.LinktoHub = 0

		Module Phy : Node3_Phy_PORT_10
			Set Node3_Phy_PORT_10.Bw = 10
			Set Node3_Phy_PORT_10.BER = 0.0
			Set Node3_Phy_PORT_10.PropDelay = 1
			Set Node3_Phy_PORT_10.linkfail = off
			Set Node3_Phy_PORT_10.linkfailFileName = topo1.phy_N3_P10.linkfail

		Module Link : Node3_PORT_10
			Set Node3_PORT_10.guitag_remotenode = yes


		Bind Node3_MAC8023_PORT_10 Node3_Phy_PORT_10
		Bind Node3_Phy_PORT_10 Node3_PORT_10
	EndDefine

	Define port 11
		Module MAC8023 : Node3_MAC8023_PORT_11

			Set Node3_OFSwitch_0.port11 = Node3_MAC8023_PORT_11
			Set Node3_OFSwitch_0.fixed_net11 = Node3_MAC8023_PORT_11.no
			Set Node3_MAC8023_PORT_11.recvtarget = Node3_OFSwitch_0

			Set Node3_MAC8023_PORT_11.mac = 0:1:0:0:0:19
			Set Node3_MAC8023_PORT_11.lock_mac = off
			Set Node3_MAC8023_PORT_11.PromisOpt = on
			Set Node3_MAC8023_PORT_11.mode = full
			Set Node3_MAC8023_PORT_11.log = off
			Set Node3_MAC8023_PORT_11.logInterval = 1
			Set Node3_MAC8023_PORT_11.NumCollision = off
			Set Node3_MAC8023_PORT_11.NumUniInPkt = off
			Set Node3_MAC8023_PORT_11.NumUniOutPkt = off
			Set Node3_MAC8023_PORT_11.NumUniInOutPkt = off
			Set Node3_MAC8023_PORT_11.NumBroInPkt = off
			Set Node3_MAC8023_PORT_11.NumBroOutPkt = off
			Set Node3_MAC8023_PORT_11.NumBroInOutPkt = off
			Set Node3_MAC8023_PORT_11.NumDrop = off
			Set Node3_MAC8023_PORT_11.InThrput = off
			Set Node3_MAC8023_PORT_11.OutThrput = off
			Set Node3_MAC8023_PORT_11.InOutThrput = off
			Set Node3_MAC8023_PORT_11.UniInLogFile = topo1.8023_N3_P11_UniIn.log
			Set Node3_MAC8023_PORT_11.UniOutLogFile = topo1.8023_N3_P11_UniOut.log
			Set Node3_MAC8023_PORT_11.UniInOutLogFile = topo1.8023_N3_P11_UniInOut.log
			Set Node3_MAC8023_PORT_11.BroInLogFile = topo1.8023_N3_P11_BroIn.log
			Set Node3_MAC8023_PORT_11.BroOutLogFile = topo1.8023_N3_P11_BroOut.log
			Set Node3_MAC8023_PORT_11.BroInOutLogFile = topo1.8023_N3_P11_BroInOut.log
			Set Node3_MAC8023_PORT_11.CollLogFile = topo1.8023_N3_P11_Coll.log
			Set Node3_MAC8023_PORT_11.DropLogFile = topo1.8023_N3_P11_Drop.log
			Set Node3_MAC8023_PORT_11.InThrputLogFile = topo1.8023_N3_P11_InThrput.log
			Set Node3_MAC8023_PORT_11.OutThrputLogFile = topo1.8023_N3_P11_OutThrput.log
			Set Node3_MAC8023_PORT_11.InOutThrputLogFile = topo1.8023_N3_P11_InOutThrput.log
			Set Node3_MAC8023_PORT_11.LinktoHub = 0

		Module Phy : Node3_Phy_PORT_11
			Set Node3_Phy_PORT_11.Bw = 10
			Set Node3_Phy_PORT_11.BER = 0.0
			Set Node3_Phy_PORT_11.PropDelay = 1
			Set Node3_Phy_PORT_11.linkfail = off
			Set Node3_Phy_PORT_11.linkfailFileName = topo1.phy_N3_P11.linkfail

		Module Link : Node3_PORT_11
			Set Node3_PORT_11.guitag_remotenode = yes


		Bind Node3_MAC8023_PORT_11 Node3_Phy_PORT_11
		Bind Node3_Phy_PORT_11 Node3_PORT_11
	EndDefine

	Define port 12
		Module MAC8023 : Node3_MAC8023_PORT_12

			Set Node3_OFSwitch_0.port12 = Node3_MAC8023_PORT_12
			Set Node3_OFSwitch_0.fixed_net12 = Node3_MAC8023_PORT_12.no
			Set Node3_MAC8023_PORT_12.recvtarget = Node3_OFSwitch_0

			Set Node3_MAC8023_PORT_12.mac = 0:1:0:0:0:1a
			Set Node3_MAC8023_PORT_12.lock_mac = off
			Set Node3_MAC8023_PORT_12.PromisOpt = on
			Set Node3_MAC8023_PORT_12.mode = full
			Set Node3_MAC8023_PORT_12.log = off
			Set Node3_MAC8023_PORT_12.logInterval = 1
			Set Node3_MAC8023_PORT_12.NumCollision = off
			Set Node3_MAC8023_PORT_12.NumUniInPkt = off
			Set Node3_MAC8023_PORT_12.NumUniOutPkt = off
			Set Node3_MAC8023_PORT_12.NumUniInOutPkt = off
			Set Node3_MAC8023_PORT_12.NumBroInPkt = off
			Set Node3_MAC8023_PORT_12.NumBroOutPkt = off
			Set Node3_MAC8023_PORT_12.NumBroInOutPkt = off
			Set Node3_MAC8023_PORT_12.NumDrop = off
			Set Node3_MAC8023_PORT_12.InThrput = off
			Set Node3_MAC8023_PORT_12.OutThrput = off
			Set Node3_MAC8023_PORT_12.InOutThrput = off
			Set Node3_MAC8023_PORT_12.UniInLogFile = topo1.8023_N3_P12_UniIn.log
			Set Node3_MAC8023_PORT_12.UniOutLogFile = topo1.8023_N3_P12_UniOut.log
			Set Node3_MAC8023_PORT_12.UniInOutLogFile = topo1.8023_N3_P12_UniInOut.log
			Set Node3_MAC8023_PORT_12.BroInLogFile = topo1.8023_N3_P12_BroIn.log
			Set Node3_MAC8023_PORT_12.BroOutLogFile = topo1.8023_N3_P12_BroOut.log
			Set Node3_MAC8023_PORT_12.BroInOutLogFile = topo1.8023_N3_P12_BroInOut.log
			Set Node3_MAC8023_PORT_12.CollLogFile = topo1.8023_N3_P12_Coll.log
			Set Node3_MAC8023_PORT_12.DropLogFile = topo1.8023_N3_P12_Drop.log
			Set Node3_MAC8023_PORT_12.InThrputLogFile = topo1.8023_N3_P12_InThrput.log
			Set Node3_MAC8023_PORT_12.OutThrputLogFile = topo1.8023_N3_P12_OutThrput.log
			Set Node3_MAC8023_PORT_12.InOutThrputLogFile = topo1.8023_N3_P12_InOutThrput.log
			Set Node3_MAC8023_PORT_12.LinktoHub = 0

		Module Phy : Node3_Phy_PORT_12
			Set Node3_Phy_PORT_12.Bw = 10
			Set Node3_Phy_PORT_12.BER = 0.0
			Set Node3_Phy_PORT_12.PropDelay = 1
			Set Node3_Phy_PORT_12.linkfail = off
			Set Node3_Phy_PORT_12.linkfailFileName = topo1.phy_N3_P12.linkfail

		Module Link : Node3_PORT_12
			Set Node3_PORT_12.guitag_remotenode = yes


		Bind Node3_MAC8023_PORT_12 Node3_Phy_PORT_12
		Bind Node3_Phy_PORT_12 Node3_PORT_12
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
			Set Node4_MAC8023_PORT_1.mac = 0:1:0:0:0:1b
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
			Set Node4_MAC8023_PORT_2.mac = 0:1:0:0:0:1c
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
			Set Node4_MAC8023_PORT_3.mac = 0:1:0:0:0:1d
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

	Define port 4
		Module FIFO : Node4_FIFO_PORT_4

			Set Node4_Switch_0.port4 = Node4_FIFO_PORT_4
			Set Node4_Switch_0.fixed_net4 = Node4_FIFO_PORT_4.no
			Set Node4_FIFO_PORT_4.recvtarget = Node4_Switch_0

			Set Node4_FIFO_PORT_4.max_qlen = 50
			Set Node4_FIFO_PORT_4.log_qlen = off
			Set Node4_FIFO_PORT_4.log_option = FullLog
			Set Node4_FIFO_PORT_4.samplerate = 1
			Set Node4_FIFO_PORT_4.logFileName = topo1.fifo_N4_P4_qlen.log
			Set Node4_FIFO_PORT_4.log_drop = off
			Set Node4_FIFO_PORT_4.drop_samplerate = 1
			Set Node4_FIFO_PORT_4.droplogFileName = topo1.fifo_N4_P4_drop.log

		Module MAC8023 : Node4_MAC8023_PORT_4
			Set Node4_MAC8023_PORT_4.mac = 0:1:0:0:0:1e
			Set Node4_MAC8023_PORT_4.lock_mac = off
			Set Node4_MAC8023_PORT_4.PromisOpt = on
			Set Node4_MAC8023_PORT_4.mode = full
			Set Node4_MAC8023_PORT_4.log = off
			Set Node4_MAC8023_PORT_4.logInterval = 1
			Set Node4_MAC8023_PORT_4.NumCollision = off
			Set Node4_MAC8023_PORT_4.NumUniInPkt = off
			Set Node4_MAC8023_PORT_4.NumUniOutPkt = off
			Set Node4_MAC8023_PORT_4.NumUniInOutPkt = off
			Set Node4_MAC8023_PORT_4.NumBroInPkt = off
			Set Node4_MAC8023_PORT_4.NumBroOutPkt = off
			Set Node4_MAC8023_PORT_4.NumBroInOutPkt = off
			Set Node4_MAC8023_PORT_4.NumDrop = off
			Set Node4_MAC8023_PORT_4.InThrput = off
			Set Node4_MAC8023_PORT_4.OutThrput = off
			Set Node4_MAC8023_PORT_4.InOutThrput = off
			Set Node4_MAC8023_PORT_4.UniInLogFile = topo1.8023_N4_P4_UniIn.log
			Set Node4_MAC8023_PORT_4.UniOutLogFile = topo1.8023_N4_P4_UniOut.log
			Set Node4_MAC8023_PORT_4.UniInOutLogFile = topo1.8023_N4_P4_UniInOut.log
			Set Node4_MAC8023_PORT_4.BroInLogFile = topo1.8023_N4_P4_BroIn.log
			Set Node4_MAC8023_PORT_4.BroOutLogFile = topo1.8023_N4_P4_BroOut.log
			Set Node4_MAC8023_PORT_4.BroInOutLogFile = topo1.8023_N4_P4_BroInOut.log
			Set Node4_MAC8023_PORT_4.CollLogFile = topo1.8023_N4_P4_Coll.log
			Set Node4_MAC8023_PORT_4.DropLogFile = topo1.8023_N4_P4_Drop.log
			Set Node4_MAC8023_PORT_4.InThrputLogFile = topo1.8023_N4_P4_InThrput.log
			Set Node4_MAC8023_PORT_4.OutThrputLogFile = topo1.8023_N4_P4_OutThrput.log
			Set Node4_MAC8023_PORT_4.InOutThrputLogFile = topo1.8023_N4_P4_InOutThrput.log
			Set Node4_MAC8023_PORT_4.LinktoHub = 0

		Module Phy : Node4_Phy_PORT_4
			Set Node4_Phy_PORT_4.Bw = 10
			Set Node4_Phy_PORT_4.BER = 0.0
			Set Node4_Phy_PORT_4.PropDelay = 1
			Set Node4_Phy_PORT_4.linkfail = off
			Set Node4_Phy_PORT_4.linkfailFileName = topo1.phy_N4_P4.linkfail

		Module Link : Node4_PORT_4
			Set Node4_PORT_4.guitag_remotenode = yes


		Bind Node4_FIFO_PORT_4 Node4_MAC8023_PORT_4
		Bind Node4_MAC8023_PORT_4 Node4_Phy_PORT_4
		Bind Node4_Phy_PORT_4 Node4_PORT_4
	EndDefine

	Define port 5
		Module FIFO : Node4_FIFO_PORT_5

			Set Node4_Switch_0.port5 = Node4_FIFO_PORT_5
			Set Node4_Switch_0.fixed_net5 = Node4_FIFO_PORT_5.no
			Set Node4_FIFO_PORT_5.recvtarget = Node4_Switch_0

			Set Node4_FIFO_PORT_5.max_qlen = 50
			Set Node4_FIFO_PORT_5.log_qlen = off
			Set Node4_FIFO_PORT_5.log_option = FullLog
			Set Node4_FIFO_PORT_5.samplerate = 1
			Set Node4_FIFO_PORT_5.logFileName = topo1.fifo_N4_P5_qlen.log
			Set Node4_FIFO_PORT_5.log_drop = off
			Set Node4_FIFO_PORT_5.drop_samplerate = 1
			Set Node4_FIFO_PORT_5.droplogFileName = topo1.fifo_N4_P5_drop.log

		Module MAC8023 : Node4_MAC8023_PORT_5
			Set Node4_MAC8023_PORT_5.mac = 0:1:0:0:0:1f
			Set Node4_MAC8023_PORT_5.lock_mac = off
			Set Node4_MAC8023_PORT_5.PromisOpt = on
			Set Node4_MAC8023_PORT_5.mode = full
			Set Node4_MAC8023_PORT_5.log = off
			Set Node4_MAC8023_PORT_5.logInterval = 1
			Set Node4_MAC8023_PORT_5.NumCollision = off
			Set Node4_MAC8023_PORT_5.NumUniInPkt = off
			Set Node4_MAC8023_PORT_5.NumUniOutPkt = off
			Set Node4_MAC8023_PORT_5.NumUniInOutPkt = off
			Set Node4_MAC8023_PORT_5.NumBroInPkt = off
			Set Node4_MAC8023_PORT_5.NumBroOutPkt = off
			Set Node4_MAC8023_PORT_5.NumBroInOutPkt = off
			Set Node4_MAC8023_PORT_5.NumDrop = off
			Set Node4_MAC8023_PORT_5.InThrput = off
			Set Node4_MAC8023_PORT_5.OutThrput = off
			Set Node4_MAC8023_PORT_5.InOutThrput = off
			Set Node4_MAC8023_PORT_5.UniInLogFile = topo1.8023_N4_P5_UniIn.log
			Set Node4_MAC8023_PORT_5.UniOutLogFile = topo1.8023_N4_P5_UniOut.log
			Set Node4_MAC8023_PORT_5.UniInOutLogFile = topo1.8023_N4_P5_UniInOut.log
			Set Node4_MAC8023_PORT_5.BroInLogFile = topo1.8023_N4_P5_BroIn.log
			Set Node4_MAC8023_PORT_5.BroOutLogFile = topo1.8023_N4_P5_BroOut.log
			Set Node4_MAC8023_PORT_5.BroInOutLogFile = topo1.8023_N4_P5_BroInOut.log
			Set Node4_MAC8023_PORT_5.CollLogFile = topo1.8023_N4_P5_Coll.log
			Set Node4_MAC8023_PORT_5.DropLogFile = topo1.8023_N4_P5_Drop.log
			Set Node4_MAC8023_PORT_5.InThrputLogFile = topo1.8023_N4_P5_InThrput.log
			Set Node4_MAC8023_PORT_5.OutThrputLogFile = topo1.8023_N4_P5_OutThrput.log
			Set Node4_MAC8023_PORT_5.InOutThrputLogFile = topo1.8023_N4_P5_InOutThrput.log
			Set Node4_MAC8023_PORT_5.LinktoHub = 0

		Module Phy : Node4_Phy_PORT_5
			Set Node4_Phy_PORT_5.Bw = 10
			Set Node4_Phy_PORT_5.BER = 0.0
			Set Node4_Phy_PORT_5.PropDelay = 1
			Set Node4_Phy_PORT_5.linkfail = off
			Set Node4_Phy_PORT_5.linkfailFileName = topo1.phy_N4_P5.linkfail

		Module Link : Node4_PORT_5
			Set Node4_PORT_5.guitag_remotenode = yes


		Bind Node4_FIFO_PORT_5 Node4_MAC8023_PORT_5
		Bind Node4_MAC8023_PORT_5 Node4_Phy_PORT_5
		Bind Node4_Phy_PORT_5 Node4_PORT_5
	EndDefine

	Define port 6
		Module FIFO : Node4_FIFO_PORT_6

			Set Node4_Switch_0.port6 = Node4_FIFO_PORT_6
			Set Node4_Switch_0.fixed_net6 = Node4_FIFO_PORT_6.no
			Set Node4_FIFO_PORT_6.recvtarget = Node4_Switch_0

			Set Node4_FIFO_PORT_6.max_qlen = 50
			Set Node4_FIFO_PORT_6.log_qlen = off
			Set Node4_FIFO_PORT_6.log_option = FullLog
			Set Node4_FIFO_PORT_6.samplerate = 1
			Set Node4_FIFO_PORT_6.logFileName = topo1.fifo_N4_P6_qlen.log
			Set Node4_FIFO_PORT_6.log_drop = off
			Set Node4_FIFO_PORT_6.drop_samplerate = 1
			Set Node4_FIFO_PORT_6.droplogFileName = topo1.fifo_N4_P6_drop.log

		Module MAC8023 : Node4_MAC8023_PORT_6
			Set Node4_MAC8023_PORT_6.mac = 0:1:0:0:0:20
			Set Node4_MAC8023_PORT_6.lock_mac = off
			Set Node4_MAC8023_PORT_6.PromisOpt = on
			Set Node4_MAC8023_PORT_6.mode = full
			Set Node4_MAC8023_PORT_6.log = off
			Set Node4_MAC8023_PORT_6.logInterval = 1
			Set Node4_MAC8023_PORT_6.NumCollision = off
			Set Node4_MAC8023_PORT_6.NumUniInPkt = off
			Set Node4_MAC8023_PORT_6.NumUniOutPkt = off
			Set Node4_MAC8023_PORT_6.NumUniInOutPkt = off
			Set Node4_MAC8023_PORT_6.NumBroInPkt = off
			Set Node4_MAC8023_PORT_6.NumBroOutPkt = off
			Set Node4_MAC8023_PORT_6.NumBroInOutPkt = off
			Set Node4_MAC8023_PORT_6.NumDrop = off
			Set Node4_MAC8023_PORT_6.InThrput = off
			Set Node4_MAC8023_PORT_6.OutThrput = off
			Set Node4_MAC8023_PORT_6.InOutThrput = off
			Set Node4_MAC8023_PORT_6.UniInLogFile = topo1.8023_N4_P6_UniIn.log
			Set Node4_MAC8023_PORT_6.UniOutLogFile = topo1.8023_N4_P6_UniOut.log
			Set Node4_MAC8023_PORT_6.UniInOutLogFile = topo1.8023_N4_P6_UniInOut.log
			Set Node4_MAC8023_PORT_6.BroInLogFile = topo1.8023_N4_P6_BroIn.log
			Set Node4_MAC8023_PORT_6.BroOutLogFile = topo1.8023_N4_P6_BroOut.log
			Set Node4_MAC8023_PORT_6.BroInOutLogFile = topo1.8023_N4_P6_BroInOut.log
			Set Node4_MAC8023_PORT_6.CollLogFile = topo1.8023_N4_P6_Coll.log
			Set Node4_MAC8023_PORT_6.DropLogFile = topo1.8023_N4_P6_Drop.log
			Set Node4_MAC8023_PORT_6.InThrputLogFile = topo1.8023_N4_P6_InThrput.log
			Set Node4_MAC8023_PORT_6.OutThrputLogFile = topo1.8023_N4_P6_OutThrput.log
			Set Node4_MAC8023_PORT_6.InOutThrputLogFile = topo1.8023_N4_P6_InOutThrput.log
			Set Node4_MAC8023_PORT_6.LinktoHub = 0

		Module Phy : Node4_Phy_PORT_6
			Set Node4_Phy_PORT_6.Bw = 10
			Set Node4_Phy_PORT_6.BER = 0.0
			Set Node4_Phy_PORT_6.PropDelay = 1
			Set Node4_Phy_PORT_6.linkfail = off
			Set Node4_Phy_PORT_6.linkfailFileName = topo1.phy_N4_P6.linkfail

		Module Link : Node4_PORT_6
			Set Node4_PORT_6.guitag_remotenode = yes


		Bind Node4_FIFO_PORT_6 Node4_MAC8023_PORT_6
		Bind Node4_MAC8023_PORT_6 Node4_Phy_PORT_6
		Bind Node4_Phy_PORT_6 Node4_PORT_6
	EndDefine

	Define port 7
		Module FIFO : Node4_FIFO_PORT_7

			Set Node4_Switch_0.port7 = Node4_FIFO_PORT_7
			Set Node4_Switch_0.fixed_net7 = Node4_FIFO_PORT_7.no
			Set Node4_FIFO_PORT_7.recvtarget = Node4_Switch_0

			Set Node4_FIFO_PORT_7.max_qlen = 50
			Set Node4_FIFO_PORT_7.log_qlen = off
			Set Node4_FIFO_PORT_7.log_option = FullLog
			Set Node4_FIFO_PORT_7.samplerate = 1
			Set Node4_FIFO_PORT_7.logFileName = topo1.fifo_N4_P7_qlen.log
			Set Node4_FIFO_PORT_7.log_drop = off
			Set Node4_FIFO_PORT_7.drop_samplerate = 1
			Set Node4_FIFO_PORT_7.droplogFileName = topo1.fifo_N4_P7_drop.log

		Module MAC8023 : Node4_MAC8023_PORT_7
			Set Node4_MAC8023_PORT_7.mac = 0:1:0:0:0:21
			Set Node4_MAC8023_PORT_7.lock_mac = off
			Set Node4_MAC8023_PORT_7.PromisOpt = on
			Set Node4_MAC8023_PORT_7.mode = full
			Set Node4_MAC8023_PORT_7.log = off
			Set Node4_MAC8023_PORT_7.logInterval = 1
			Set Node4_MAC8023_PORT_7.NumCollision = off
			Set Node4_MAC8023_PORT_7.NumUniInPkt = off
			Set Node4_MAC8023_PORT_7.NumUniOutPkt = off
			Set Node4_MAC8023_PORT_7.NumUniInOutPkt = off
			Set Node4_MAC8023_PORT_7.NumBroInPkt = off
			Set Node4_MAC8023_PORT_7.NumBroOutPkt = off
			Set Node4_MAC8023_PORT_7.NumBroInOutPkt = off
			Set Node4_MAC8023_PORT_7.NumDrop = off
			Set Node4_MAC8023_PORT_7.InThrput = off
			Set Node4_MAC8023_PORT_7.OutThrput = off
			Set Node4_MAC8023_PORT_7.InOutThrput = off
			Set Node4_MAC8023_PORT_7.UniInLogFile = topo1.8023_N4_P7_UniIn.log
			Set Node4_MAC8023_PORT_7.UniOutLogFile = topo1.8023_N4_P7_UniOut.log
			Set Node4_MAC8023_PORT_7.UniInOutLogFile = topo1.8023_N4_P7_UniInOut.log
			Set Node4_MAC8023_PORT_7.BroInLogFile = topo1.8023_N4_P7_BroIn.log
			Set Node4_MAC8023_PORT_7.BroOutLogFile = topo1.8023_N4_P7_BroOut.log
			Set Node4_MAC8023_PORT_7.BroInOutLogFile = topo1.8023_N4_P7_BroInOut.log
			Set Node4_MAC8023_PORT_7.CollLogFile = topo1.8023_N4_P7_Coll.log
			Set Node4_MAC8023_PORT_7.DropLogFile = topo1.8023_N4_P7_Drop.log
			Set Node4_MAC8023_PORT_7.InThrputLogFile = topo1.8023_N4_P7_InThrput.log
			Set Node4_MAC8023_PORT_7.OutThrputLogFile = topo1.8023_N4_P7_OutThrput.log
			Set Node4_MAC8023_PORT_7.InOutThrputLogFile = topo1.8023_N4_P7_InOutThrput.log
			Set Node4_MAC8023_PORT_7.LinktoHub = 0

		Module Phy : Node4_Phy_PORT_7
			Set Node4_Phy_PORT_7.Bw = 10
			Set Node4_Phy_PORT_7.BER = 0.0
			Set Node4_Phy_PORT_7.PropDelay = 1
			Set Node4_Phy_PORT_7.linkfail = off
			Set Node4_Phy_PORT_7.linkfailFileName = topo1.phy_N4_P7.linkfail

		Module Link : Node4_PORT_7
			Set Node4_PORT_7.guitag_remotenode = yes


		Bind Node4_FIFO_PORT_7 Node4_MAC8023_PORT_7
		Bind Node4_MAC8023_PORT_7 Node4_Phy_PORT_7
		Bind Node4_Phy_PORT_7 Node4_PORT_7
	EndDefine

	Define port 8
		Module FIFO : Node4_FIFO_PORT_8

			Set Node4_Switch_0.port8 = Node4_FIFO_PORT_8
			Set Node4_Switch_0.fixed_net8 = Node4_FIFO_PORT_8.no
			Set Node4_FIFO_PORT_8.recvtarget = Node4_Switch_0

			Set Node4_FIFO_PORT_8.max_qlen = 50
			Set Node4_FIFO_PORT_8.log_qlen = off
			Set Node4_FIFO_PORT_8.log_option = FullLog
			Set Node4_FIFO_PORT_8.samplerate = 1
			Set Node4_FIFO_PORT_8.logFileName = topo1.fifo_N4_P8_qlen.log
			Set Node4_FIFO_PORT_8.log_drop = off
			Set Node4_FIFO_PORT_8.drop_samplerate = 1
			Set Node4_FIFO_PORT_8.droplogFileName = topo1.fifo_N4_P8_drop.log

		Module MAC8023 : Node4_MAC8023_PORT_8
			Set Node4_MAC8023_PORT_8.mac = 0:1:0:0:0:22
			Set Node4_MAC8023_PORT_8.lock_mac = off
			Set Node4_MAC8023_PORT_8.PromisOpt = on
			Set Node4_MAC8023_PORT_8.mode = full
			Set Node4_MAC8023_PORT_8.log = off
			Set Node4_MAC8023_PORT_8.logInterval = 1
			Set Node4_MAC8023_PORT_8.NumCollision = off
			Set Node4_MAC8023_PORT_8.NumUniInPkt = off
			Set Node4_MAC8023_PORT_8.NumUniOutPkt = off
			Set Node4_MAC8023_PORT_8.NumUniInOutPkt = off
			Set Node4_MAC8023_PORT_8.NumBroInPkt = off
			Set Node4_MAC8023_PORT_8.NumBroOutPkt = off
			Set Node4_MAC8023_PORT_8.NumBroInOutPkt = off
			Set Node4_MAC8023_PORT_8.NumDrop = off
			Set Node4_MAC8023_PORT_8.InThrput = off
			Set Node4_MAC8023_PORT_8.OutThrput = off
			Set Node4_MAC8023_PORT_8.InOutThrput = off
			Set Node4_MAC8023_PORT_8.UniInLogFile = topo1.8023_N4_P8_UniIn.log
			Set Node4_MAC8023_PORT_8.UniOutLogFile = topo1.8023_N4_P8_UniOut.log
			Set Node4_MAC8023_PORT_8.UniInOutLogFile = topo1.8023_N4_P8_UniInOut.log
			Set Node4_MAC8023_PORT_8.BroInLogFile = topo1.8023_N4_P8_BroIn.log
			Set Node4_MAC8023_PORT_8.BroOutLogFile = topo1.8023_N4_P8_BroOut.log
			Set Node4_MAC8023_PORT_8.BroInOutLogFile = topo1.8023_N4_P8_BroInOut.log
			Set Node4_MAC8023_PORT_8.CollLogFile = topo1.8023_N4_P8_Coll.log
			Set Node4_MAC8023_PORT_8.DropLogFile = topo1.8023_N4_P8_Drop.log
			Set Node4_MAC8023_PORT_8.InThrputLogFile = topo1.8023_N4_P8_InThrput.log
			Set Node4_MAC8023_PORT_8.OutThrputLogFile = topo1.8023_N4_P8_OutThrput.log
			Set Node4_MAC8023_PORT_8.InOutThrputLogFile = topo1.8023_N4_P8_InOutThrput.log
			Set Node4_MAC8023_PORT_8.LinktoHub = 0

		Module Phy : Node4_Phy_PORT_8
			Set Node4_Phy_PORT_8.Bw = 10
			Set Node4_Phy_PORT_8.BER = 0.0
			Set Node4_Phy_PORT_8.PropDelay = 1
			Set Node4_Phy_PORT_8.linkfail = off
			Set Node4_Phy_PORT_8.linkfailFileName = topo1.phy_N4_P8.linkfail

		Module Link : Node4_PORT_8
			Set Node4_PORT_8.guitag_remotenode = yes


		Bind Node4_FIFO_PORT_8 Node4_MAC8023_PORT_8
		Bind Node4_MAC8023_PORT_8 Node4_Phy_PORT_8
		Bind Node4_Phy_PORT_8 Node4_PORT_8
	EndDefine

	Define port 9
		Module FIFO : Node4_FIFO_PORT_9

			Set Node4_Switch_0.port9 = Node4_FIFO_PORT_9
			Set Node4_Switch_0.fixed_net9 = Node4_FIFO_PORT_9.no
			Set Node4_FIFO_PORT_9.recvtarget = Node4_Switch_0

			Set Node4_FIFO_PORT_9.max_qlen = 50
			Set Node4_FIFO_PORT_9.log_qlen = off
			Set Node4_FIFO_PORT_9.log_option = FullLog
			Set Node4_FIFO_PORT_9.samplerate = 1
			Set Node4_FIFO_PORT_9.logFileName = topo1.fifo_N4_P9_qlen.log
			Set Node4_FIFO_PORT_9.log_drop = off
			Set Node4_FIFO_PORT_9.drop_samplerate = 1
			Set Node4_FIFO_PORT_9.droplogFileName = topo1.fifo_N4_P9_drop.log

		Module MAC8023 : Node4_MAC8023_PORT_9
			Set Node4_MAC8023_PORT_9.mac = 0:1:0:0:0:23
			Set Node4_MAC8023_PORT_9.lock_mac = off
			Set Node4_MAC8023_PORT_9.PromisOpt = on
			Set Node4_MAC8023_PORT_9.mode = full
			Set Node4_MAC8023_PORT_9.log = off
			Set Node4_MAC8023_PORT_9.logInterval = 1
			Set Node4_MAC8023_PORT_9.NumCollision = off
			Set Node4_MAC8023_PORT_9.NumUniInPkt = off
			Set Node4_MAC8023_PORT_9.NumUniOutPkt = off
			Set Node4_MAC8023_PORT_9.NumUniInOutPkt = off
			Set Node4_MAC8023_PORT_9.NumBroInPkt = off
			Set Node4_MAC8023_PORT_9.NumBroOutPkt = off
			Set Node4_MAC8023_PORT_9.NumBroInOutPkt = off
			Set Node4_MAC8023_PORT_9.NumDrop = off
			Set Node4_MAC8023_PORT_9.InThrput = off
			Set Node4_MAC8023_PORT_9.OutThrput = off
			Set Node4_MAC8023_PORT_9.InOutThrput = off
			Set Node4_MAC8023_PORT_9.UniInLogFile = topo1.8023_N4_P9_UniIn.log
			Set Node4_MAC8023_PORT_9.UniOutLogFile = topo1.8023_N4_P9_UniOut.log
			Set Node4_MAC8023_PORT_9.UniInOutLogFile = topo1.8023_N4_P9_UniInOut.log
			Set Node4_MAC8023_PORT_9.BroInLogFile = topo1.8023_N4_P9_BroIn.log
			Set Node4_MAC8023_PORT_9.BroOutLogFile = topo1.8023_N4_P9_BroOut.log
			Set Node4_MAC8023_PORT_9.BroInOutLogFile = topo1.8023_N4_P9_BroInOut.log
			Set Node4_MAC8023_PORT_9.CollLogFile = topo1.8023_N4_P9_Coll.log
			Set Node4_MAC8023_PORT_9.DropLogFile = topo1.8023_N4_P9_Drop.log
			Set Node4_MAC8023_PORT_9.InThrputLogFile = topo1.8023_N4_P9_InThrput.log
			Set Node4_MAC8023_PORT_9.OutThrputLogFile = topo1.8023_N4_P9_OutThrput.log
			Set Node4_MAC8023_PORT_9.InOutThrputLogFile = topo1.8023_N4_P9_InOutThrput.log
			Set Node4_MAC8023_PORT_9.LinktoHub = 0

		Module Phy : Node4_Phy_PORT_9
			Set Node4_Phy_PORT_9.Bw = 10
			Set Node4_Phy_PORT_9.BER = 0.0
			Set Node4_Phy_PORT_9.PropDelay = 1
			Set Node4_Phy_PORT_9.linkfail = off
			Set Node4_Phy_PORT_9.linkfailFileName = topo1.phy_N4_P9.linkfail

		Module Link : Node4_PORT_9
			Set Node4_PORT_9.guitag_remotenode = yes


		Bind Node4_FIFO_PORT_9 Node4_MAC8023_PORT_9
		Bind Node4_MAC8023_PORT_9 Node4_Phy_PORT_9
		Bind Node4_Phy_PORT_9 Node4_PORT_9
	EndDefine

	Define port 10
		Module FIFO : Node4_FIFO_PORT_10

			Set Node4_Switch_0.port10 = Node4_FIFO_PORT_10
			Set Node4_Switch_0.fixed_net10 = Node4_FIFO_PORT_10.no
			Set Node4_FIFO_PORT_10.recvtarget = Node4_Switch_0

			Set Node4_FIFO_PORT_10.max_qlen = 50
			Set Node4_FIFO_PORT_10.log_qlen = off
			Set Node4_FIFO_PORT_10.log_option = FullLog
			Set Node4_FIFO_PORT_10.samplerate = 1
			Set Node4_FIFO_PORT_10.logFileName = topo1.fifo_N4_P10_qlen.log
			Set Node4_FIFO_PORT_10.log_drop = off
			Set Node4_FIFO_PORT_10.drop_samplerate = 1
			Set Node4_FIFO_PORT_10.droplogFileName = topo1.fifo_N4_P10_drop.log

		Module MAC8023 : Node4_MAC8023_PORT_10
			Set Node4_MAC8023_PORT_10.mac = 0:1:0:0:0:24
			Set Node4_MAC8023_PORT_10.lock_mac = off
			Set Node4_MAC8023_PORT_10.PromisOpt = on
			Set Node4_MAC8023_PORT_10.mode = full
			Set Node4_MAC8023_PORT_10.log = off
			Set Node4_MAC8023_PORT_10.logInterval = 1
			Set Node4_MAC8023_PORT_10.NumCollision = off
			Set Node4_MAC8023_PORT_10.NumUniInPkt = off
			Set Node4_MAC8023_PORT_10.NumUniOutPkt = off
			Set Node4_MAC8023_PORT_10.NumUniInOutPkt = off
			Set Node4_MAC8023_PORT_10.NumBroInPkt = off
			Set Node4_MAC8023_PORT_10.NumBroOutPkt = off
			Set Node4_MAC8023_PORT_10.NumBroInOutPkt = off
			Set Node4_MAC8023_PORT_10.NumDrop = off
			Set Node4_MAC8023_PORT_10.InThrput = off
			Set Node4_MAC8023_PORT_10.OutThrput = off
			Set Node4_MAC8023_PORT_10.InOutThrput = off
			Set Node4_MAC8023_PORT_10.UniInLogFile = topo1.8023_N4_P10_UniIn.log
			Set Node4_MAC8023_PORT_10.UniOutLogFile = topo1.8023_N4_P10_UniOut.log
			Set Node4_MAC8023_PORT_10.UniInOutLogFile = topo1.8023_N4_P10_UniInOut.log
			Set Node4_MAC8023_PORT_10.BroInLogFile = topo1.8023_N4_P10_BroIn.log
			Set Node4_MAC8023_PORT_10.BroOutLogFile = topo1.8023_N4_P10_BroOut.log
			Set Node4_MAC8023_PORT_10.BroInOutLogFile = topo1.8023_N4_P10_BroInOut.log
			Set Node4_MAC8023_PORT_10.CollLogFile = topo1.8023_N4_P10_Coll.log
			Set Node4_MAC8023_PORT_10.DropLogFile = topo1.8023_N4_P10_Drop.log
			Set Node4_MAC8023_PORT_10.InThrputLogFile = topo1.8023_N4_P10_InThrput.log
			Set Node4_MAC8023_PORT_10.OutThrputLogFile = topo1.8023_N4_P10_OutThrput.log
			Set Node4_MAC8023_PORT_10.InOutThrputLogFile = topo1.8023_N4_P10_InOutThrput.log
			Set Node4_MAC8023_PORT_10.LinktoHub = 0

		Module Phy : Node4_Phy_PORT_10
			Set Node4_Phy_PORT_10.Bw = 10
			Set Node4_Phy_PORT_10.BER = 0.0
			Set Node4_Phy_PORT_10.PropDelay = 1
			Set Node4_Phy_PORT_10.linkfail = off
			Set Node4_Phy_PORT_10.linkfailFileName = topo1.phy_N4_P10.linkfail

		Module Link : Node4_PORT_10
			Set Node4_PORT_10.guitag_remotenode = yes


		Bind Node4_FIFO_PORT_10 Node4_MAC8023_PORT_10
		Bind Node4_MAC8023_PORT_10 Node4_Phy_PORT_10
		Bind Node4_Phy_PORT_10 Node4_PORT_10
	EndDefine

	Define port 11
		Module FIFO : Node4_FIFO_PORT_11

			Set Node4_Switch_0.port11 = Node4_FIFO_PORT_11
			Set Node4_Switch_0.fixed_net11 = Node4_FIFO_PORT_11.no
			Set Node4_FIFO_PORT_11.recvtarget = Node4_Switch_0

			Set Node4_FIFO_PORT_11.max_qlen = 50
			Set Node4_FIFO_PORT_11.log_qlen = off
			Set Node4_FIFO_PORT_11.log_option = FullLog
			Set Node4_FIFO_PORT_11.samplerate = 1
			Set Node4_FIFO_PORT_11.logFileName = topo1.fifo_N4_P11_qlen.log
			Set Node4_FIFO_PORT_11.log_drop = off
			Set Node4_FIFO_PORT_11.drop_samplerate = 1
			Set Node4_FIFO_PORT_11.droplogFileName = topo1.fifo_N4_P11_drop.log

		Module MAC8023 : Node4_MAC8023_PORT_11
			Set Node4_MAC8023_PORT_11.mac = 0:1:0:0:0:25
			Set Node4_MAC8023_PORT_11.lock_mac = off
			Set Node4_MAC8023_PORT_11.PromisOpt = on
			Set Node4_MAC8023_PORT_11.mode = full
			Set Node4_MAC8023_PORT_11.log = off
			Set Node4_MAC8023_PORT_11.logInterval = 1
			Set Node4_MAC8023_PORT_11.NumCollision = off
			Set Node4_MAC8023_PORT_11.NumUniInPkt = off
			Set Node4_MAC8023_PORT_11.NumUniOutPkt = off
			Set Node4_MAC8023_PORT_11.NumUniInOutPkt = off
			Set Node4_MAC8023_PORT_11.NumBroInPkt = off
			Set Node4_MAC8023_PORT_11.NumBroOutPkt = off
			Set Node4_MAC8023_PORT_11.NumBroInOutPkt = off
			Set Node4_MAC8023_PORT_11.NumDrop = off
			Set Node4_MAC8023_PORT_11.InThrput = off
			Set Node4_MAC8023_PORT_11.OutThrput = off
			Set Node4_MAC8023_PORT_11.InOutThrput = off
			Set Node4_MAC8023_PORT_11.UniInLogFile = topo1.8023_N4_P11_UniIn.log
			Set Node4_MAC8023_PORT_11.UniOutLogFile = topo1.8023_N4_P11_UniOut.log
			Set Node4_MAC8023_PORT_11.UniInOutLogFile = topo1.8023_N4_P11_UniInOut.log
			Set Node4_MAC8023_PORT_11.BroInLogFile = topo1.8023_N4_P11_BroIn.log
			Set Node4_MAC8023_PORT_11.BroOutLogFile = topo1.8023_N4_P11_BroOut.log
			Set Node4_MAC8023_PORT_11.BroInOutLogFile = topo1.8023_N4_P11_BroInOut.log
			Set Node4_MAC8023_PORT_11.CollLogFile = topo1.8023_N4_P11_Coll.log
			Set Node4_MAC8023_PORT_11.DropLogFile = topo1.8023_N4_P11_Drop.log
			Set Node4_MAC8023_PORT_11.InThrputLogFile = topo1.8023_N4_P11_InThrput.log
			Set Node4_MAC8023_PORT_11.OutThrputLogFile = topo1.8023_N4_P11_OutThrput.log
			Set Node4_MAC8023_PORT_11.InOutThrputLogFile = topo1.8023_N4_P11_InOutThrput.log
			Set Node4_MAC8023_PORT_11.LinktoHub = 0

		Module Phy : Node4_Phy_PORT_11
			Set Node4_Phy_PORT_11.Bw = 10
			Set Node4_Phy_PORT_11.BER = 0.0
			Set Node4_Phy_PORT_11.PropDelay = 1
			Set Node4_Phy_PORT_11.linkfail = off
			Set Node4_Phy_PORT_11.linkfailFileName = topo1.phy_N4_P11.linkfail

		Module Link : Node4_PORT_11
			Set Node4_PORT_11.guitag_remotenode = yes


		Bind Node4_FIFO_PORT_11 Node4_MAC8023_PORT_11
		Bind Node4_MAC8023_PORT_11 Node4_Phy_PORT_11
		Bind Node4_Phy_PORT_11 Node4_PORT_11
	EndDefine

EndCreate

Create Node 5 as HOST with name = HOST5
	Define port 1
		Module Interface : Node5_Interface_PORT_1
			Set Node5_Interface_PORT_1.ip = 1.0.2.1
			Set Node5_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node5_ARP_PORT_1
			Set Node5_ARP_PORT_1.arpMode = RunARP
			Set Node5_ARP_PORT_1.flushInterval = 3000
			Set Node5_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node5_FIFO_PORT_1
			Set Node5_FIFO_PORT_1.max_qlen = 50
			Set Node5_FIFO_PORT_1.log_qlen = off
			Set Node5_FIFO_PORT_1.log_option = FullLog
			Set Node5_FIFO_PORT_1.samplerate = 1
			Set Node5_FIFO_PORT_1.logFileName = topo1.fifo_N5_P1_qlen.log
			Set Node5_FIFO_PORT_1.log_drop = off
			Set Node5_FIFO_PORT_1.drop_samplerate = 1
			Set Node5_FIFO_PORT_1.droplogFileName = topo1.fifo_N5_P1_drop.log

		Module TCPDUMP : Node5_TCPDUMP_PORT_1

		Module LO : Node5_LO_PORT_1

		Module MAC8023 : Node5_MAC8023_PORT_1
			Set Node5_MAC8023_PORT_1.mac = 0:1:0:0:0:26
			Set Node5_MAC8023_PORT_1.lock_mac = off
			Set Node5_MAC8023_PORT_1.PromisOpt = off
			Set Node5_MAC8023_PORT_1.mode = full
			Set Node5_MAC8023_PORT_1.log = off
			Set Node5_MAC8023_PORT_1.logInterval = 1
			Set Node5_MAC8023_PORT_1.NumCollision = off
			Set Node5_MAC8023_PORT_1.NumUniInPkt = off
			Set Node5_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node5_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node5_MAC8023_PORT_1.NumBroInPkt = off
			Set Node5_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node5_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node5_MAC8023_PORT_1.NumDrop = off
			Set Node5_MAC8023_PORT_1.InThrput = off
			Set Node5_MAC8023_PORT_1.OutThrput = off
			Set Node5_MAC8023_PORT_1.InOutThrput = off
			Set Node5_MAC8023_PORT_1.UniInLogFile = topo1.8023_N5_P1_UniIn.log
			Set Node5_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N5_P1_UniOut.log
			Set Node5_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N5_P1_UniInOut.log
			Set Node5_MAC8023_PORT_1.BroInLogFile = topo1.8023_N5_P1_BroIn.log
			Set Node5_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N5_P1_BroOut.log
			Set Node5_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N5_P1_BroInOut.log
			Set Node5_MAC8023_PORT_1.CollLogFile = topo1.8023_N5_P1_Coll.log
			Set Node5_MAC8023_PORT_1.DropLogFile = topo1.8023_N5_P1_Drop.log
			Set Node5_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N5_P1_InThrput.log
			Set Node5_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N5_P1_OutThrput.log
			Set Node5_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N5_P1_InOutThrput.log
			Set Node5_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node5_Phy_PORT_1
			Set Node5_Phy_PORT_1.Bw = 10
			Set Node5_Phy_PORT_1.BER = 0.0
			Set Node5_Phy_PORT_1.PropDelay = 1
			Set Node5_Phy_PORT_1.linkfail = off
			Set Node5_Phy_PORT_1.linkfailFileName = topo1.phy_N5_P1.linkfail

		Module Link : Node5_PORT_1
			Set Node5_PORT_1.guitag_remotenode = yes


		Bind Node5_Interface_PORT_1 Node5_ARP_PORT_1
		Bind Node5_ARP_PORT_1 Node5_FIFO_PORT_1
		Bind Node5_FIFO_PORT_1 Node5_TCPDUMP_PORT_1
		Bind Node5_TCPDUMP_PORT_1 Node5_LO_PORT_1
		Bind Node5_LO_PORT_1 Node5_MAC8023_PORT_1
		Bind Node5_MAC8023_PORT_1 Node5_Phy_PORT_1
		Bind Node5_Phy_PORT_1 Node5_PORT_1
	EndDefine

EndCreate

Create Node 6 as HOST with name = HOST6
	Define port 1
		Module Interface : Node6_Interface_PORT_1
			Set Node6_Interface_PORT_1.ip = 1.0.2.2
			Set Node6_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node6_ARP_PORT_1
			Set Node6_ARP_PORT_1.arpMode = RunARP
			Set Node6_ARP_PORT_1.flushInterval = 3000
			Set Node6_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node6_FIFO_PORT_1
			Set Node6_FIFO_PORT_1.max_qlen = 50
			Set Node6_FIFO_PORT_1.log_qlen = off
			Set Node6_FIFO_PORT_1.log_option = FullLog
			Set Node6_FIFO_PORT_1.samplerate = 1
			Set Node6_FIFO_PORT_1.logFileName = topo1.fifo_N6_P1_qlen.log
			Set Node6_FIFO_PORT_1.log_drop = off
			Set Node6_FIFO_PORT_1.drop_samplerate = 1
			Set Node6_FIFO_PORT_1.droplogFileName = topo1.fifo_N6_P1_drop.log

		Module TCPDUMP : Node6_TCPDUMP_PORT_1

		Module LO : Node6_LO_PORT_1

		Module MAC8023 : Node6_MAC8023_PORT_1
			Set Node6_MAC8023_PORT_1.mac = 0:1:0:0:0:27
			Set Node6_MAC8023_PORT_1.lock_mac = off
			Set Node6_MAC8023_PORT_1.PromisOpt = off
			Set Node6_MAC8023_PORT_1.mode = full
			Set Node6_MAC8023_PORT_1.log = off
			Set Node6_MAC8023_PORT_1.logInterval = 1
			Set Node6_MAC8023_PORT_1.NumCollision = off
			Set Node6_MAC8023_PORT_1.NumUniInPkt = off
			Set Node6_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node6_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node6_MAC8023_PORT_1.NumBroInPkt = off
			Set Node6_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node6_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node6_MAC8023_PORT_1.NumDrop = off
			Set Node6_MAC8023_PORT_1.InThrput = off
			Set Node6_MAC8023_PORT_1.OutThrput = off
			Set Node6_MAC8023_PORT_1.InOutThrput = off
			Set Node6_MAC8023_PORT_1.UniInLogFile = topo1.8023_N6_P1_UniIn.log
			Set Node6_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N6_P1_UniOut.log
			Set Node6_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N6_P1_UniInOut.log
			Set Node6_MAC8023_PORT_1.BroInLogFile = topo1.8023_N6_P1_BroIn.log
			Set Node6_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N6_P1_BroOut.log
			Set Node6_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N6_P1_BroInOut.log
			Set Node6_MAC8023_PORT_1.CollLogFile = topo1.8023_N6_P1_Coll.log
			Set Node6_MAC8023_PORT_1.DropLogFile = topo1.8023_N6_P1_Drop.log
			Set Node6_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N6_P1_InThrput.log
			Set Node6_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N6_P1_OutThrput.log
			Set Node6_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N6_P1_InOutThrput.log
			Set Node6_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node6_Phy_PORT_1
			Set Node6_Phy_PORT_1.Bw = 10
			Set Node6_Phy_PORT_1.BER = 0.0
			Set Node6_Phy_PORT_1.PropDelay = 1
			Set Node6_Phy_PORT_1.linkfail = off
			Set Node6_Phy_PORT_1.linkfailFileName = topo1.phy_N6_P1.linkfail

		Module Link : Node6_PORT_1
			Set Node6_PORT_1.guitag_remotenode = yes


		Bind Node6_Interface_PORT_1 Node6_ARP_PORT_1
		Bind Node6_ARP_PORT_1 Node6_FIFO_PORT_1
		Bind Node6_FIFO_PORT_1 Node6_TCPDUMP_PORT_1
		Bind Node6_TCPDUMP_PORT_1 Node6_LO_PORT_1
		Bind Node6_LO_PORT_1 Node6_MAC8023_PORT_1
		Bind Node6_MAC8023_PORT_1 Node6_Phy_PORT_1
		Bind Node6_Phy_PORT_1 Node6_PORT_1
	EndDefine

EndCreate

Create Node 7 as HOST with name = HOST7
	Define port 1
		Module Interface : Node7_Interface_PORT_1
			Set Node7_Interface_PORT_1.ip = 1.0.2.3
			Set Node7_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node7_ARP_PORT_1
			Set Node7_ARP_PORT_1.arpMode = RunARP
			Set Node7_ARP_PORT_1.flushInterval = 3000
			Set Node7_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node7_FIFO_PORT_1
			Set Node7_FIFO_PORT_1.max_qlen = 50
			Set Node7_FIFO_PORT_1.log_qlen = off
			Set Node7_FIFO_PORT_1.log_option = FullLog
			Set Node7_FIFO_PORT_1.samplerate = 1
			Set Node7_FIFO_PORT_1.logFileName = topo1.fifo_N7_P1_qlen.log
			Set Node7_FIFO_PORT_1.log_drop = off
			Set Node7_FIFO_PORT_1.drop_samplerate = 1
			Set Node7_FIFO_PORT_1.droplogFileName = topo1.fifo_N7_P1_drop.log

		Module TCPDUMP : Node7_TCPDUMP_PORT_1

		Module LO : Node7_LO_PORT_1

		Module MAC8023 : Node7_MAC8023_PORT_1
			Set Node7_MAC8023_PORT_1.mac = 0:1:0:0:0:28
			Set Node7_MAC8023_PORT_1.lock_mac = off
			Set Node7_MAC8023_PORT_1.PromisOpt = off
			Set Node7_MAC8023_PORT_1.mode = full
			Set Node7_MAC8023_PORT_1.log = off
			Set Node7_MAC8023_PORT_1.logInterval = 1
			Set Node7_MAC8023_PORT_1.NumCollision = off
			Set Node7_MAC8023_PORT_1.NumUniInPkt = off
			Set Node7_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node7_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node7_MAC8023_PORT_1.NumBroInPkt = off
			Set Node7_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node7_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node7_MAC8023_PORT_1.NumDrop = off
			Set Node7_MAC8023_PORT_1.InThrput = off
			Set Node7_MAC8023_PORT_1.OutThrput = off
			Set Node7_MAC8023_PORT_1.InOutThrput = off
			Set Node7_MAC8023_PORT_1.UniInLogFile = topo1.8023_N7_P1_UniIn.log
			Set Node7_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N7_P1_UniOut.log
			Set Node7_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N7_P1_UniInOut.log
			Set Node7_MAC8023_PORT_1.BroInLogFile = topo1.8023_N7_P1_BroIn.log
			Set Node7_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N7_P1_BroOut.log
			Set Node7_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N7_P1_BroInOut.log
			Set Node7_MAC8023_PORT_1.CollLogFile = topo1.8023_N7_P1_Coll.log
			Set Node7_MAC8023_PORT_1.DropLogFile = topo1.8023_N7_P1_Drop.log
			Set Node7_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N7_P1_InThrput.log
			Set Node7_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N7_P1_OutThrput.log
			Set Node7_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N7_P1_InOutThrput.log
			Set Node7_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node7_Phy_PORT_1
			Set Node7_Phy_PORT_1.Bw = 10
			Set Node7_Phy_PORT_1.BER = 0.0
			Set Node7_Phy_PORT_1.PropDelay = 1
			Set Node7_Phy_PORT_1.linkfail = off
			Set Node7_Phy_PORT_1.linkfailFileName = topo1.phy_N7_P1.linkfail

		Module Link : Node7_PORT_1
			Set Node7_PORT_1.guitag_remotenode = yes


		Bind Node7_Interface_PORT_1 Node7_ARP_PORT_1
		Bind Node7_ARP_PORT_1 Node7_FIFO_PORT_1
		Bind Node7_FIFO_PORT_1 Node7_TCPDUMP_PORT_1
		Bind Node7_TCPDUMP_PORT_1 Node7_LO_PORT_1
		Bind Node7_LO_PORT_1 Node7_MAC8023_PORT_1
		Bind Node7_MAC8023_PORT_1 Node7_Phy_PORT_1
		Bind Node7_Phy_PORT_1 Node7_PORT_1
	EndDefine

EndCreate

Create Node 8 as HOST with name = HOST8
	Define port 1
		Module Interface : Node8_Interface_PORT_1
			Set Node8_Interface_PORT_1.ip = 1.0.2.4
			Set Node8_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node8_ARP_PORT_1
			Set Node8_ARP_PORT_1.arpMode = RunARP
			Set Node8_ARP_PORT_1.flushInterval = 3000
			Set Node8_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node8_FIFO_PORT_1
			Set Node8_FIFO_PORT_1.max_qlen = 50
			Set Node8_FIFO_PORT_1.log_qlen = off
			Set Node8_FIFO_PORT_1.log_option = FullLog
			Set Node8_FIFO_PORT_1.samplerate = 1
			Set Node8_FIFO_PORT_1.logFileName = topo1.fifo_N8_P1_qlen.log
			Set Node8_FIFO_PORT_1.log_drop = off
			Set Node8_FIFO_PORT_1.drop_samplerate = 1
			Set Node8_FIFO_PORT_1.droplogFileName = topo1.fifo_N8_P1_drop.log

		Module TCPDUMP : Node8_TCPDUMP_PORT_1

		Module LO : Node8_LO_PORT_1

		Module MAC8023 : Node8_MAC8023_PORT_1
			Set Node8_MAC8023_PORT_1.mac = 0:1:0:0:0:29
			Set Node8_MAC8023_PORT_1.lock_mac = off
			Set Node8_MAC8023_PORT_1.PromisOpt = off
			Set Node8_MAC8023_PORT_1.mode = full
			Set Node8_MAC8023_PORT_1.log = off
			Set Node8_MAC8023_PORT_1.logInterval = 1
			Set Node8_MAC8023_PORT_1.NumCollision = off
			Set Node8_MAC8023_PORT_1.NumUniInPkt = off
			Set Node8_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node8_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node8_MAC8023_PORT_1.NumBroInPkt = off
			Set Node8_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node8_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node8_MAC8023_PORT_1.NumDrop = off
			Set Node8_MAC8023_PORT_1.InThrput = off
			Set Node8_MAC8023_PORT_1.OutThrput = off
			Set Node8_MAC8023_PORT_1.InOutThrput = off
			Set Node8_MAC8023_PORT_1.UniInLogFile = topo1.8023_N8_P1_UniIn.log
			Set Node8_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N8_P1_UniOut.log
			Set Node8_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N8_P1_UniInOut.log
			Set Node8_MAC8023_PORT_1.BroInLogFile = topo1.8023_N8_P1_BroIn.log
			Set Node8_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N8_P1_BroOut.log
			Set Node8_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N8_P1_BroInOut.log
			Set Node8_MAC8023_PORT_1.CollLogFile = topo1.8023_N8_P1_Coll.log
			Set Node8_MAC8023_PORT_1.DropLogFile = topo1.8023_N8_P1_Drop.log
			Set Node8_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N8_P1_InThrput.log
			Set Node8_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N8_P1_OutThrput.log
			Set Node8_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N8_P1_InOutThrput.log
			Set Node8_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node8_Phy_PORT_1
			Set Node8_Phy_PORT_1.Bw = 10
			Set Node8_Phy_PORT_1.BER = 0.0
			Set Node8_Phy_PORT_1.PropDelay = 1
			Set Node8_Phy_PORT_1.linkfail = off
			Set Node8_Phy_PORT_1.linkfailFileName = topo1.phy_N8_P1.linkfail

		Module Link : Node8_PORT_1
			Set Node8_PORT_1.guitag_remotenode = yes


		Bind Node8_Interface_PORT_1 Node8_ARP_PORT_1
		Bind Node8_ARP_PORT_1 Node8_FIFO_PORT_1
		Bind Node8_FIFO_PORT_1 Node8_TCPDUMP_PORT_1
		Bind Node8_TCPDUMP_PORT_1 Node8_LO_PORT_1
		Bind Node8_LO_PORT_1 Node8_MAC8023_PORT_1
		Bind Node8_MAC8023_PORT_1 Node8_Phy_PORT_1
		Bind Node8_Phy_PORT_1 Node8_PORT_1
	EndDefine

EndCreate

Create Node 9 as OF_SW with name = OF_SW9
	Module OFSwitch : Node9_OFSwitch_0
		Set Node9_OFSwitch_0.guitag_addport = yes
		Set Node9_OFSwitch_0.flow_table_amount = 15
		Set Node9_OFSwitch_0.flow_table_entry_amount = 256
		Set Node9_OFSwitch_0.group_table_entry_amount = 256
		Set Node9_OFSwitch_0.table_miss_buffer_size = 1000
		Set Node9_OFSwitch_0.fifo_queue_size = 50
		Set Node9_OFSwitch_0.controller_ip = 1.0.1.1
	Define port 1
		Module MAC8023 : Node9_MAC8023_PORT_1

			Set Node9_OFSwitch_0.port1 = Node9_MAC8023_PORT_1
			Set Node9_OFSwitch_0.fixed_net1 = Node9_MAC8023_PORT_1.no
			Set Node9_MAC8023_PORT_1.recvtarget = Node9_OFSwitch_0

			Set Node9_MAC8023_PORT_1.mac = 0:1:0:0:0:2a
			Set Node9_MAC8023_PORT_1.lock_mac = off
			Set Node9_MAC8023_PORT_1.PromisOpt = on
			Set Node9_MAC8023_PORT_1.mode = full
			Set Node9_MAC8023_PORT_1.log = off
			Set Node9_MAC8023_PORT_1.logInterval = 1
			Set Node9_MAC8023_PORT_1.NumCollision = off
			Set Node9_MAC8023_PORT_1.NumUniInPkt = off
			Set Node9_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node9_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node9_MAC8023_PORT_1.NumBroInPkt = off
			Set Node9_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node9_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node9_MAC8023_PORT_1.NumDrop = off
			Set Node9_MAC8023_PORT_1.InThrput = off
			Set Node9_MAC8023_PORT_1.OutThrput = off
			Set Node9_MAC8023_PORT_1.InOutThrput = off
			Set Node9_MAC8023_PORT_1.UniInLogFile = topo1.8023_N9_P1_UniIn.log
			Set Node9_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N9_P1_UniOut.log
			Set Node9_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N9_P1_UniInOut.log
			Set Node9_MAC8023_PORT_1.BroInLogFile = topo1.8023_N9_P1_BroIn.log
			Set Node9_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N9_P1_BroOut.log
			Set Node9_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N9_P1_BroInOut.log
			Set Node9_MAC8023_PORT_1.CollLogFile = topo1.8023_N9_P1_Coll.log
			Set Node9_MAC8023_PORT_1.DropLogFile = topo1.8023_N9_P1_Drop.log
			Set Node9_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N9_P1_InThrput.log
			Set Node9_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N9_P1_OutThrput.log
			Set Node9_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N9_P1_InOutThrput.log
			Set Node9_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node9_Phy_PORT_1
			Set Node9_Phy_PORT_1.Bw = 10
			Set Node9_Phy_PORT_1.BER = 0.0
			Set Node9_Phy_PORT_1.PropDelay = 1
			Set Node9_Phy_PORT_1.linkfail = off
			Set Node9_Phy_PORT_1.linkfailFileName = topo1.phy_N9_P1.linkfail

		Module Link : Node9_PORT_1
			Set Node9_PORT_1.guitag_remotenode = yes


		Bind Node9_MAC8023_PORT_1 Node9_Phy_PORT_1
		Bind Node9_Phy_PORT_1 Node9_PORT_1
	EndDefine

	Define port 2
		Module Interface : Node9_Interface_PORT_2

			Set Node9_OFSwitch_0.port2 = Node9_Interface_PORT_2
			Set Node9_OFSwitch_0.fixed_net2 = Node9_Interface_PORT_2.no
			Set Node9_Interface_PORT_2.recvtarget = Node9_OFSwitch_0

			Set Node9_Interface_PORT_2.ip = 1.0.1.5
			Set Node9_Interface_PORT_2.netmask = 255.255.255.0

		Module ARP : Node9_ARP_PORT_2
			Set Node9_ARP_PORT_2.arpMode = RunARP
			Set Node9_ARP_PORT_2.flushInterval = 3000
			Set Node9_ARP_PORT_2.ArpTableFileName = topo1.arp

		Module FIFO : Node9_FIFO_PORT_2
			Set Node9_FIFO_PORT_2.max_qlen = 50
			Set Node9_FIFO_PORT_2.log_qlen = off
			Set Node9_FIFO_PORT_2.log_option = FullLog
			Set Node9_FIFO_PORT_2.samplerate = 1
			Set Node9_FIFO_PORT_2.logFileName = topo1.fifo_N9_P2_qlen.log
			Set Node9_FIFO_PORT_2.log_drop = off
			Set Node9_FIFO_PORT_2.drop_samplerate = 1
			Set Node9_FIFO_PORT_2.droplogFileName = topo1.fifo_N9_P2_drop.log

		Module TCPDUMP : Node9_TCPDUMP_PORT_2

		Module MAC8023 : Node9_MAC8023_PORT_2
			Set Node9_MAC8023_PORT_2.mac = 0:1:0:0:0:2b
			Set Node9_MAC8023_PORT_2.lock_mac = off
			Set Node9_MAC8023_PORT_2.PromisOpt = on
			Set Node9_MAC8023_PORT_2.mode = full
			Set Node9_MAC8023_PORT_2.log = off
			Set Node9_MAC8023_PORT_2.logInterval = 1
			Set Node9_MAC8023_PORT_2.NumCollision = off
			Set Node9_MAC8023_PORT_2.NumUniInPkt = off
			Set Node9_MAC8023_PORT_2.NumUniOutPkt = off
			Set Node9_MAC8023_PORT_2.NumUniInOutPkt = off
			Set Node9_MAC8023_PORT_2.NumBroInPkt = off
			Set Node9_MAC8023_PORT_2.NumBroOutPkt = off
			Set Node9_MAC8023_PORT_2.NumBroInOutPkt = off
			Set Node9_MAC8023_PORT_2.NumDrop = off
			Set Node9_MAC8023_PORT_2.InThrput = off
			Set Node9_MAC8023_PORT_2.OutThrput = off
			Set Node9_MAC8023_PORT_2.InOutThrput = off
			Set Node9_MAC8023_PORT_2.UniInLogFile = topo1.8023_N9_P2_UniIn.log
			Set Node9_MAC8023_PORT_2.UniOutLogFile = topo1.8023_N9_P2_UniOut.log
			Set Node9_MAC8023_PORT_2.UniInOutLogFile = topo1.8023_N9_P2_UniInOut.log
			Set Node9_MAC8023_PORT_2.BroInLogFile = topo1.8023_N9_P2_BroIn.log
			Set Node9_MAC8023_PORT_2.BroOutLogFile = topo1.8023_N9_P2_BroOut.log
			Set Node9_MAC8023_PORT_2.BroInOutLogFile = topo1.8023_N9_P2_BroInOut.log
			Set Node9_MAC8023_PORT_2.CollLogFile = topo1.8023_N9_P2_Coll.log
			Set Node9_MAC8023_PORT_2.DropLogFile = topo1.8023_N9_P2_Drop.log
			Set Node9_MAC8023_PORT_2.InThrputLogFile = topo1.8023_N9_P2_InThrput.log
			Set Node9_MAC8023_PORT_2.OutThrputLogFile = topo1.8023_N9_P2_OutThrput.log
			Set Node9_MAC8023_PORT_2.InOutThrputLogFile = topo1.8023_N9_P2_InOutThrput.log
			Set Node9_MAC8023_PORT_2.LinktoHub = 0

		Module Phy : Node9_Phy_PORT_2
			Set Node9_Phy_PORT_2.Bw = 10
			Set Node9_Phy_PORT_2.BER = 0.0
			Set Node9_Phy_PORT_2.PropDelay = 1
			Set Node9_Phy_PORT_2.linkfail = off
			Set Node9_Phy_PORT_2.linkfailFileName = topo1.phy_N9_P2.linkfail

		Module Link : Node9_PORT_2
			Set Node9_PORT_2.guitag_remotenode = yes


		Bind Node9_Interface_PORT_2 Node9_ARP_PORT_2
		Bind Node9_ARP_PORT_2 Node9_FIFO_PORT_2
		Bind Node9_FIFO_PORT_2 Node9_TCPDUMP_PORT_2
		Bind Node9_TCPDUMP_PORT_2 Node9_MAC8023_PORT_2
		Bind Node9_MAC8023_PORT_2 Node9_Phy_PORT_2
		Bind Node9_Phy_PORT_2 Node9_PORT_2
	EndDefine

	Define port 3
		Module MAC8023 : Node9_MAC8023_PORT_3

			Set Node9_OFSwitch_0.port3 = Node9_MAC8023_PORT_3
			Set Node9_OFSwitch_0.fixed_net3 = Node9_MAC8023_PORT_3.no
			Set Node9_MAC8023_PORT_3.recvtarget = Node9_OFSwitch_0

			Set Node9_MAC8023_PORT_3.mac = 0:1:0:0:0:2c
			Set Node9_MAC8023_PORT_3.lock_mac = off
			Set Node9_MAC8023_PORT_3.PromisOpt = on
			Set Node9_MAC8023_PORT_3.mode = full
			Set Node9_MAC8023_PORT_3.log = off
			Set Node9_MAC8023_PORT_3.logInterval = 1
			Set Node9_MAC8023_PORT_3.NumCollision = off
			Set Node9_MAC8023_PORT_3.NumUniInPkt = off
			Set Node9_MAC8023_PORT_3.NumUniOutPkt = off
			Set Node9_MAC8023_PORT_3.NumUniInOutPkt = off
			Set Node9_MAC8023_PORT_3.NumBroInPkt = off
			Set Node9_MAC8023_PORT_3.NumBroOutPkt = off
			Set Node9_MAC8023_PORT_3.NumBroInOutPkt = off
			Set Node9_MAC8023_PORT_3.NumDrop = off
			Set Node9_MAC8023_PORT_3.InThrput = off
			Set Node9_MAC8023_PORT_3.OutThrput = off
			Set Node9_MAC8023_PORT_3.InOutThrput = off
			Set Node9_MAC8023_PORT_3.UniInLogFile = topo1.8023_N9_P3_UniIn.log
			Set Node9_MAC8023_PORT_3.UniOutLogFile = topo1.8023_N9_P3_UniOut.log
			Set Node9_MAC8023_PORT_3.UniInOutLogFile = topo1.8023_N9_P3_UniInOut.log
			Set Node9_MAC8023_PORT_3.BroInLogFile = topo1.8023_N9_P3_BroIn.log
			Set Node9_MAC8023_PORT_3.BroOutLogFile = topo1.8023_N9_P3_BroOut.log
			Set Node9_MAC8023_PORT_3.BroInOutLogFile = topo1.8023_N9_P3_BroInOut.log
			Set Node9_MAC8023_PORT_3.CollLogFile = topo1.8023_N9_P3_Coll.log
			Set Node9_MAC8023_PORT_3.DropLogFile = topo1.8023_N9_P3_Drop.log
			Set Node9_MAC8023_PORT_3.InThrputLogFile = topo1.8023_N9_P3_InThrput.log
			Set Node9_MAC8023_PORT_3.OutThrputLogFile = topo1.8023_N9_P3_OutThrput.log
			Set Node9_MAC8023_PORT_3.InOutThrputLogFile = topo1.8023_N9_P3_InOutThrput.log
			Set Node9_MAC8023_PORT_3.LinktoHub = 0

		Module Phy : Node9_Phy_PORT_3
			Set Node9_Phy_PORT_3.Bw = 10
			Set Node9_Phy_PORT_3.BER = 0.0
			Set Node9_Phy_PORT_3.PropDelay = 1
			Set Node9_Phy_PORT_3.linkfail = off
			Set Node9_Phy_PORT_3.linkfailFileName = topo1.phy_N9_P3.linkfail

		Module Link : Node9_PORT_3
			Set Node9_PORT_3.guitag_remotenode = yes


		Bind Node9_MAC8023_PORT_3 Node9_Phy_PORT_3
		Bind Node9_Phy_PORT_3 Node9_PORT_3
	EndDefine

	Define port 4
		Module MAC8023 : Node9_MAC8023_PORT_4

			Set Node9_OFSwitch_0.port4 = Node9_MAC8023_PORT_4
			Set Node9_OFSwitch_0.fixed_net4 = Node9_MAC8023_PORT_4.no
			Set Node9_MAC8023_PORT_4.recvtarget = Node9_OFSwitch_0

			Set Node9_MAC8023_PORT_4.mac = 0:1:0:0:0:2d
			Set Node9_MAC8023_PORT_4.lock_mac = off
			Set Node9_MAC8023_PORT_4.PromisOpt = on
			Set Node9_MAC8023_PORT_4.mode = full
			Set Node9_MAC8023_PORT_4.log = off
			Set Node9_MAC8023_PORT_4.logInterval = 1
			Set Node9_MAC8023_PORT_4.NumCollision = off
			Set Node9_MAC8023_PORT_4.NumUniInPkt = off
			Set Node9_MAC8023_PORT_4.NumUniOutPkt = off
			Set Node9_MAC8023_PORT_4.NumUniInOutPkt = off
			Set Node9_MAC8023_PORT_4.NumBroInPkt = off
			Set Node9_MAC8023_PORT_4.NumBroOutPkt = off
			Set Node9_MAC8023_PORT_4.NumBroInOutPkt = off
			Set Node9_MAC8023_PORT_4.NumDrop = off
			Set Node9_MAC8023_PORT_4.InThrput = off
			Set Node9_MAC8023_PORT_4.OutThrput = off
			Set Node9_MAC8023_PORT_4.InOutThrput = off
			Set Node9_MAC8023_PORT_4.UniInLogFile = topo1.8023_N9_P4_UniIn.log
			Set Node9_MAC8023_PORT_4.UniOutLogFile = topo1.8023_N9_P4_UniOut.log
			Set Node9_MAC8023_PORT_4.UniInOutLogFile = topo1.8023_N9_P4_UniInOut.log
			Set Node9_MAC8023_PORT_4.BroInLogFile = topo1.8023_N9_P4_BroIn.log
			Set Node9_MAC8023_PORT_4.BroOutLogFile = topo1.8023_N9_P4_BroOut.log
			Set Node9_MAC8023_PORT_4.BroInOutLogFile = topo1.8023_N9_P4_BroInOut.log
			Set Node9_MAC8023_PORT_4.CollLogFile = topo1.8023_N9_P4_Coll.log
			Set Node9_MAC8023_PORT_4.DropLogFile = topo1.8023_N9_P4_Drop.log
			Set Node9_MAC8023_PORT_4.InThrputLogFile = topo1.8023_N9_P4_InThrput.log
			Set Node9_MAC8023_PORT_4.OutThrputLogFile = topo1.8023_N9_P4_OutThrput.log
			Set Node9_MAC8023_PORT_4.InOutThrputLogFile = topo1.8023_N9_P4_InOutThrput.log
			Set Node9_MAC8023_PORT_4.LinktoHub = 0

		Module Phy : Node9_Phy_PORT_4
			Set Node9_Phy_PORT_4.Bw = 10
			Set Node9_Phy_PORT_4.BER = 0.0
			Set Node9_Phy_PORT_4.PropDelay = 1
			Set Node9_Phy_PORT_4.linkfail = off
			Set Node9_Phy_PORT_4.linkfailFileName = topo1.phy_N9_P4.linkfail

		Module Link : Node9_PORT_4
			Set Node9_PORT_4.guitag_remotenode = yes


		Bind Node9_MAC8023_PORT_4 Node9_Phy_PORT_4
		Bind Node9_Phy_PORT_4 Node9_PORT_4
	EndDefine

	Define port 5
		Module MAC8023 : Node9_MAC8023_PORT_5

			Set Node9_OFSwitch_0.port5 = Node9_MAC8023_PORT_5
			Set Node9_OFSwitch_0.fixed_net5 = Node9_MAC8023_PORT_5.no
			Set Node9_MAC8023_PORT_5.recvtarget = Node9_OFSwitch_0

			Set Node9_MAC8023_PORT_5.mac = 0:1:0:0:0:2e
			Set Node9_MAC8023_PORT_5.lock_mac = off
			Set Node9_MAC8023_PORT_5.PromisOpt = on
			Set Node9_MAC8023_PORT_5.mode = full
			Set Node9_MAC8023_PORT_5.log = off
			Set Node9_MAC8023_PORT_5.logInterval = 1
			Set Node9_MAC8023_PORT_5.NumCollision = off
			Set Node9_MAC8023_PORT_5.NumUniInPkt = off
			Set Node9_MAC8023_PORT_5.NumUniOutPkt = off
			Set Node9_MAC8023_PORT_5.NumUniInOutPkt = off
			Set Node9_MAC8023_PORT_5.NumBroInPkt = off
			Set Node9_MAC8023_PORT_5.NumBroOutPkt = off
			Set Node9_MAC8023_PORT_5.NumBroInOutPkt = off
			Set Node9_MAC8023_PORT_5.NumDrop = off
			Set Node9_MAC8023_PORT_5.InThrput = off
			Set Node9_MAC8023_PORT_5.OutThrput = off
			Set Node9_MAC8023_PORT_5.InOutThrput = off
			Set Node9_MAC8023_PORT_5.UniInLogFile = topo1.8023_N9_P5_UniIn.log
			Set Node9_MAC8023_PORT_5.UniOutLogFile = topo1.8023_N9_P5_UniOut.log
			Set Node9_MAC8023_PORT_5.UniInOutLogFile = topo1.8023_N9_P5_UniInOut.log
			Set Node9_MAC8023_PORT_5.BroInLogFile = topo1.8023_N9_P5_BroIn.log
			Set Node9_MAC8023_PORT_5.BroOutLogFile = topo1.8023_N9_P5_BroOut.log
			Set Node9_MAC8023_PORT_5.BroInOutLogFile = topo1.8023_N9_P5_BroInOut.log
			Set Node9_MAC8023_PORT_5.CollLogFile = topo1.8023_N9_P5_Coll.log
			Set Node9_MAC8023_PORT_5.DropLogFile = topo1.8023_N9_P5_Drop.log
			Set Node9_MAC8023_PORT_5.InThrputLogFile = topo1.8023_N9_P5_InThrput.log
			Set Node9_MAC8023_PORT_5.OutThrputLogFile = topo1.8023_N9_P5_OutThrput.log
			Set Node9_MAC8023_PORT_5.InOutThrputLogFile = topo1.8023_N9_P5_InOutThrput.log
			Set Node9_MAC8023_PORT_5.LinktoHub = 0

		Module Phy : Node9_Phy_PORT_5
			Set Node9_Phy_PORT_5.Bw = 10
			Set Node9_Phy_PORT_5.BER = 0.0
			Set Node9_Phy_PORT_5.PropDelay = 1
			Set Node9_Phy_PORT_5.linkfail = off
			Set Node9_Phy_PORT_5.linkfailFileName = topo1.phy_N9_P5.linkfail

		Module Link : Node9_PORT_5
			Set Node9_PORT_5.guitag_remotenode = yes


		Bind Node9_MAC8023_PORT_5 Node9_Phy_PORT_5
		Bind Node9_Phy_PORT_5 Node9_PORT_5
	EndDefine

	Define port 6
		Module MAC8023 : Node9_MAC8023_PORT_6

			Set Node9_OFSwitch_0.port6 = Node9_MAC8023_PORT_6
			Set Node9_OFSwitch_0.fixed_net6 = Node9_MAC8023_PORT_6.no
			Set Node9_MAC8023_PORT_6.recvtarget = Node9_OFSwitch_0

			Set Node9_MAC8023_PORT_6.mac = 0:1:0:0:0:2f
			Set Node9_MAC8023_PORT_6.lock_mac = off
			Set Node9_MAC8023_PORT_6.PromisOpt = on
			Set Node9_MAC8023_PORT_6.mode = full
			Set Node9_MAC8023_PORT_6.log = off
			Set Node9_MAC8023_PORT_6.logInterval = 1
			Set Node9_MAC8023_PORT_6.NumCollision = off
			Set Node9_MAC8023_PORT_6.NumUniInPkt = off
			Set Node9_MAC8023_PORT_6.NumUniOutPkt = off
			Set Node9_MAC8023_PORT_6.NumUniInOutPkt = off
			Set Node9_MAC8023_PORT_6.NumBroInPkt = off
			Set Node9_MAC8023_PORT_6.NumBroOutPkt = off
			Set Node9_MAC8023_PORT_6.NumBroInOutPkt = off
			Set Node9_MAC8023_PORT_6.NumDrop = off
			Set Node9_MAC8023_PORT_6.InThrput = off
			Set Node9_MAC8023_PORT_6.OutThrput = off
			Set Node9_MAC8023_PORT_6.InOutThrput = off
			Set Node9_MAC8023_PORT_6.UniInLogFile = topo1.8023_N9_P6_UniIn.log
			Set Node9_MAC8023_PORT_6.UniOutLogFile = topo1.8023_N9_P6_UniOut.log
			Set Node9_MAC8023_PORT_6.UniInOutLogFile = topo1.8023_N9_P6_UniInOut.log
			Set Node9_MAC8023_PORT_6.BroInLogFile = topo1.8023_N9_P6_BroIn.log
			Set Node9_MAC8023_PORT_6.BroOutLogFile = topo1.8023_N9_P6_BroOut.log
			Set Node9_MAC8023_PORT_6.BroInOutLogFile = topo1.8023_N9_P6_BroInOut.log
			Set Node9_MAC8023_PORT_6.CollLogFile = topo1.8023_N9_P6_Coll.log
			Set Node9_MAC8023_PORT_6.DropLogFile = topo1.8023_N9_P6_Drop.log
			Set Node9_MAC8023_PORT_6.InThrputLogFile = topo1.8023_N9_P6_InThrput.log
			Set Node9_MAC8023_PORT_6.OutThrputLogFile = topo1.8023_N9_P6_OutThrput.log
			Set Node9_MAC8023_PORT_6.InOutThrputLogFile = topo1.8023_N9_P6_InOutThrput.log
			Set Node9_MAC8023_PORT_6.LinktoHub = 0

		Module Phy : Node9_Phy_PORT_6
			Set Node9_Phy_PORT_6.Bw = 10
			Set Node9_Phy_PORT_6.BER = 0.0
			Set Node9_Phy_PORT_6.PropDelay = 1
			Set Node9_Phy_PORT_6.linkfail = off
			Set Node9_Phy_PORT_6.linkfailFileName = topo1.phy_N9_P6.linkfail

		Module Link : Node9_PORT_6
			Set Node9_PORT_6.guitag_remotenode = yes


		Bind Node9_MAC8023_PORT_6 Node9_Phy_PORT_6
		Bind Node9_Phy_PORT_6 Node9_PORT_6
	EndDefine

	Define port 7
		Module MAC8023 : Node9_MAC8023_PORT_7

			Set Node9_OFSwitch_0.port7 = Node9_MAC8023_PORT_7
			Set Node9_OFSwitch_0.fixed_net7 = Node9_MAC8023_PORT_7.no
			Set Node9_MAC8023_PORT_7.recvtarget = Node9_OFSwitch_0

			Set Node9_MAC8023_PORT_7.mac = 0:1:0:0:0:30
			Set Node9_MAC8023_PORT_7.lock_mac = off
			Set Node9_MAC8023_PORT_7.PromisOpt = on
			Set Node9_MAC8023_PORT_7.mode = full
			Set Node9_MAC8023_PORT_7.log = off
			Set Node9_MAC8023_PORT_7.logInterval = 1
			Set Node9_MAC8023_PORT_7.NumCollision = off
			Set Node9_MAC8023_PORT_7.NumUniInPkt = off
			Set Node9_MAC8023_PORT_7.NumUniOutPkt = off
			Set Node9_MAC8023_PORT_7.NumUniInOutPkt = off
			Set Node9_MAC8023_PORT_7.NumBroInPkt = off
			Set Node9_MAC8023_PORT_7.NumBroOutPkt = off
			Set Node9_MAC8023_PORT_7.NumBroInOutPkt = off
			Set Node9_MAC8023_PORT_7.NumDrop = off
			Set Node9_MAC8023_PORT_7.InThrput = off
			Set Node9_MAC8023_PORT_7.OutThrput = off
			Set Node9_MAC8023_PORT_7.InOutThrput = off
			Set Node9_MAC8023_PORT_7.UniInLogFile = topo1.8023_N9_P7_UniIn.log
			Set Node9_MAC8023_PORT_7.UniOutLogFile = topo1.8023_N9_P7_UniOut.log
			Set Node9_MAC8023_PORT_7.UniInOutLogFile = topo1.8023_N9_P7_UniInOut.log
			Set Node9_MAC8023_PORT_7.BroInLogFile = topo1.8023_N9_P7_BroIn.log
			Set Node9_MAC8023_PORT_7.BroOutLogFile = topo1.8023_N9_P7_BroOut.log
			Set Node9_MAC8023_PORT_7.BroInOutLogFile = topo1.8023_N9_P7_BroInOut.log
			Set Node9_MAC8023_PORT_7.CollLogFile = topo1.8023_N9_P7_Coll.log
			Set Node9_MAC8023_PORT_7.DropLogFile = topo1.8023_N9_P7_Drop.log
			Set Node9_MAC8023_PORT_7.InThrputLogFile = topo1.8023_N9_P7_InThrput.log
			Set Node9_MAC8023_PORT_7.OutThrputLogFile = topo1.8023_N9_P7_OutThrput.log
			Set Node9_MAC8023_PORT_7.InOutThrputLogFile = topo1.8023_N9_P7_InOutThrput.log
			Set Node9_MAC8023_PORT_7.LinktoHub = 0

		Module Phy : Node9_Phy_PORT_7
			Set Node9_Phy_PORT_7.Bw = 10
			Set Node9_Phy_PORT_7.BER = 0.0
			Set Node9_Phy_PORT_7.PropDelay = 1
			Set Node9_Phy_PORT_7.linkfail = off
			Set Node9_Phy_PORT_7.linkfailFileName = topo1.phy_N9_P7.linkfail

		Module Link : Node9_PORT_7
			Set Node9_PORT_7.guitag_remotenode = yes


		Bind Node9_MAC8023_PORT_7 Node9_Phy_PORT_7
		Bind Node9_Phy_PORT_7 Node9_PORT_7
	EndDefine

	Define port 8
		Module MAC8023 : Node9_MAC8023_PORT_8

			Set Node9_OFSwitch_0.port8 = Node9_MAC8023_PORT_8
			Set Node9_OFSwitch_0.fixed_net8 = Node9_MAC8023_PORT_8.no
			Set Node9_MAC8023_PORT_8.recvtarget = Node9_OFSwitch_0

			Set Node9_MAC8023_PORT_8.mac = 0:1:0:0:0:31
			Set Node9_MAC8023_PORT_8.lock_mac = off
			Set Node9_MAC8023_PORT_8.PromisOpt = on
			Set Node9_MAC8023_PORT_8.mode = full
			Set Node9_MAC8023_PORT_8.log = off
			Set Node9_MAC8023_PORT_8.logInterval = 1
			Set Node9_MAC8023_PORT_8.NumCollision = off
			Set Node9_MAC8023_PORT_8.NumUniInPkt = off
			Set Node9_MAC8023_PORT_8.NumUniOutPkt = off
			Set Node9_MAC8023_PORT_8.NumUniInOutPkt = off
			Set Node9_MAC8023_PORT_8.NumBroInPkt = off
			Set Node9_MAC8023_PORT_8.NumBroOutPkt = off
			Set Node9_MAC8023_PORT_8.NumBroInOutPkt = off
			Set Node9_MAC8023_PORT_8.NumDrop = off
			Set Node9_MAC8023_PORT_8.InThrput = off
			Set Node9_MAC8023_PORT_8.OutThrput = off
			Set Node9_MAC8023_PORT_8.InOutThrput = off
			Set Node9_MAC8023_PORT_8.UniInLogFile = topo1.8023_N9_P8_UniIn.log
			Set Node9_MAC8023_PORT_8.UniOutLogFile = topo1.8023_N9_P8_UniOut.log
			Set Node9_MAC8023_PORT_8.UniInOutLogFile = topo1.8023_N9_P8_UniInOut.log
			Set Node9_MAC8023_PORT_8.BroInLogFile = topo1.8023_N9_P8_BroIn.log
			Set Node9_MAC8023_PORT_8.BroOutLogFile = topo1.8023_N9_P8_BroOut.log
			Set Node9_MAC8023_PORT_8.BroInOutLogFile = topo1.8023_N9_P8_BroInOut.log
			Set Node9_MAC8023_PORT_8.CollLogFile = topo1.8023_N9_P8_Coll.log
			Set Node9_MAC8023_PORT_8.DropLogFile = topo1.8023_N9_P8_Drop.log
			Set Node9_MAC8023_PORT_8.InThrputLogFile = topo1.8023_N9_P8_InThrput.log
			Set Node9_MAC8023_PORT_8.OutThrputLogFile = topo1.8023_N9_P8_OutThrput.log
			Set Node9_MAC8023_PORT_8.InOutThrputLogFile = topo1.8023_N9_P8_InOutThrput.log
			Set Node9_MAC8023_PORT_8.LinktoHub = 0

		Module Phy : Node9_Phy_PORT_8
			Set Node9_Phy_PORT_8.Bw = 10
			Set Node9_Phy_PORT_8.BER = 0.0
			Set Node9_Phy_PORT_8.PropDelay = 1
			Set Node9_Phy_PORT_8.linkfail = off
			Set Node9_Phy_PORT_8.linkfailFileName = topo1.phy_N9_P8.linkfail

		Module Link : Node9_PORT_8
			Set Node9_PORT_8.guitag_remotenode = yes


		Bind Node9_MAC8023_PORT_8 Node9_Phy_PORT_8
		Bind Node9_Phy_PORT_8 Node9_PORT_8
	EndDefine

	Define port 9
		Module MAC8023 : Node9_MAC8023_PORT_9

			Set Node9_OFSwitch_0.port9 = Node9_MAC8023_PORT_9
			Set Node9_OFSwitch_0.fixed_net9 = Node9_MAC8023_PORT_9.no
			Set Node9_MAC8023_PORT_9.recvtarget = Node9_OFSwitch_0

			Set Node9_MAC8023_PORT_9.mac = 0:1:0:0:0:32
			Set Node9_MAC8023_PORT_9.lock_mac = off
			Set Node9_MAC8023_PORT_9.PromisOpt = on
			Set Node9_MAC8023_PORT_9.mode = full
			Set Node9_MAC8023_PORT_9.log = off
			Set Node9_MAC8023_PORT_9.logInterval = 1
			Set Node9_MAC8023_PORT_9.NumCollision = off
			Set Node9_MAC8023_PORT_9.NumUniInPkt = off
			Set Node9_MAC8023_PORT_9.NumUniOutPkt = off
			Set Node9_MAC8023_PORT_9.NumUniInOutPkt = off
			Set Node9_MAC8023_PORT_9.NumBroInPkt = off
			Set Node9_MAC8023_PORT_9.NumBroOutPkt = off
			Set Node9_MAC8023_PORT_9.NumBroInOutPkt = off
			Set Node9_MAC8023_PORT_9.NumDrop = off
			Set Node9_MAC8023_PORT_9.InThrput = off
			Set Node9_MAC8023_PORT_9.OutThrput = off
			Set Node9_MAC8023_PORT_9.InOutThrput = off
			Set Node9_MAC8023_PORT_9.UniInLogFile = topo1.8023_N9_P9_UniIn.log
			Set Node9_MAC8023_PORT_9.UniOutLogFile = topo1.8023_N9_P9_UniOut.log
			Set Node9_MAC8023_PORT_9.UniInOutLogFile = topo1.8023_N9_P9_UniInOut.log
			Set Node9_MAC8023_PORT_9.BroInLogFile = topo1.8023_N9_P9_BroIn.log
			Set Node9_MAC8023_PORT_9.BroOutLogFile = topo1.8023_N9_P9_BroOut.log
			Set Node9_MAC8023_PORT_9.BroInOutLogFile = topo1.8023_N9_P9_BroInOut.log
			Set Node9_MAC8023_PORT_9.CollLogFile = topo1.8023_N9_P9_Coll.log
			Set Node9_MAC8023_PORT_9.DropLogFile = topo1.8023_N9_P9_Drop.log
			Set Node9_MAC8023_PORT_9.InThrputLogFile = topo1.8023_N9_P9_InThrput.log
			Set Node9_MAC8023_PORT_9.OutThrputLogFile = topo1.8023_N9_P9_OutThrput.log
			Set Node9_MAC8023_PORT_9.InOutThrputLogFile = topo1.8023_N9_P9_InOutThrput.log
			Set Node9_MAC8023_PORT_9.LinktoHub = 0

		Module Phy : Node9_Phy_PORT_9
			Set Node9_Phy_PORT_9.Bw = 10
			Set Node9_Phy_PORT_9.BER = 0.0
			Set Node9_Phy_PORT_9.PropDelay = 1
			Set Node9_Phy_PORT_9.linkfail = off
			Set Node9_Phy_PORT_9.linkfailFileName = topo1.phy_N9_P9.linkfail

		Module Link : Node9_PORT_9
			Set Node9_PORT_9.guitag_remotenode = yes


		Bind Node9_MAC8023_PORT_9 Node9_Phy_PORT_9
		Bind Node9_Phy_PORT_9 Node9_PORT_9
	EndDefine

	Define port 10
		Module MAC8023 : Node9_MAC8023_PORT_10

			Set Node9_OFSwitch_0.port10 = Node9_MAC8023_PORT_10
			Set Node9_OFSwitch_0.fixed_net10 = Node9_MAC8023_PORT_10.no
			Set Node9_MAC8023_PORT_10.recvtarget = Node9_OFSwitch_0

			Set Node9_MAC8023_PORT_10.mac = 0:1:0:0:0:33
			Set Node9_MAC8023_PORT_10.lock_mac = off
			Set Node9_MAC8023_PORT_10.PromisOpt = on
			Set Node9_MAC8023_PORT_10.mode = full
			Set Node9_MAC8023_PORT_10.log = off
			Set Node9_MAC8023_PORT_10.logInterval = 1
			Set Node9_MAC8023_PORT_10.NumCollision = off
			Set Node9_MAC8023_PORT_10.NumUniInPkt = off
			Set Node9_MAC8023_PORT_10.NumUniOutPkt = off
			Set Node9_MAC8023_PORT_10.NumUniInOutPkt = off
			Set Node9_MAC8023_PORT_10.NumBroInPkt = off
			Set Node9_MAC8023_PORT_10.NumBroOutPkt = off
			Set Node9_MAC8023_PORT_10.NumBroInOutPkt = off
			Set Node9_MAC8023_PORT_10.NumDrop = off
			Set Node9_MAC8023_PORT_10.InThrput = off
			Set Node9_MAC8023_PORT_10.OutThrput = off
			Set Node9_MAC8023_PORT_10.InOutThrput = off
			Set Node9_MAC8023_PORT_10.UniInLogFile = topo1.8023_N9_P10_UniIn.log
			Set Node9_MAC8023_PORT_10.UniOutLogFile = topo1.8023_N9_P10_UniOut.log
			Set Node9_MAC8023_PORT_10.UniInOutLogFile = topo1.8023_N9_P10_UniInOut.log
			Set Node9_MAC8023_PORT_10.BroInLogFile = topo1.8023_N9_P10_BroIn.log
			Set Node9_MAC8023_PORT_10.BroOutLogFile = topo1.8023_N9_P10_BroOut.log
			Set Node9_MAC8023_PORT_10.BroInOutLogFile = topo1.8023_N9_P10_BroInOut.log
			Set Node9_MAC8023_PORT_10.CollLogFile = topo1.8023_N9_P10_Coll.log
			Set Node9_MAC8023_PORT_10.DropLogFile = topo1.8023_N9_P10_Drop.log
			Set Node9_MAC8023_PORT_10.InThrputLogFile = topo1.8023_N9_P10_InThrput.log
			Set Node9_MAC8023_PORT_10.OutThrputLogFile = topo1.8023_N9_P10_OutThrput.log
			Set Node9_MAC8023_PORT_10.InOutThrputLogFile = topo1.8023_N9_P10_InOutThrput.log
			Set Node9_MAC8023_PORT_10.LinktoHub = 0

		Module Phy : Node9_Phy_PORT_10
			Set Node9_Phy_PORT_10.Bw = 10
			Set Node9_Phy_PORT_10.BER = 0.0
			Set Node9_Phy_PORT_10.PropDelay = 1
			Set Node9_Phy_PORT_10.linkfail = off
			Set Node9_Phy_PORT_10.linkfailFileName = topo1.phy_N9_P10.linkfail

		Module Link : Node9_PORT_10
			Set Node9_PORT_10.guitag_remotenode = yes


		Bind Node9_MAC8023_PORT_10 Node9_Phy_PORT_10
		Bind Node9_Phy_PORT_10 Node9_PORT_10
	EndDefine

	Define port 11
		Module MAC8023 : Node9_MAC8023_PORT_11

			Set Node9_OFSwitch_0.port11 = Node9_MAC8023_PORT_11
			Set Node9_OFSwitch_0.fixed_net11 = Node9_MAC8023_PORT_11.no
			Set Node9_MAC8023_PORT_11.recvtarget = Node9_OFSwitch_0

			Set Node9_MAC8023_PORT_11.mac = 0:1:0:0:0:34
			Set Node9_MAC8023_PORT_11.lock_mac = off
			Set Node9_MAC8023_PORT_11.PromisOpt = on
			Set Node9_MAC8023_PORT_11.mode = full
			Set Node9_MAC8023_PORT_11.log = off
			Set Node9_MAC8023_PORT_11.logInterval = 1
			Set Node9_MAC8023_PORT_11.NumCollision = off
			Set Node9_MAC8023_PORT_11.NumUniInPkt = off
			Set Node9_MAC8023_PORT_11.NumUniOutPkt = off
			Set Node9_MAC8023_PORT_11.NumUniInOutPkt = off
			Set Node9_MAC8023_PORT_11.NumBroInPkt = off
			Set Node9_MAC8023_PORT_11.NumBroOutPkt = off
			Set Node9_MAC8023_PORT_11.NumBroInOutPkt = off
			Set Node9_MAC8023_PORT_11.NumDrop = off
			Set Node9_MAC8023_PORT_11.InThrput = off
			Set Node9_MAC8023_PORT_11.OutThrput = off
			Set Node9_MAC8023_PORT_11.InOutThrput = off
			Set Node9_MAC8023_PORT_11.UniInLogFile = topo1.8023_N9_P11_UniIn.log
			Set Node9_MAC8023_PORT_11.UniOutLogFile = topo1.8023_N9_P11_UniOut.log
			Set Node9_MAC8023_PORT_11.UniInOutLogFile = topo1.8023_N9_P11_UniInOut.log
			Set Node9_MAC8023_PORT_11.BroInLogFile = topo1.8023_N9_P11_BroIn.log
			Set Node9_MAC8023_PORT_11.BroOutLogFile = topo1.8023_N9_P11_BroOut.log
			Set Node9_MAC8023_PORT_11.BroInOutLogFile = topo1.8023_N9_P11_BroInOut.log
			Set Node9_MAC8023_PORT_11.CollLogFile = topo1.8023_N9_P11_Coll.log
			Set Node9_MAC8023_PORT_11.DropLogFile = topo1.8023_N9_P11_Drop.log
			Set Node9_MAC8023_PORT_11.InThrputLogFile = topo1.8023_N9_P11_InThrput.log
			Set Node9_MAC8023_PORT_11.OutThrputLogFile = topo1.8023_N9_P11_OutThrput.log
			Set Node9_MAC8023_PORT_11.InOutThrputLogFile = topo1.8023_N9_P11_InOutThrput.log
			Set Node9_MAC8023_PORT_11.LinktoHub = 0

		Module Phy : Node9_Phy_PORT_11
			Set Node9_Phy_PORT_11.Bw = 10
			Set Node9_Phy_PORT_11.BER = 0.0
			Set Node9_Phy_PORT_11.PropDelay = 1
			Set Node9_Phy_PORT_11.linkfail = off
			Set Node9_Phy_PORT_11.linkfailFileName = topo1.phy_N9_P11.linkfail

		Module Link : Node9_PORT_11
			Set Node9_PORT_11.guitag_remotenode = yes


		Bind Node9_MAC8023_PORT_11 Node9_Phy_PORT_11
		Bind Node9_Phy_PORT_11 Node9_PORT_11
	EndDefine

	Define port 12
		Module MAC8023 : Node9_MAC8023_PORT_12

			Set Node9_OFSwitch_0.port12 = Node9_MAC8023_PORT_12
			Set Node9_OFSwitch_0.fixed_net12 = Node9_MAC8023_PORT_12.no
			Set Node9_MAC8023_PORT_12.recvtarget = Node9_OFSwitch_0

			Set Node9_MAC8023_PORT_12.mac = 0:1:0:0:0:35
			Set Node9_MAC8023_PORT_12.lock_mac = off
			Set Node9_MAC8023_PORT_12.PromisOpt = on
			Set Node9_MAC8023_PORT_12.mode = full
			Set Node9_MAC8023_PORT_12.log = off
			Set Node9_MAC8023_PORT_12.logInterval = 1
			Set Node9_MAC8023_PORT_12.NumCollision = off
			Set Node9_MAC8023_PORT_12.NumUniInPkt = off
			Set Node9_MAC8023_PORT_12.NumUniOutPkt = off
			Set Node9_MAC8023_PORT_12.NumUniInOutPkt = off
			Set Node9_MAC8023_PORT_12.NumBroInPkt = off
			Set Node9_MAC8023_PORT_12.NumBroOutPkt = off
			Set Node9_MAC8023_PORT_12.NumBroInOutPkt = off
			Set Node9_MAC8023_PORT_12.NumDrop = off
			Set Node9_MAC8023_PORT_12.InThrput = off
			Set Node9_MAC8023_PORT_12.OutThrput = off
			Set Node9_MAC8023_PORT_12.InOutThrput = off
			Set Node9_MAC8023_PORT_12.UniInLogFile = topo1.8023_N9_P12_UniIn.log
			Set Node9_MAC8023_PORT_12.UniOutLogFile = topo1.8023_N9_P12_UniOut.log
			Set Node9_MAC8023_PORT_12.UniInOutLogFile = topo1.8023_N9_P12_UniInOut.log
			Set Node9_MAC8023_PORT_12.BroInLogFile = topo1.8023_N9_P12_BroIn.log
			Set Node9_MAC8023_PORT_12.BroOutLogFile = topo1.8023_N9_P12_BroOut.log
			Set Node9_MAC8023_PORT_12.BroInOutLogFile = topo1.8023_N9_P12_BroInOut.log
			Set Node9_MAC8023_PORT_12.CollLogFile = topo1.8023_N9_P12_Coll.log
			Set Node9_MAC8023_PORT_12.DropLogFile = topo1.8023_N9_P12_Drop.log
			Set Node9_MAC8023_PORT_12.InThrputLogFile = topo1.8023_N9_P12_InThrput.log
			Set Node9_MAC8023_PORT_12.OutThrputLogFile = topo1.8023_N9_P12_OutThrput.log
			Set Node9_MAC8023_PORT_12.InOutThrputLogFile = topo1.8023_N9_P12_InOutThrput.log
			Set Node9_MAC8023_PORT_12.LinktoHub = 0

		Module Phy : Node9_Phy_PORT_12
			Set Node9_Phy_PORT_12.Bw = 10
			Set Node9_Phy_PORT_12.BER = 0.0
			Set Node9_Phy_PORT_12.PropDelay = 1
			Set Node9_Phy_PORT_12.linkfail = off
			Set Node9_Phy_PORT_12.linkfailFileName = topo1.phy_N9_P12.linkfail

		Module Link : Node9_PORT_12
			Set Node9_PORT_12.guitag_remotenode = yes


		Bind Node9_MAC8023_PORT_12 Node9_Phy_PORT_12
		Bind Node9_Phy_PORT_12 Node9_PORT_12
	EndDefine

EndCreate

Create Node 10 as OF_SW with name = OF_SW10
	Module OFSwitch : Node10_OFSwitch_0
		Set Node10_OFSwitch_0.guitag_addport = yes
		Set Node10_OFSwitch_0.flow_table_amount = 15
		Set Node10_OFSwitch_0.flow_table_entry_amount = 256
		Set Node10_OFSwitch_0.group_table_entry_amount = 256
		Set Node10_OFSwitch_0.table_miss_buffer_size = 1000
		Set Node10_OFSwitch_0.fifo_queue_size = 50
		Set Node10_OFSwitch_0.controller_ip = 1.0.1.1
	Define port 1
		Module MAC8023 : Node10_MAC8023_PORT_1

			Set Node10_OFSwitch_0.port1 = Node10_MAC8023_PORT_1
			Set Node10_OFSwitch_0.fixed_net1 = Node10_MAC8023_PORT_1.no
			Set Node10_MAC8023_PORT_1.recvtarget = Node10_OFSwitch_0

			Set Node10_MAC8023_PORT_1.mac = 0:1:0:0:0:36
			Set Node10_MAC8023_PORT_1.lock_mac = off
			Set Node10_MAC8023_PORT_1.PromisOpt = on
			Set Node10_MAC8023_PORT_1.mode = full
			Set Node10_MAC8023_PORT_1.log = off
			Set Node10_MAC8023_PORT_1.logInterval = 1
			Set Node10_MAC8023_PORT_1.NumCollision = off
			Set Node10_MAC8023_PORT_1.NumUniInPkt = off
			Set Node10_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node10_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node10_MAC8023_PORT_1.NumBroInPkt = off
			Set Node10_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node10_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node10_MAC8023_PORT_1.NumDrop = off
			Set Node10_MAC8023_PORT_1.InThrput = off
			Set Node10_MAC8023_PORT_1.OutThrput = off
			Set Node10_MAC8023_PORT_1.InOutThrput = off
			Set Node10_MAC8023_PORT_1.UniInLogFile = topo1.8023_N10_P1_UniIn.log
			Set Node10_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N10_P1_UniOut.log
			Set Node10_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N10_P1_UniInOut.log
			Set Node10_MAC8023_PORT_1.BroInLogFile = topo1.8023_N10_P1_BroIn.log
			Set Node10_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N10_P1_BroOut.log
			Set Node10_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N10_P1_BroInOut.log
			Set Node10_MAC8023_PORT_1.CollLogFile = topo1.8023_N10_P1_Coll.log
			Set Node10_MAC8023_PORT_1.DropLogFile = topo1.8023_N10_P1_Drop.log
			Set Node10_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N10_P1_InThrput.log
			Set Node10_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N10_P1_OutThrput.log
			Set Node10_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N10_P1_InOutThrput.log
			Set Node10_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node10_Phy_PORT_1
			Set Node10_Phy_PORT_1.Bw = 10
			Set Node10_Phy_PORT_1.BER = 0.0
			Set Node10_Phy_PORT_1.PropDelay = 1
			Set Node10_Phy_PORT_1.linkfail = off
			Set Node10_Phy_PORT_1.linkfailFileName = topo1.phy_N10_P1.linkfail

		Module Link : Node10_PORT_1
			Set Node10_PORT_1.guitag_remotenode = yes


		Bind Node10_MAC8023_PORT_1 Node10_Phy_PORT_1
		Bind Node10_Phy_PORT_1 Node10_PORT_1
	EndDefine

	Define port 2
		Module Interface : Node10_Interface_PORT_2

			Set Node10_OFSwitch_0.port2 = Node10_Interface_PORT_2
			Set Node10_OFSwitch_0.fixed_net2 = Node10_Interface_PORT_2.no
			Set Node10_Interface_PORT_2.recvtarget = Node10_OFSwitch_0

			Set Node10_Interface_PORT_2.ip = 1.0.1.6
			Set Node10_Interface_PORT_2.netmask = 255.255.255.0

		Module ARP : Node10_ARP_PORT_2
			Set Node10_ARP_PORT_2.arpMode = RunARP
			Set Node10_ARP_PORT_2.flushInterval = 3000
			Set Node10_ARP_PORT_2.ArpTableFileName = topo1.arp

		Module FIFO : Node10_FIFO_PORT_2
			Set Node10_FIFO_PORT_2.max_qlen = 50
			Set Node10_FIFO_PORT_2.log_qlen = off
			Set Node10_FIFO_PORT_2.log_option = FullLog
			Set Node10_FIFO_PORT_2.samplerate = 1
			Set Node10_FIFO_PORT_2.logFileName = topo1.fifo_N10_P2_qlen.log
			Set Node10_FIFO_PORT_2.log_drop = off
			Set Node10_FIFO_PORT_2.drop_samplerate = 1
			Set Node10_FIFO_PORT_2.droplogFileName = topo1.fifo_N10_P2_drop.log

		Module TCPDUMP : Node10_TCPDUMP_PORT_2

		Module MAC8023 : Node10_MAC8023_PORT_2
			Set Node10_MAC8023_PORT_2.mac = 0:1:0:0:0:37
			Set Node10_MAC8023_PORT_2.lock_mac = off
			Set Node10_MAC8023_PORT_2.PromisOpt = on
			Set Node10_MAC8023_PORT_2.mode = full
			Set Node10_MAC8023_PORT_2.log = off
			Set Node10_MAC8023_PORT_2.logInterval = 1
			Set Node10_MAC8023_PORT_2.NumCollision = off
			Set Node10_MAC8023_PORT_2.NumUniInPkt = off
			Set Node10_MAC8023_PORT_2.NumUniOutPkt = off
			Set Node10_MAC8023_PORT_2.NumUniInOutPkt = off
			Set Node10_MAC8023_PORT_2.NumBroInPkt = off
			Set Node10_MAC8023_PORT_2.NumBroOutPkt = off
			Set Node10_MAC8023_PORT_2.NumBroInOutPkt = off
			Set Node10_MAC8023_PORT_2.NumDrop = off
			Set Node10_MAC8023_PORT_2.InThrput = off
			Set Node10_MAC8023_PORT_2.OutThrput = off
			Set Node10_MAC8023_PORT_2.InOutThrput = off
			Set Node10_MAC8023_PORT_2.UniInLogFile = topo1.8023_N10_P2_UniIn.log
			Set Node10_MAC8023_PORT_2.UniOutLogFile = topo1.8023_N10_P2_UniOut.log
			Set Node10_MAC8023_PORT_2.UniInOutLogFile = topo1.8023_N10_P2_UniInOut.log
			Set Node10_MAC8023_PORT_2.BroInLogFile = topo1.8023_N10_P2_BroIn.log
			Set Node10_MAC8023_PORT_2.BroOutLogFile = topo1.8023_N10_P2_BroOut.log
			Set Node10_MAC8023_PORT_2.BroInOutLogFile = topo1.8023_N10_P2_BroInOut.log
			Set Node10_MAC8023_PORT_2.CollLogFile = topo1.8023_N10_P2_Coll.log
			Set Node10_MAC8023_PORT_2.DropLogFile = topo1.8023_N10_P2_Drop.log
			Set Node10_MAC8023_PORT_2.InThrputLogFile = topo1.8023_N10_P2_InThrput.log
			Set Node10_MAC8023_PORT_2.OutThrputLogFile = topo1.8023_N10_P2_OutThrput.log
			Set Node10_MAC8023_PORT_2.InOutThrputLogFile = topo1.8023_N10_P2_InOutThrput.log
			Set Node10_MAC8023_PORT_2.LinktoHub = 0

		Module Phy : Node10_Phy_PORT_2
			Set Node10_Phy_PORT_2.Bw = 10
			Set Node10_Phy_PORT_2.BER = 0.0
			Set Node10_Phy_PORT_2.PropDelay = 1
			Set Node10_Phy_PORT_2.linkfail = off
			Set Node10_Phy_PORT_2.linkfailFileName = topo1.phy_N10_P2.linkfail

		Module Link : Node10_PORT_2
			Set Node10_PORT_2.guitag_remotenode = yes


		Bind Node10_Interface_PORT_2 Node10_ARP_PORT_2
		Bind Node10_ARP_PORT_2 Node10_FIFO_PORT_2
		Bind Node10_FIFO_PORT_2 Node10_TCPDUMP_PORT_2
		Bind Node10_TCPDUMP_PORT_2 Node10_MAC8023_PORT_2
		Bind Node10_MAC8023_PORT_2 Node10_Phy_PORT_2
		Bind Node10_Phy_PORT_2 Node10_PORT_2
	EndDefine

	Define port 3
		Module MAC8023 : Node10_MAC8023_PORT_3

			Set Node10_OFSwitch_0.port3 = Node10_MAC8023_PORT_3
			Set Node10_OFSwitch_0.fixed_net3 = Node10_MAC8023_PORT_3.no
			Set Node10_MAC8023_PORT_3.recvtarget = Node10_OFSwitch_0

			Set Node10_MAC8023_PORT_3.mac = 0:1:0:0:0:38
			Set Node10_MAC8023_PORT_3.lock_mac = off
			Set Node10_MAC8023_PORT_3.PromisOpt = on
			Set Node10_MAC8023_PORT_3.mode = full
			Set Node10_MAC8023_PORT_3.log = off
			Set Node10_MAC8023_PORT_3.logInterval = 1
			Set Node10_MAC8023_PORT_3.NumCollision = off
			Set Node10_MAC8023_PORT_3.NumUniInPkt = off
			Set Node10_MAC8023_PORT_3.NumUniOutPkt = off
			Set Node10_MAC8023_PORT_3.NumUniInOutPkt = off
			Set Node10_MAC8023_PORT_3.NumBroInPkt = off
			Set Node10_MAC8023_PORT_3.NumBroOutPkt = off
			Set Node10_MAC8023_PORT_3.NumBroInOutPkt = off
			Set Node10_MAC8023_PORT_3.NumDrop = off
			Set Node10_MAC8023_PORT_3.InThrput = off
			Set Node10_MAC8023_PORT_3.OutThrput = off
			Set Node10_MAC8023_PORT_3.InOutThrput = off
			Set Node10_MAC8023_PORT_3.UniInLogFile = topo1.8023_N10_P3_UniIn.log
			Set Node10_MAC8023_PORT_3.UniOutLogFile = topo1.8023_N10_P3_UniOut.log
			Set Node10_MAC8023_PORT_3.UniInOutLogFile = topo1.8023_N10_P3_UniInOut.log
			Set Node10_MAC8023_PORT_3.BroInLogFile = topo1.8023_N10_P3_BroIn.log
			Set Node10_MAC8023_PORT_3.BroOutLogFile = topo1.8023_N10_P3_BroOut.log
			Set Node10_MAC8023_PORT_3.BroInOutLogFile = topo1.8023_N10_P3_BroInOut.log
			Set Node10_MAC8023_PORT_3.CollLogFile = topo1.8023_N10_P3_Coll.log
			Set Node10_MAC8023_PORT_3.DropLogFile = topo1.8023_N10_P3_Drop.log
			Set Node10_MAC8023_PORT_3.InThrputLogFile = topo1.8023_N10_P3_InThrput.log
			Set Node10_MAC8023_PORT_3.OutThrputLogFile = topo1.8023_N10_P3_OutThrput.log
			Set Node10_MAC8023_PORT_3.InOutThrputLogFile = topo1.8023_N10_P3_InOutThrput.log
			Set Node10_MAC8023_PORT_3.LinktoHub = 0

		Module Phy : Node10_Phy_PORT_3
			Set Node10_Phy_PORT_3.Bw = 10
			Set Node10_Phy_PORT_3.BER = 0.0
			Set Node10_Phy_PORT_3.PropDelay = 1
			Set Node10_Phy_PORT_3.linkfail = off
			Set Node10_Phy_PORT_3.linkfailFileName = topo1.phy_N10_P3.linkfail

		Module Link : Node10_PORT_3
			Set Node10_PORT_3.guitag_remotenode = yes


		Bind Node10_MAC8023_PORT_3 Node10_Phy_PORT_3
		Bind Node10_Phy_PORT_3 Node10_PORT_3
	EndDefine

	Define port 4
		Module MAC8023 : Node10_MAC8023_PORT_4

			Set Node10_OFSwitch_0.port4 = Node10_MAC8023_PORT_4
			Set Node10_OFSwitch_0.fixed_net4 = Node10_MAC8023_PORT_4.no
			Set Node10_MAC8023_PORT_4.recvtarget = Node10_OFSwitch_0

			Set Node10_MAC8023_PORT_4.mac = 0:1:0:0:0:39
			Set Node10_MAC8023_PORT_4.lock_mac = off
			Set Node10_MAC8023_PORT_4.PromisOpt = on
			Set Node10_MAC8023_PORT_4.mode = full
			Set Node10_MAC8023_PORT_4.log = off
			Set Node10_MAC8023_PORT_4.logInterval = 1
			Set Node10_MAC8023_PORT_4.NumCollision = off
			Set Node10_MAC8023_PORT_4.NumUniInPkt = off
			Set Node10_MAC8023_PORT_4.NumUniOutPkt = off
			Set Node10_MAC8023_PORT_4.NumUniInOutPkt = off
			Set Node10_MAC8023_PORT_4.NumBroInPkt = off
			Set Node10_MAC8023_PORT_4.NumBroOutPkt = off
			Set Node10_MAC8023_PORT_4.NumBroInOutPkt = off
			Set Node10_MAC8023_PORT_4.NumDrop = off
			Set Node10_MAC8023_PORT_4.InThrput = off
			Set Node10_MAC8023_PORT_4.OutThrput = off
			Set Node10_MAC8023_PORT_4.InOutThrput = off
			Set Node10_MAC8023_PORT_4.UniInLogFile = topo1.8023_N10_P4_UniIn.log
			Set Node10_MAC8023_PORT_4.UniOutLogFile = topo1.8023_N10_P4_UniOut.log
			Set Node10_MAC8023_PORT_4.UniInOutLogFile = topo1.8023_N10_P4_UniInOut.log
			Set Node10_MAC8023_PORT_4.BroInLogFile = topo1.8023_N10_P4_BroIn.log
			Set Node10_MAC8023_PORT_4.BroOutLogFile = topo1.8023_N10_P4_BroOut.log
			Set Node10_MAC8023_PORT_4.BroInOutLogFile = topo1.8023_N10_P4_BroInOut.log
			Set Node10_MAC8023_PORT_4.CollLogFile = topo1.8023_N10_P4_Coll.log
			Set Node10_MAC8023_PORT_4.DropLogFile = topo1.8023_N10_P4_Drop.log
			Set Node10_MAC8023_PORT_4.InThrputLogFile = topo1.8023_N10_P4_InThrput.log
			Set Node10_MAC8023_PORT_4.OutThrputLogFile = topo1.8023_N10_P4_OutThrput.log
			Set Node10_MAC8023_PORT_4.InOutThrputLogFile = topo1.8023_N10_P4_InOutThrput.log
			Set Node10_MAC8023_PORT_4.LinktoHub = 0

		Module Phy : Node10_Phy_PORT_4
			Set Node10_Phy_PORT_4.Bw = 10
			Set Node10_Phy_PORT_4.BER = 0.0
			Set Node10_Phy_PORT_4.PropDelay = 1
			Set Node10_Phy_PORT_4.linkfail = off
			Set Node10_Phy_PORT_4.linkfailFileName = topo1.phy_N10_P4.linkfail

		Module Link : Node10_PORT_4
			Set Node10_PORT_4.guitag_remotenode = yes


		Bind Node10_MAC8023_PORT_4 Node10_Phy_PORT_4
		Bind Node10_Phy_PORT_4 Node10_PORT_4
	EndDefine

	Define port 5
		Module MAC8023 : Node10_MAC8023_PORT_5

			Set Node10_OFSwitch_0.port5 = Node10_MAC8023_PORT_5
			Set Node10_OFSwitch_0.fixed_net5 = Node10_MAC8023_PORT_5.no
			Set Node10_MAC8023_PORT_5.recvtarget = Node10_OFSwitch_0

			Set Node10_MAC8023_PORT_5.mac = 0:1:0:0:0:3a
			Set Node10_MAC8023_PORT_5.lock_mac = off
			Set Node10_MAC8023_PORT_5.PromisOpt = on
			Set Node10_MAC8023_PORT_5.mode = full
			Set Node10_MAC8023_PORT_5.log = off
			Set Node10_MAC8023_PORT_5.logInterval = 1
			Set Node10_MAC8023_PORT_5.NumCollision = off
			Set Node10_MAC8023_PORT_5.NumUniInPkt = off
			Set Node10_MAC8023_PORT_5.NumUniOutPkt = off
			Set Node10_MAC8023_PORT_5.NumUniInOutPkt = off
			Set Node10_MAC8023_PORT_5.NumBroInPkt = off
			Set Node10_MAC8023_PORT_5.NumBroOutPkt = off
			Set Node10_MAC8023_PORT_5.NumBroInOutPkt = off
			Set Node10_MAC8023_PORT_5.NumDrop = off
			Set Node10_MAC8023_PORT_5.InThrput = off
			Set Node10_MAC8023_PORT_5.OutThrput = off
			Set Node10_MAC8023_PORT_5.InOutThrput = off
			Set Node10_MAC8023_PORT_5.UniInLogFile = topo1.8023_N10_P5_UniIn.log
			Set Node10_MAC8023_PORT_5.UniOutLogFile = topo1.8023_N10_P5_UniOut.log
			Set Node10_MAC8023_PORT_5.UniInOutLogFile = topo1.8023_N10_P5_UniInOut.log
			Set Node10_MAC8023_PORT_5.BroInLogFile = topo1.8023_N10_P5_BroIn.log
			Set Node10_MAC8023_PORT_5.BroOutLogFile = topo1.8023_N10_P5_BroOut.log
			Set Node10_MAC8023_PORT_5.BroInOutLogFile = topo1.8023_N10_P5_BroInOut.log
			Set Node10_MAC8023_PORT_5.CollLogFile = topo1.8023_N10_P5_Coll.log
			Set Node10_MAC8023_PORT_5.DropLogFile = topo1.8023_N10_P5_Drop.log
			Set Node10_MAC8023_PORT_5.InThrputLogFile = topo1.8023_N10_P5_InThrput.log
			Set Node10_MAC8023_PORT_5.OutThrputLogFile = topo1.8023_N10_P5_OutThrput.log
			Set Node10_MAC8023_PORT_5.InOutThrputLogFile = topo1.8023_N10_P5_InOutThrput.log
			Set Node10_MAC8023_PORT_5.LinktoHub = 0

		Module Phy : Node10_Phy_PORT_5
			Set Node10_Phy_PORT_5.Bw = 10
			Set Node10_Phy_PORT_5.BER = 0.0
			Set Node10_Phy_PORT_5.PropDelay = 1
			Set Node10_Phy_PORT_5.linkfail = off
			Set Node10_Phy_PORT_5.linkfailFileName = topo1.phy_N10_P5.linkfail

		Module Link : Node10_PORT_5
			Set Node10_PORT_5.guitag_remotenode = yes


		Bind Node10_MAC8023_PORT_5 Node10_Phy_PORT_5
		Bind Node10_Phy_PORT_5 Node10_PORT_5
	EndDefine

	Define port 6
		Module MAC8023 : Node10_MAC8023_PORT_6

			Set Node10_OFSwitch_0.port6 = Node10_MAC8023_PORT_6
			Set Node10_OFSwitch_0.fixed_net6 = Node10_MAC8023_PORT_6.no
			Set Node10_MAC8023_PORT_6.recvtarget = Node10_OFSwitch_0

			Set Node10_MAC8023_PORT_6.mac = 0:1:0:0:0:3b
			Set Node10_MAC8023_PORT_6.lock_mac = off
			Set Node10_MAC8023_PORT_6.PromisOpt = on
			Set Node10_MAC8023_PORT_6.mode = full
			Set Node10_MAC8023_PORT_6.log = off
			Set Node10_MAC8023_PORT_6.logInterval = 1
			Set Node10_MAC8023_PORT_6.NumCollision = off
			Set Node10_MAC8023_PORT_6.NumUniInPkt = off
			Set Node10_MAC8023_PORT_6.NumUniOutPkt = off
			Set Node10_MAC8023_PORT_6.NumUniInOutPkt = off
			Set Node10_MAC8023_PORT_6.NumBroInPkt = off
			Set Node10_MAC8023_PORT_6.NumBroOutPkt = off
			Set Node10_MAC8023_PORT_6.NumBroInOutPkt = off
			Set Node10_MAC8023_PORT_6.NumDrop = off
			Set Node10_MAC8023_PORT_6.InThrput = off
			Set Node10_MAC8023_PORT_6.OutThrput = off
			Set Node10_MAC8023_PORT_6.InOutThrput = off
			Set Node10_MAC8023_PORT_6.UniInLogFile = topo1.8023_N10_P6_UniIn.log
			Set Node10_MAC8023_PORT_6.UniOutLogFile = topo1.8023_N10_P6_UniOut.log
			Set Node10_MAC8023_PORT_6.UniInOutLogFile = topo1.8023_N10_P6_UniInOut.log
			Set Node10_MAC8023_PORT_6.BroInLogFile = topo1.8023_N10_P6_BroIn.log
			Set Node10_MAC8023_PORT_6.BroOutLogFile = topo1.8023_N10_P6_BroOut.log
			Set Node10_MAC8023_PORT_6.BroInOutLogFile = topo1.8023_N10_P6_BroInOut.log
			Set Node10_MAC8023_PORT_6.CollLogFile = topo1.8023_N10_P6_Coll.log
			Set Node10_MAC8023_PORT_6.DropLogFile = topo1.8023_N10_P6_Drop.log
			Set Node10_MAC8023_PORT_6.InThrputLogFile = topo1.8023_N10_P6_InThrput.log
			Set Node10_MAC8023_PORT_6.OutThrputLogFile = topo1.8023_N10_P6_OutThrput.log
			Set Node10_MAC8023_PORT_6.InOutThrputLogFile = topo1.8023_N10_P6_InOutThrput.log
			Set Node10_MAC8023_PORT_6.LinktoHub = 0

		Module Phy : Node10_Phy_PORT_6
			Set Node10_Phy_PORT_6.Bw = 10
			Set Node10_Phy_PORT_6.BER = 0.0
			Set Node10_Phy_PORT_6.PropDelay = 1
			Set Node10_Phy_PORT_6.linkfail = off
			Set Node10_Phy_PORT_6.linkfailFileName = topo1.phy_N10_P6.linkfail

		Module Link : Node10_PORT_6
			Set Node10_PORT_6.guitag_remotenode = yes


		Bind Node10_MAC8023_PORT_6 Node10_Phy_PORT_6
		Bind Node10_Phy_PORT_6 Node10_PORT_6
	EndDefine

	Define port 7
		Module MAC8023 : Node10_MAC8023_PORT_7

			Set Node10_OFSwitch_0.port7 = Node10_MAC8023_PORT_7
			Set Node10_OFSwitch_0.fixed_net7 = Node10_MAC8023_PORT_7.no
			Set Node10_MAC8023_PORT_7.recvtarget = Node10_OFSwitch_0

			Set Node10_MAC8023_PORT_7.mac = 0:1:0:0:0:3c
			Set Node10_MAC8023_PORT_7.lock_mac = off
			Set Node10_MAC8023_PORT_7.PromisOpt = on
			Set Node10_MAC8023_PORT_7.mode = full
			Set Node10_MAC8023_PORT_7.log = off
			Set Node10_MAC8023_PORT_7.logInterval = 1
			Set Node10_MAC8023_PORT_7.NumCollision = off
			Set Node10_MAC8023_PORT_7.NumUniInPkt = off
			Set Node10_MAC8023_PORT_7.NumUniOutPkt = off
			Set Node10_MAC8023_PORT_7.NumUniInOutPkt = off
			Set Node10_MAC8023_PORT_7.NumBroInPkt = off
			Set Node10_MAC8023_PORT_7.NumBroOutPkt = off
			Set Node10_MAC8023_PORT_7.NumBroInOutPkt = off
			Set Node10_MAC8023_PORT_7.NumDrop = off
			Set Node10_MAC8023_PORT_7.InThrput = off
			Set Node10_MAC8023_PORT_7.OutThrput = off
			Set Node10_MAC8023_PORT_7.InOutThrput = off
			Set Node10_MAC8023_PORT_7.UniInLogFile = topo1.8023_N10_P7_UniIn.log
			Set Node10_MAC8023_PORT_7.UniOutLogFile = topo1.8023_N10_P7_UniOut.log
			Set Node10_MAC8023_PORT_7.UniInOutLogFile = topo1.8023_N10_P7_UniInOut.log
			Set Node10_MAC8023_PORT_7.BroInLogFile = topo1.8023_N10_P7_BroIn.log
			Set Node10_MAC8023_PORT_7.BroOutLogFile = topo1.8023_N10_P7_BroOut.log
			Set Node10_MAC8023_PORT_7.BroInOutLogFile = topo1.8023_N10_P7_BroInOut.log
			Set Node10_MAC8023_PORT_7.CollLogFile = topo1.8023_N10_P7_Coll.log
			Set Node10_MAC8023_PORT_7.DropLogFile = topo1.8023_N10_P7_Drop.log
			Set Node10_MAC8023_PORT_7.InThrputLogFile = topo1.8023_N10_P7_InThrput.log
			Set Node10_MAC8023_PORT_7.OutThrputLogFile = topo1.8023_N10_P7_OutThrput.log
			Set Node10_MAC8023_PORT_7.InOutThrputLogFile = topo1.8023_N10_P7_InOutThrput.log
			Set Node10_MAC8023_PORT_7.LinktoHub = 0

		Module Phy : Node10_Phy_PORT_7
			Set Node10_Phy_PORT_7.Bw = 10
			Set Node10_Phy_PORT_7.BER = 0.0
			Set Node10_Phy_PORT_7.PropDelay = 1
			Set Node10_Phy_PORT_7.linkfail = off
			Set Node10_Phy_PORT_7.linkfailFileName = topo1.phy_N10_P7.linkfail

		Module Link : Node10_PORT_7
			Set Node10_PORT_7.guitag_remotenode = yes


		Bind Node10_MAC8023_PORT_7 Node10_Phy_PORT_7
		Bind Node10_Phy_PORT_7 Node10_PORT_7
	EndDefine

	Define port 8
		Module MAC8023 : Node10_MAC8023_PORT_8

			Set Node10_OFSwitch_0.port8 = Node10_MAC8023_PORT_8
			Set Node10_OFSwitch_0.fixed_net8 = Node10_MAC8023_PORT_8.no
			Set Node10_MAC8023_PORT_8.recvtarget = Node10_OFSwitch_0

			Set Node10_MAC8023_PORT_8.mac = 0:1:0:0:0:3d
			Set Node10_MAC8023_PORT_8.lock_mac = off
			Set Node10_MAC8023_PORT_8.PromisOpt = on
			Set Node10_MAC8023_PORT_8.mode = full
			Set Node10_MAC8023_PORT_8.log = off
			Set Node10_MAC8023_PORT_8.logInterval = 1
			Set Node10_MAC8023_PORT_8.NumCollision = off
			Set Node10_MAC8023_PORT_8.NumUniInPkt = off
			Set Node10_MAC8023_PORT_8.NumUniOutPkt = off
			Set Node10_MAC8023_PORT_8.NumUniInOutPkt = off
			Set Node10_MAC8023_PORT_8.NumBroInPkt = off
			Set Node10_MAC8023_PORT_8.NumBroOutPkt = off
			Set Node10_MAC8023_PORT_8.NumBroInOutPkt = off
			Set Node10_MAC8023_PORT_8.NumDrop = off
			Set Node10_MAC8023_PORT_8.InThrput = off
			Set Node10_MAC8023_PORT_8.OutThrput = off
			Set Node10_MAC8023_PORT_8.InOutThrput = off
			Set Node10_MAC8023_PORT_8.UniInLogFile = topo1.8023_N10_P8_UniIn.log
			Set Node10_MAC8023_PORT_8.UniOutLogFile = topo1.8023_N10_P8_UniOut.log
			Set Node10_MAC8023_PORT_8.UniInOutLogFile = topo1.8023_N10_P8_UniInOut.log
			Set Node10_MAC8023_PORT_8.BroInLogFile = topo1.8023_N10_P8_BroIn.log
			Set Node10_MAC8023_PORT_8.BroOutLogFile = topo1.8023_N10_P8_BroOut.log
			Set Node10_MAC8023_PORT_8.BroInOutLogFile = topo1.8023_N10_P8_BroInOut.log
			Set Node10_MAC8023_PORT_8.CollLogFile = topo1.8023_N10_P8_Coll.log
			Set Node10_MAC8023_PORT_8.DropLogFile = topo1.8023_N10_P8_Drop.log
			Set Node10_MAC8023_PORT_8.InThrputLogFile = topo1.8023_N10_P8_InThrput.log
			Set Node10_MAC8023_PORT_8.OutThrputLogFile = topo1.8023_N10_P8_OutThrput.log
			Set Node10_MAC8023_PORT_8.InOutThrputLogFile = topo1.8023_N10_P8_InOutThrput.log
			Set Node10_MAC8023_PORT_8.LinktoHub = 0

		Module Phy : Node10_Phy_PORT_8
			Set Node10_Phy_PORT_8.Bw = 10
			Set Node10_Phy_PORT_8.BER = 0.0
			Set Node10_Phy_PORT_8.PropDelay = 1
			Set Node10_Phy_PORT_8.linkfail = off
			Set Node10_Phy_PORT_8.linkfailFileName = topo1.phy_N10_P8.linkfail

		Module Link : Node10_PORT_8
			Set Node10_PORT_8.guitag_remotenode = yes


		Bind Node10_MAC8023_PORT_8 Node10_Phy_PORT_8
		Bind Node10_Phy_PORT_8 Node10_PORT_8
	EndDefine

	Define port 9
		Module MAC8023 : Node10_MAC8023_PORT_9

			Set Node10_OFSwitch_0.port9 = Node10_MAC8023_PORT_9
			Set Node10_OFSwitch_0.fixed_net9 = Node10_MAC8023_PORT_9.no
			Set Node10_MAC8023_PORT_9.recvtarget = Node10_OFSwitch_0

			Set Node10_MAC8023_PORT_9.mac = 0:1:0:0:0:3e
			Set Node10_MAC8023_PORT_9.lock_mac = off
			Set Node10_MAC8023_PORT_9.PromisOpt = on
			Set Node10_MAC8023_PORT_9.mode = full
			Set Node10_MAC8023_PORT_9.log = off
			Set Node10_MAC8023_PORT_9.logInterval = 1
			Set Node10_MAC8023_PORT_9.NumCollision = off
			Set Node10_MAC8023_PORT_9.NumUniInPkt = off
			Set Node10_MAC8023_PORT_9.NumUniOutPkt = off
			Set Node10_MAC8023_PORT_9.NumUniInOutPkt = off
			Set Node10_MAC8023_PORT_9.NumBroInPkt = off
			Set Node10_MAC8023_PORT_9.NumBroOutPkt = off
			Set Node10_MAC8023_PORT_9.NumBroInOutPkt = off
			Set Node10_MAC8023_PORT_9.NumDrop = off
			Set Node10_MAC8023_PORT_9.InThrput = off
			Set Node10_MAC8023_PORT_9.OutThrput = off
			Set Node10_MAC8023_PORT_9.InOutThrput = off
			Set Node10_MAC8023_PORT_9.UniInLogFile = topo1.8023_N10_P9_UniIn.log
			Set Node10_MAC8023_PORT_9.UniOutLogFile = topo1.8023_N10_P9_UniOut.log
			Set Node10_MAC8023_PORT_9.UniInOutLogFile = topo1.8023_N10_P9_UniInOut.log
			Set Node10_MAC8023_PORT_9.BroInLogFile = topo1.8023_N10_P9_BroIn.log
			Set Node10_MAC8023_PORT_9.BroOutLogFile = topo1.8023_N10_P9_BroOut.log
			Set Node10_MAC8023_PORT_9.BroInOutLogFile = topo1.8023_N10_P9_BroInOut.log
			Set Node10_MAC8023_PORT_9.CollLogFile = topo1.8023_N10_P9_Coll.log
			Set Node10_MAC8023_PORT_9.DropLogFile = topo1.8023_N10_P9_Drop.log
			Set Node10_MAC8023_PORT_9.InThrputLogFile = topo1.8023_N10_P9_InThrput.log
			Set Node10_MAC8023_PORT_9.OutThrputLogFile = topo1.8023_N10_P9_OutThrput.log
			Set Node10_MAC8023_PORT_9.InOutThrputLogFile = topo1.8023_N10_P9_InOutThrput.log
			Set Node10_MAC8023_PORT_9.LinktoHub = 0

		Module Phy : Node10_Phy_PORT_9
			Set Node10_Phy_PORT_9.Bw = 10
			Set Node10_Phy_PORT_9.BER = 0.0
			Set Node10_Phy_PORT_9.PropDelay = 1
			Set Node10_Phy_PORT_9.linkfail = off
			Set Node10_Phy_PORT_9.linkfailFileName = topo1.phy_N10_P9.linkfail

		Module Link : Node10_PORT_9
			Set Node10_PORT_9.guitag_remotenode = yes


		Bind Node10_MAC8023_PORT_9 Node10_Phy_PORT_9
		Bind Node10_Phy_PORT_9 Node10_PORT_9
	EndDefine

	Define port 10
		Module MAC8023 : Node10_MAC8023_PORT_10

			Set Node10_OFSwitch_0.port10 = Node10_MAC8023_PORT_10
			Set Node10_OFSwitch_0.fixed_net10 = Node10_MAC8023_PORT_10.no
			Set Node10_MAC8023_PORT_10.recvtarget = Node10_OFSwitch_0

			Set Node10_MAC8023_PORT_10.mac = 0:1:0:0:0:3f
			Set Node10_MAC8023_PORT_10.lock_mac = off
			Set Node10_MAC8023_PORT_10.PromisOpt = on
			Set Node10_MAC8023_PORT_10.mode = full
			Set Node10_MAC8023_PORT_10.log = off
			Set Node10_MAC8023_PORT_10.logInterval = 1
			Set Node10_MAC8023_PORT_10.NumCollision = off
			Set Node10_MAC8023_PORT_10.NumUniInPkt = off
			Set Node10_MAC8023_PORT_10.NumUniOutPkt = off
			Set Node10_MAC8023_PORT_10.NumUniInOutPkt = off
			Set Node10_MAC8023_PORT_10.NumBroInPkt = off
			Set Node10_MAC8023_PORT_10.NumBroOutPkt = off
			Set Node10_MAC8023_PORT_10.NumBroInOutPkt = off
			Set Node10_MAC8023_PORT_10.NumDrop = off
			Set Node10_MAC8023_PORT_10.InThrput = off
			Set Node10_MAC8023_PORT_10.OutThrput = off
			Set Node10_MAC8023_PORT_10.InOutThrput = off
			Set Node10_MAC8023_PORT_10.UniInLogFile = topo1.8023_N10_P10_UniIn.log
			Set Node10_MAC8023_PORT_10.UniOutLogFile = topo1.8023_N10_P10_UniOut.log
			Set Node10_MAC8023_PORT_10.UniInOutLogFile = topo1.8023_N10_P10_UniInOut.log
			Set Node10_MAC8023_PORT_10.BroInLogFile = topo1.8023_N10_P10_BroIn.log
			Set Node10_MAC8023_PORT_10.BroOutLogFile = topo1.8023_N10_P10_BroOut.log
			Set Node10_MAC8023_PORT_10.BroInOutLogFile = topo1.8023_N10_P10_BroInOut.log
			Set Node10_MAC8023_PORT_10.CollLogFile = topo1.8023_N10_P10_Coll.log
			Set Node10_MAC8023_PORT_10.DropLogFile = topo1.8023_N10_P10_Drop.log
			Set Node10_MAC8023_PORT_10.InThrputLogFile = topo1.8023_N10_P10_InThrput.log
			Set Node10_MAC8023_PORT_10.OutThrputLogFile = topo1.8023_N10_P10_OutThrput.log
			Set Node10_MAC8023_PORT_10.InOutThrputLogFile = topo1.8023_N10_P10_InOutThrput.log
			Set Node10_MAC8023_PORT_10.LinktoHub = 0

		Module Phy : Node10_Phy_PORT_10
			Set Node10_Phy_PORT_10.Bw = 10
			Set Node10_Phy_PORT_10.BER = 0.0
			Set Node10_Phy_PORT_10.PropDelay = 1
			Set Node10_Phy_PORT_10.linkfail = off
			Set Node10_Phy_PORT_10.linkfailFileName = topo1.phy_N10_P10.linkfail

		Module Link : Node10_PORT_10
			Set Node10_PORT_10.guitag_remotenode = yes


		Bind Node10_MAC8023_PORT_10 Node10_Phy_PORT_10
		Bind Node10_Phy_PORT_10 Node10_PORT_10
	EndDefine

	Define port 11
		Module MAC8023 : Node10_MAC8023_PORT_11

			Set Node10_OFSwitch_0.port11 = Node10_MAC8023_PORT_11
			Set Node10_OFSwitch_0.fixed_net11 = Node10_MAC8023_PORT_11.no
			Set Node10_MAC8023_PORT_11.recvtarget = Node10_OFSwitch_0

			Set Node10_MAC8023_PORT_11.mac = 0:1:0:0:0:40
			Set Node10_MAC8023_PORT_11.lock_mac = off
			Set Node10_MAC8023_PORT_11.PromisOpt = on
			Set Node10_MAC8023_PORT_11.mode = full
			Set Node10_MAC8023_PORT_11.log = off
			Set Node10_MAC8023_PORT_11.logInterval = 1
			Set Node10_MAC8023_PORT_11.NumCollision = off
			Set Node10_MAC8023_PORT_11.NumUniInPkt = off
			Set Node10_MAC8023_PORT_11.NumUniOutPkt = off
			Set Node10_MAC8023_PORT_11.NumUniInOutPkt = off
			Set Node10_MAC8023_PORT_11.NumBroInPkt = off
			Set Node10_MAC8023_PORT_11.NumBroOutPkt = off
			Set Node10_MAC8023_PORT_11.NumBroInOutPkt = off
			Set Node10_MAC8023_PORT_11.NumDrop = off
			Set Node10_MAC8023_PORT_11.InThrput = off
			Set Node10_MAC8023_PORT_11.OutThrput = off
			Set Node10_MAC8023_PORT_11.InOutThrput = off
			Set Node10_MAC8023_PORT_11.UniInLogFile = topo1.8023_N10_P11_UniIn.log
			Set Node10_MAC8023_PORT_11.UniOutLogFile = topo1.8023_N10_P11_UniOut.log
			Set Node10_MAC8023_PORT_11.UniInOutLogFile = topo1.8023_N10_P11_UniInOut.log
			Set Node10_MAC8023_PORT_11.BroInLogFile = topo1.8023_N10_P11_BroIn.log
			Set Node10_MAC8023_PORT_11.BroOutLogFile = topo1.8023_N10_P11_BroOut.log
			Set Node10_MAC8023_PORT_11.BroInOutLogFile = topo1.8023_N10_P11_BroInOut.log
			Set Node10_MAC8023_PORT_11.CollLogFile = topo1.8023_N10_P11_Coll.log
			Set Node10_MAC8023_PORT_11.DropLogFile = topo1.8023_N10_P11_Drop.log
			Set Node10_MAC8023_PORT_11.InThrputLogFile = topo1.8023_N10_P11_InThrput.log
			Set Node10_MAC8023_PORT_11.OutThrputLogFile = topo1.8023_N10_P11_OutThrput.log
			Set Node10_MAC8023_PORT_11.InOutThrputLogFile = topo1.8023_N10_P11_InOutThrput.log
			Set Node10_MAC8023_PORT_11.LinktoHub = 0

		Module Phy : Node10_Phy_PORT_11
			Set Node10_Phy_PORT_11.Bw = 10
			Set Node10_Phy_PORT_11.BER = 0.0
			Set Node10_Phy_PORT_11.PropDelay = 1
			Set Node10_Phy_PORT_11.linkfail = off
			Set Node10_Phy_PORT_11.linkfailFileName = topo1.phy_N10_P11.linkfail

		Module Link : Node10_PORT_11
			Set Node10_PORT_11.guitag_remotenode = yes


		Bind Node10_MAC8023_PORT_11 Node10_Phy_PORT_11
		Bind Node10_Phy_PORT_11 Node10_PORT_11
	EndDefine

	Define port 12
		Module MAC8023 : Node10_MAC8023_PORT_12

			Set Node10_OFSwitch_0.port12 = Node10_MAC8023_PORT_12
			Set Node10_OFSwitch_0.fixed_net12 = Node10_MAC8023_PORT_12.no
			Set Node10_MAC8023_PORT_12.recvtarget = Node10_OFSwitch_0

			Set Node10_MAC8023_PORT_12.mac = 0:1:0:0:0:41
			Set Node10_MAC8023_PORT_12.lock_mac = off
			Set Node10_MAC8023_PORT_12.PromisOpt = on
			Set Node10_MAC8023_PORT_12.mode = full
			Set Node10_MAC8023_PORT_12.log = off
			Set Node10_MAC8023_PORT_12.logInterval = 1
			Set Node10_MAC8023_PORT_12.NumCollision = off
			Set Node10_MAC8023_PORT_12.NumUniInPkt = off
			Set Node10_MAC8023_PORT_12.NumUniOutPkt = off
			Set Node10_MAC8023_PORT_12.NumUniInOutPkt = off
			Set Node10_MAC8023_PORT_12.NumBroInPkt = off
			Set Node10_MAC8023_PORT_12.NumBroOutPkt = off
			Set Node10_MAC8023_PORT_12.NumBroInOutPkt = off
			Set Node10_MAC8023_PORT_12.NumDrop = off
			Set Node10_MAC8023_PORT_12.InThrput = off
			Set Node10_MAC8023_PORT_12.OutThrput = off
			Set Node10_MAC8023_PORT_12.InOutThrput = off
			Set Node10_MAC8023_PORT_12.UniInLogFile = topo1.8023_N10_P12_UniIn.log
			Set Node10_MAC8023_PORT_12.UniOutLogFile = topo1.8023_N10_P12_UniOut.log
			Set Node10_MAC8023_PORT_12.UniInOutLogFile = topo1.8023_N10_P12_UniInOut.log
			Set Node10_MAC8023_PORT_12.BroInLogFile = topo1.8023_N10_P12_BroIn.log
			Set Node10_MAC8023_PORT_12.BroOutLogFile = topo1.8023_N10_P12_BroOut.log
			Set Node10_MAC8023_PORT_12.BroInOutLogFile = topo1.8023_N10_P12_BroInOut.log
			Set Node10_MAC8023_PORT_12.CollLogFile = topo1.8023_N10_P12_Coll.log
			Set Node10_MAC8023_PORT_12.DropLogFile = topo1.8023_N10_P12_Drop.log
			Set Node10_MAC8023_PORT_12.InThrputLogFile = topo1.8023_N10_P12_InThrput.log
			Set Node10_MAC8023_PORT_12.OutThrputLogFile = topo1.8023_N10_P12_OutThrput.log
			Set Node10_MAC8023_PORT_12.InOutThrputLogFile = topo1.8023_N10_P12_InOutThrput.log
			Set Node10_MAC8023_PORT_12.LinktoHub = 0

		Module Phy : Node10_Phy_PORT_12
			Set Node10_Phy_PORT_12.Bw = 10
			Set Node10_Phy_PORT_12.BER = 0.0
			Set Node10_Phy_PORT_12.PropDelay = 1
			Set Node10_Phy_PORT_12.linkfail = off
			Set Node10_Phy_PORT_12.linkfailFileName = topo1.phy_N10_P12.linkfail

		Module Link : Node10_PORT_12
			Set Node10_PORT_12.guitag_remotenode = yes


		Bind Node10_MAC8023_PORT_12 Node10_Phy_PORT_12
		Bind Node10_Phy_PORT_12 Node10_PORT_12
	EndDefine

EndCreate

Create Node 11 as OF_SW with name = OF_SW11
	Module OFSwitch : Node11_OFSwitch_0
		Set Node11_OFSwitch_0.guitag_addport = yes
		Set Node11_OFSwitch_0.flow_table_amount = 15
		Set Node11_OFSwitch_0.flow_table_entry_amount = 256
		Set Node11_OFSwitch_0.group_table_entry_amount = 256
		Set Node11_OFSwitch_0.table_miss_buffer_size = 1000
		Set Node11_OFSwitch_0.fifo_queue_size = 50
		Set Node11_OFSwitch_0.controller_ip = 1.0.1.1
	Define port 1
		Module Interface : Node11_Interface_PORT_1

			Set Node11_OFSwitch_0.port1 = Node11_Interface_PORT_1
			Set Node11_OFSwitch_0.fixed_net1 = Node11_Interface_PORT_1.no
			Set Node11_Interface_PORT_1.recvtarget = Node11_OFSwitch_0

			Set Node11_Interface_PORT_1.ip = 1.0.1.4
			Set Node11_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node11_ARP_PORT_1
			Set Node11_ARP_PORT_1.arpMode = RunARP
			Set Node11_ARP_PORT_1.flushInterval = 3000
			Set Node11_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node11_FIFO_PORT_1
			Set Node11_FIFO_PORT_1.max_qlen = 50
			Set Node11_FIFO_PORT_1.log_qlen = off
			Set Node11_FIFO_PORT_1.log_option = FullLog
			Set Node11_FIFO_PORT_1.samplerate = 1
			Set Node11_FIFO_PORT_1.logFileName = topo1.fifo_N11_P1_qlen.log
			Set Node11_FIFO_PORT_1.log_drop = off
			Set Node11_FIFO_PORT_1.drop_samplerate = 1
			Set Node11_FIFO_PORT_1.droplogFileName = topo1.fifo_N11_P1_drop.log

		Module TCPDUMP : Node11_TCPDUMP_PORT_1

		Module MAC8023 : Node11_MAC8023_PORT_1
			Set Node11_MAC8023_PORT_1.mac = 0:1:0:0:0:42
			Set Node11_MAC8023_PORT_1.lock_mac = off
			Set Node11_MAC8023_PORT_1.PromisOpt = on
			Set Node11_MAC8023_PORT_1.mode = full
			Set Node11_MAC8023_PORT_1.log = off
			Set Node11_MAC8023_PORT_1.logInterval = 1
			Set Node11_MAC8023_PORT_1.NumCollision = off
			Set Node11_MAC8023_PORT_1.NumUniInPkt = off
			Set Node11_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node11_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node11_MAC8023_PORT_1.NumBroInPkt = off
			Set Node11_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node11_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node11_MAC8023_PORT_1.NumDrop = off
			Set Node11_MAC8023_PORT_1.InThrput = off
			Set Node11_MAC8023_PORT_1.OutThrput = off
			Set Node11_MAC8023_PORT_1.InOutThrput = off
			Set Node11_MAC8023_PORT_1.UniInLogFile = topo1.8023_N11_P1_UniIn.log
			Set Node11_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N11_P1_UniOut.log
			Set Node11_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N11_P1_UniInOut.log
			Set Node11_MAC8023_PORT_1.BroInLogFile = topo1.8023_N11_P1_BroIn.log
			Set Node11_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N11_P1_BroOut.log
			Set Node11_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N11_P1_BroInOut.log
			Set Node11_MAC8023_PORT_1.CollLogFile = topo1.8023_N11_P1_Coll.log
			Set Node11_MAC8023_PORT_1.DropLogFile = topo1.8023_N11_P1_Drop.log
			Set Node11_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N11_P1_InThrput.log
			Set Node11_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N11_P1_OutThrput.log
			Set Node11_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N11_P1_InOutThrput.log
			Set Node11_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node11_Phy_PORT_1
			Set Node11_Phy_PORT_1.Bw = 10
			Set Node11_Phy_PORT_1.BER = 0.0
			Set Node11_Phy_PORT_1.PropDelay = 1
			Set Node11_Phy_PORT_1.linkfail = off
			Set Node11_Phy_PORT_1.linkfailFileName = topo1.phy_N11_P1.linkfail

		Module Link : Node11_PORT_1
			Set Node11_PORT_1.guitag_remotenode = yes


		Bind Node11_Interface_PORT_1 Node11_ARP_PORT_1
		Bind Node11_ARP_PORT_1 Node11_FIFO_PORT_1
		Bind Node11_FIFO_PORT_1 Node11_TCPDUMP_PORT_1
		Bind Node11_TCPDUMP_PORT_1 Node11_MAC8023_PORT_1
		Bind Node11_MAC8023_PORT_1 Node11_Phy_PORT_1
		Bind Node11_Phy_PORT_1 Node11_PORT_1
	EndDefine

	Define port 2
		Module MAC8023 : Node11_MAC8023_PORT_2

			Set Node11_OFSwitch_0.port2 = Node11_MAC8023_PORT_2
			Set Node11_OFSwitch_0.fixed_net2 = Node11_MAC8023_PORT_2.no
			Set Node11_MAC8023_PORT_2.recvtarget = Node11_OFSwitch_0

			Set Node11_MAC8023_PORT_2.mac = 0:1:0:0:0:43
			Set Node11_MAC8023_PORT_2.lock_mac = off
			Set Node11_MAC8023_PORT_2.PromisOpt = on
			Set Node11_MAC8023_PORT_2.mode = full
			Set Node11_MAC8023_PORT_2.log = off
			Set Node11_MAC8023_PORT_2.logInterval = 1
			Set Node11_MAC8023_PORT_2.NumCollision = off
			Set Node11_MAC8023_PORT_2.NumUniInPkt = off
			Set Node11_MAC8023_PORT_2.NumUniOutPkt = off
			Set Node11_MAC8023_PORT_2.NumUniInOutPkt = off
			Set Node11_MAC8023_PORT_2.NumBroInPkt = off
			Set Node11_MAC8023_PORT_2.NumBroOutPkt = off
			Set Node11_MAC8023_PORT_2.NumBroInOutPkt = off
			Set Node11_MAC8023_PORT_2.NumDrop = off
			Set Node11_MAC8023_PORT_2.InThrput = off
			Set Node11_MAC8023_PORT_2.OutThrput = off
			Set Node11_MAC8023_PORT_2.InOutThrput = off
			Set Node11_MAC8023_PORT_2.UniInLogFile = topo1.8023_N11_P2_UniIn.log
			Set Node11_MAC8023_PORT_2.UniOutLogFile = topo1.8023_N11_P2_UniOut.log
			Set Node11_MAC8023_PORT_2.UniInOutLogFile = topo1.8023_N11_P2_UniInOut.log
			Set Node11_MAC8023_PORT_2.BroInLogFile = topo1.8023_N11_P2_BroIn.log
			Set Node11_MAC8023_PORT_2.BroOutLogFile = topo1.8023_N11_P2_BroOut.log
			Set Node11_MAC8023_PORT_2.BroInOutLogFile = topo1.8023_N11_P2_BroInOut.log
			Set Node11_MAC8023_PORT_2.CollLogFile = topo1.8023_N11_P2_Coll.log
			Set Node11_MAC8023_PORT_2.DropLogFile = topo1.8023_N11_P2_Drop.log
			Set Node11_MAC8023_PORT_2.InThrputLogFile = topo1.8023_N11_P2_InThrput.log
			Set Node11_MAC8023_PORT_2.OutThrputLogFile = topo1.8023_N11_P2_OutThrput.log
			Set Node11_MAC8023_PORT_2.InOutThrputLogFile = topo1.8023_N11_P2_InOutThrput.log
			Set Node11_MAC8023_PORT_2.LinktoHub = 0

		Module Phy : Node11_Phy_PORT_2
			Set Node11_Phy_PORT_2.Bw = 10
			Set Node11_Phy_PORT_2.BER = 0.0
			Set Node11_Phy_PORT_2.PropDelay = 1
			Set Node11_Phy_PORT_2.linkfail = off
			Set Node11_Phy_PORT_2.linkfailFileName = topo1.phy_N11_P2.linkfail

		Module Link : Node11_PORT_2
			Set Node11_PORT_2.guitag_remotenode = yes


		Bind Node11_MAC8023_PORT_2 Node11_Phy_PORT_2
		Bind Node11_Phy_PORT_2 Node11_PORT_2
	EndDefine

	Define port 3
		Module MAC8023 : Node11_MAC8023_PORT_3

			Set Node11_OFSwitch_0.port3 = Node11_MAC8023_PORT_3
			Set Node11_OFSwitch_0.fixed_net3 = Node11_MAC8023_PORT_3.no
			Set Node11_MAC8023_PORT_3.recvtarget = Node11_OFSwitch_0

			Set Node11_MAC8023_PORT_3.mac = 0:1:0:0:0:44
			Set Node11_MAC8023_PORT_3.lock_mac = off
			Set Node11_MAC8023_PORT_3.PromisOpt = on
			Set Node11_MAC8023_PORT_3.mode = full
			Set Node11_MAC8023_PORT_3.log = off
			Set Node11_MAC8023_PORT_3.logInterval = 1
			Set Node11_MAC8023_PORT_3.NumCollision = off
			Set Node11_MAC8023_PORT_3.NumUniInPkt = off
			Set Node11_MAC8023_PORT_3.NumUniOutPkt = off
			Set Node11_MAC8023_PORT_3.NumUniInOutPkt = off
			Set Node11_MAC8023_PORT_3.NumBroInPkt = off
			Set Node11_MAC8023_PORT_3.NumBroOutPkt = off
			Set Node11_MAC8023_PORT_3.NumBroInOutPkt = off
			Set Node11_MAC8023_PORT_3.NumDrop = off
			Set Node11_MAC8023_PORT_3.InThrput = off
			Set Node11_MAC8023_PORT_3.OutThrput = off
			Set Node11_MAC8023_PORT_3.InOutThrput = off
			Set Node11_MAC8023_PORT_3.UniInLogFile = topo1.8023_N11_P3_UniIn.log
			Set Node11_MAC8023_PORT_3.UniOutLogFile = topo1.8023_N11_P3_UniOut.log
			Set Node11_MAC8023_PORT_3.UniInOutLogFile = topo1.8023_N11_P3_UniInOut.log
			Set Node11_MAC8023_PORT_3.BroInLogFile = topo1.8023_N11_P3_BroIn.log
			Set Node11_MAC8023_PORT_3.BroOutLogFile = topo1.8023_N11_P3_BroOut.log
			Set Node11_MAC8023_PORT_3.BroInOutLogFile = topo1.8023_N11_P3_BroInOut.log
			Set Node11_MAC8023_PORT_3.CollLogFile = topo1.8023_N11_P3_Coll.log
			Set Node11_MAC8023_PORT_3.DropLogFile = topo1.8023_N11_P3_Drop.log
			Set Node11_MAC8023_PORT_3.InThrputLogFile = topo1.8023_N11_P3_InThrput.log
			Set Node11_MAC8023_PORT_3.OutThrputLogFile = topo1.8023_N11_P3_OutThrput.log
			Set Node11_MAC8023_PORT_3.InOutThrputLogFile = topo1.8023_N11_P3_InOutThrput.log
			Set Node11_MAC8023_PORT_3.LinktoHub = 0

		Module Phy : Node11_Phy_PORT_3
			Set Node11_Phy_PORT_3.Bw = 10
			Set Node11_Phy_PORT_3.BER = 0.0
			Set Node11_Phy_PORT_3.PropDelay = 1
			Set Node11_Phy_PORT_3.linkfail = off
			Set Node11_Phy_PORT_3.linkfailFileName = topo1.phy_N11_P3.linkfail

		Module Link : Node11_PORT_3
			Set Node11_PORT_3.guitag_remotenode = yes


		Bind Node11_MAC8023_PORT_3 Node11_Phy_PORT_3
		Bind Node11_Phy_PORT_3 Node11_PORT_3
	EndDefine

	Define port 4
		Module MAC8023 : Node11_MAC8023_PORT_4

			Set Node11_OFSwitch_0.port4 = Node11_MAC8023_PORT_4
			Set Node11_OFSwitch_0.fixed_net4 = Node11_MAC8023_PORT_4.no
			Set Node11_MAC8023_PORT_4.recvtarget = Node11_OFSwitch_0

			Set Node11_MAC8023_PORT_4.mac = 0:1:0:0:0:45
			Set Node11_MAC8023_PORT_4.lock_mac = off
			Set Node11_MAC8023_PORT_4.PromisOpt = on
			Set Node11_MAC8023_PORT_4.mode = full
			Set Node11_MAC8023_PORT_4.log = off
			Set Node11_MAC8023_PORT_4.logInterval = 1
			Set Node11_MAC8023_PORT_4.NumCollision = off
			Set Node11_MAC8023_PORT_4.NumUniInPkt = off
			Set Node11_MAC8023_PORT_4.NumUniOutPkt = off
			Set Node11_MAC8023_PORT_4.NumUniInOutPkt = off
			Set Node11_MAC8023_PORT_4.NumBroInPkt = off
			Set Node11_MAC8023_PORT_4.NumBroOutPkt = off
			Set Node11_MAC8023_PORT_4.NumBroInOutPkt = off
			Set Node11_MAC8023_PORT_4.NumDrop = off
			Set Node11_MAC8023_PORT_4.InThrput = off
			Set Node11_MAC8023_PORT_4.OutThrput = off
			Set Node11_MAC8023_PORT_4.InOutThrput = off
			Set Node11_MAC8023_PORT_4.UniInLogFile = topo1.8023_N11_P4_UniIn.log
			Set Node11_MAC8023_PORT_4.UniOutLogFile = topo1.8023_N11_P4_UniOut.log
			Set Node11_MAC8023_PORT_4.UniInOutLogFile = topo1.8023_N11_P4_UniInOut.log
			Set Node11_MAC8023_PORT_4.BroInLogFile = topo1.8023_N11_P4_BroIn.log
			Set Node11_MAC8023_PORT_4.BroOutLogFile = topo1.8023_N11_P4_BroOut.log
			Set Node11_MAC8023_PORT_4.BroInOutLogFile = topo1.8023_N11_P4_BroInOut.log
			Set Node11_MAC8023_PORT_4.CollLogFile = topo1.8023_N11_P4_Coll.log
			Set Node11_MAC8023_PORT_4.DropLogFile = topo1.8023_N11_P4_Drop.log
			Set Node11_MAC8023_PORT_4.InThrputLogFile = topo1.8023_N11_P4_InThrput.log
			Set Node11_MAC8023_PORT_4.OutThrputLogFile = topo1.8023_N11_P4_OutThrput.log
			Set Node11_MAC8023_PORT_4.InOutThrputLogFile = topo1.8023_N11_P4_InOutThrput.log
			Set Node11_MAC8023_PORT_4.LinktoHub = 0

		Module Phy : Node11_Phy_PORT_4
			Set Node11_Phy_PORT_4.Bw = 10
			Set Node11_Phy_PORT_4.BER = 0.0
			Set Node11_Phy_PORT_4.PropDelay = 1
			Set Node11_Phy_PORT_4.linkfail = off
			Set Node11_Phy_PORT_4.linkfailFileName = topo1.phy_N11_P4.linkfail

		Module Link : Node11_PORT_4
			Set Node11_PORT_4.guitag_remotenode = yes


		Bind Node11_MAC8023_PORT_4 Node11_Phy_PORT_4
		Bind Node11_Phy_PORT_4 Node11_PORT_4
	EndDefine

	Define port 5
		Module MAC8023 : Node11_MAC8023_PORT_5

			Set Node11_OFSwitch_0.port5 = Node11_MAC8023_PORT_5
			Set Node11_OFSwitch_0.fixed_net5 = Node11_MAC8023_PORT_5.no
			Set Node11_MAC8023_PORT_5.recvtarget = Node11_OFSwitch_0

			Set Node11_MAC8023_PORT_5.mac = 0:1:0:0:0:46
			Set Node11_MAC8023_PORT_5.lock_mac = off
			Set Node11_MAC8023_PORT_5.PromisOpt = on
			Set Node11_MAC8023_PORT_5.mode = full
			Set Node11_MAC8023_PORT_5.log = off
			Set Node11_MAC8023_PORT_5.logInterval = 1
			Set Node11_MAC8023_PORT_5.NumCollision = off
			Set Node11_MAC8023_PORT_5.NumUniInPkt = off
			Set Node11_MAC8023_PORT_5.NumUniOutPkt = off
			Set Node11_MAC8023_PORT_5.NumUniInOutPkt = off
			Set Node11_MAC8023_PORT_5.NumBroInPkt = off
			Set Node11_MAC8023_PORT_5.NumBroOutPkt = off
			Set Node11_MAC8023_PORT_5.NumBroInOutPkt = off
			Set Node11_MAC8023_PORT_5.NumDrop = off
			Set Node11_MAC8023_PORT_5.InThrput = off
			Set Node11_MAC8023_PORT_5.OutThrput = off
			Set Node11_MAC8023_PORT_5.InOutThrput = off
			Set Node11_MAC8023_PORT_5.UniInLogFile = topo1.8023_N11_P5_UniIn.log
			Set Node11_MAC8023_PORT_5.UniOutLogFile = topo1.8023_N11_P5_UniOut.log
			Set Node11_MAC8023_PORT_5.UniInOutLogFile = topo1.8023_N11_P5_UniInOut.log
			Set Node11_MAC8023_PORT_5.BroInLogFile = topo1.8023_N11_P5_BroIn.log
			Set Node11_MAC8023_PORT_5.BroOutLogFile = topo1.8023_N11_P5_BroOut.log
			Set Node11_MAC8023_PORT_5.BroInOutLogFile = topo1.8023_N11_P5_BroInOut.log
			Set Node11_MAC8023_PORT_5.CollLogFile = topo1.8023_N11_P5_Coll.log
			Set Node11_MAC8023_PORT_5.DropLogFile = topo1.8023_N11_P5_Drop.log
			Set Node11_MAC8023_PORT_5.InThrputLogFile = topo1.8023_N11_P5_InThrput.log
			Set Node11_MAC8023_PORT_5.OutThrputLogFile = topo1.8023_N11_P5_OutThrput.log
			Set Node11_MAC8023_PORT_5.InOutThrputLogFile = topo1.8023_N11_P5_InOutThrput.log
			Set Node11_MAC8023_PORT_5.LinktoHub = 0

		Module Phy : Node11_Phy_PORT_5
			Set Node11_Phy_PORT_5.Bw = 10
			Set Node11_Phy_PORT_5.BER = 0.0
			Set Node11_Phy_PORT_5.PropDelay = 1
			Set Node11_Phy_PORT_5.linkfail = off
			Set Node11_Phy_PORT_5.linkfailFileName = topo1.phy_N11_P5.linkfail

		Module Link : Node11_PORT_5
			Set Node11_PORT_5.guitag_remotenode = yes


		Bind Node11_MAC8023_PORT_5 Node11_Phy_PORT_5
		Bind Node11_Phy_PORT_5 Node11_PORT_5
	EndDefine

	Define port 6
		Module MAC8023 : Node11_MAC8023_PORT_6

			Set Node11_OFSwitch_0.port6 = Node11_MAC8023_PORT_6
			Set Node11_OFSwitch_0.fixed_net6 = Node11_MAC8023_PORT_6.no
			Set Node11_MAC8023_PORT_6.recvtarget = Node11_OFSwitch_0

			Set Node11_MAC8023_PORT_6.mac = 0:1:0:0:0:47
			Set Node11_MAC8023_PORT_6.lock_mac = off
			Set Node11_MAC8023_PORT_6.PromisOpt = on
			Set Node11_MAC8023_PORT_6.mode = full
			Set Node11_MAC8023_PORT_6.log = off
			Set Node11_MAC8023_PORT_6.logInterval = 1
			Set Node11_MAC8023_PORT_6.NumCollision = off
			Set Node11_MAC8023_PORT_6.NumUniInPkt = off
			Set Node11_MAC8023_PORT_6.NumUniOutPkt = off
			Set Node11_MAC8023_PORT_6.NumUniInOutPkt = off
			Set Node11_MAC8023_PORT_6.NumBroInPkt = off
			Set Node11_MAC8023_PORT_6.NumBroOutPkt = off
			Set Node11_MAC8023_PORT_6.NumBroInOutPkt = off
			Set Node11_MAC8023_PORT_6.NumDrop = off
			Set Node11_MAC8023_PORT_6.InThrput = off
			Set Node11_MAC8023_PORT_6.OutThrput = off
			Set Node11_MAC8023_PORT_6.InOutThrput = off
			Set Node11_MAC8023_PORT_6.UniInLogFile = topo1.8023_N11_P6_UniIn.log
			Set Node11_MAC8023_PORT_6.UniOutLogFile = topo1.8023_N11_P6_UniOut.log
			Set Node11_MAC8023_PORT_6.UniInOutLogFile = topo1.8023_N11_P6_UniInOut.log
			Set Node11_MAC8023_PORT_6.BroInLogFile = topo1.8023_N11_P6_BroIn.log
			Set Node11_MAC8023_PORT_6.BroOutLogFile = topo1.8023_N11_P6_BroOut.log
			Set Node11_MAC8023_PORT_6.BroInOutLogFile = topo1.8023_N11_P6_BroInOut.log
			Set Node11_MAC8023_PORT_6.CollLogFile = topo1.8023_N11_P6_Coll.log
			Set Node11_MAC8023_PORT_6.DropLogFile = topo1.8023_N11_P6_Drop.log
			Set Node11_MAC8023_PORT_6.InThrputLogFile = topo1.8023_N11_P6_InThrput.log
			Set Node11_MAC8023_PORT_6.OutThrputLogFile = topo1.8023_N11_P6_OutThrput.log
			Set Node11_MAC8023_PORT_6.InOutThrputLogFile = topo1.8023_N11_P6_InOutThrput.log
			Set Node11_MAC8023_PORT_6.LinktoHub = 0

		Module Phy : Node11_Phy_PORT_6
			Set Node11_Phy_PORT_6.Bw = 10
			Set Node11_Phy_PORT_6.BER = 0.0
			Set Node11_Phy_PORT_6.PropDelay = 1
			Set Node11_Phy_PORT_6.linkfail = off
			Set Node11_Phy_PORT_6.linkfailFileName = topo1.phy_N11_P6.linkfail

		Module Link : Node11_PORT_6
			Set Node11_PORT_6.guitag_remotenode = yes


		Bind Node11_MAC8023_PORT_6 Node11_Phy_PORT_6
		Bind Node11_Phy_PORT_6 Node11_PORT_6
	EndDefine

	Define port 7
		Module MAC8023 : Node11_MAC8023_PORT_7

			Set Node11_OFSwitch_0.port7 = Node11_MAC8023_PORT_7
			Set Node11_OFSwitch_0.fixed_net7 = Node11_MAC8023_PORT_7.no
			Set Node11_MAC8023_PORT_7.recvtarget = Node11_OFSwitch_0

			Set Node11_MAC8023_PORT_7.mac = 0:1:0:0:0:48
			Set Node11_MAC8023_PORT_7.lock_mac = off
			Set Node11_MAC8023_PORT_7.PromisOpt = on
			Set Node11_MAC8023_PORT_7.mode = full
			Set Node11_MAC8023_PORT_7.log = off
			Set Node11_MAC8023_PORT_7.logInterval = 1
			Set Node11_MAC8023_PORT_7.NumCollision = off
			Set Node11_MAC8023_PORT_7.NumUniInPkt = off
			Set Node11_MAC8023_PORT_7.NumUniOutPkt = off
			Set Node11_MAC8023_PORT_7.NumUniInOutPkt = off
			Set Node11_MAC8023_PORT_7.NumBroInPkt = off
			Set Node11_MAC8023_PORT_7.NumBroOutPkt = off
			Set Node11_MAC8023_PORT_7.NumBroInOutPkt = off
			Set Node11_MAC8023_PORT_7.NumDrop = off
			Set Node11_MAC8023_PORT_7.InThrput = off
			Set Node11_MAC8023_PORT_7.OutThrput = off
			Set Node11_MAC8023_PORT_7.InOutThrput = off
			Set Node11_MAC8023_PORT_7.UniInLogFile = topo1.8023_N11_P7_UniIn.log
			Set Node11_MAC8023_PORT_7.UniOutLogFile = topo1.8023_N11_P7_UniOut.log
			Set Node11_MAC8023_PORT_7.UniInOutLogFile = topo1.8023_N11_P7_UniInOut.log
			Set Node11_MAC8023_PORT_7.BroInLogFile = topo1.8023_N11_P7_BroIn.log
			Set Node11_MAC8023_PORT_7.BroOutLogFile = topo1.8023_N11_P7_BroOut.log
			Set Node11_MAC8023_PORT_7.BroInOutLogFile = topo1.8023_N11_P7_BroInOut.log
			Set Node11_MAC8023_PORT_7.CollLogFile = topo1.8023_N11_P7_Coll.log
			Set Node11_MAC8023_PORT_7.DropLogFile = topo1.8023_N11_P7_Drop.log
			Set Node11_MAC8023_PORT_7.InThrputLogFile = topo1.8023_N11_P7_InThrput.log
			Set Node11_MAC8023_PORT_7.OutThrputLogFile = topo1.8023_N11_P7_OutThrput.log
			Set Node11_MAC8023_PORT_7.InOutThrputLogFile = topo1.8023_N11_P7_InOutThrput.log
			Set Node11_MAC8023_PORT_7.LinktoHub = 0

		Module Phy : Node11_Phy_PORT_7
			Set Node11_Phy_PORT_7.Bw = 10
			Set Node11_Phy_PORT_7.BER = 0.0
			Set Node11_Phy_PORT_7.PropDelay = 1
			Set Node11_Phy_PORT_7.linkfail = off
			Set Node11_Phy_PORT_7.linkfailFileName = topo1.phy_N11_P7.linkfail

		Module Link : Node11_PORT_7
			Set Node11_PORT_7.guitag_remotenode = yes


		Bind Node11_MAC8023_PORT_7 Node11_Phy_PORT_7
		Bind Node11_Phy_PORT_7 Node11_PORT_7
	EndDefine

	Define port 8
		Module MAC8023 : Node11_MAC8023_PORT_8

			Set Node11_OFSwitch_0.port8 = Node11_MAC8023_PORT_8
			Set Node11_OFSwitch_0.fixed_net8 = Node11_MAC8023_PORT_8.no
			Set Node11_MAC8023_PORT_8.recvtarget = Node11_OFSwitch_0

			Set Node11_MAC8023_PORT_8.mac = 0:1:0:0:0:49
			Set Node11_MAC8023_PORT_8.lock_mac = off
			Set Node11_MAC8023_PORT_8.PromisOpt = on
			Set Node11_MAC8023_PORT_8.mode = full
			Set Node11_MAC8023_PORT_8.log = off
			Set Node11_MAC8023_PORT_8.logInterval = 1
			Set Node11_MAC8023_PORT_8.NumCollision = off
			Set Node11_MAC8023_PORT_8.NumUniInPkt = off
			Set Node11_MAC8023_PORT_8.NumUniOutPkt = off
			Set Node11_MAC8023_PORT_8.NumUniInOutPkt = off
			Set Node11_MAC8023_PORT_8.NumBroInPkt = off
			Set Node11_MAC8023_PORT_8.NumBroOutPkt = off
			Set Node11_MAC8023_PORT_8.NumBroInOutPkt = off
			Set Node11_MAC8023_PORT_8.NumDrop = off
			Set Node11_MAC8023_PORT_8.InThrput = off
			Set Node11_MAC8023_PORT_8.OutThrput = off
			Set Node11_MAC8023_PORT_8.InOutThrput = off
			Set Node11_MAC8023_PORT_8.UniInLogFile = topo1.8023_N11_P8_UniIn.log
			Set Node11_MAC8023_PORT_8.UniOutLogFile = topo1.8023_N11_P8_UniOut.log
			Set Node11_MAC8023_PORT_8.UniInOutLogFile = topo1.8023_N11_P8_UniInOut.log
			Set Node11_MAC8023_PORT_8.BroInLogFile = topo1.8023_N11_P8_BroIn.log
			Set Node11_MAC8023_PORT_8.BroOutLogFile = topo1.8023_N11_P8_BroOut.log
			Set Node11_MAC8023_PORT_8.BroInOutLogFile = topo1.8023_N11_P8_BroInOut.log
			Set Node11_MAC8023_PORT_8.CollLogFile = topo1.8023_N11_P8_Coll.log
			Set Node11_MAC8023_PORT_8.DropLogFile = topo1.8023_N11_P8_Drop.log
			Set Node11_MAC8023_PORT_8.InThrputLogFile = topo1.8023_N11_P8_InThrput.log
			Set Node11_MAC8023_PORT_8.OutThrputLogFile = topo1.8023_N11_P8_OutThrput.log
			Set Node11_MAC8023_PORT_8.InOutThrputLogFile = topo1.8023_N11_P8_InOutThrput.log
			Set Node11_MAC8023_PORT_8.LinktoHub = 0

		Module Phy : Node11_Phy_PORT_8
			Set Node11_Phy_PORT_8.Bw = 10
			Set Node11_Phy_PORT_8.BER = 0.0
			Set Node11_Phy_PORT_8.PropDelay = 1
			Set Node11_Phy_PORT_8.linkfail = off
			Set Node11_Phy_PORT_8.linkfailFileName = topo1.phy_N11_P8.linkfail

		Module Link : Node11_PORT_8
			Set Node11_PORT_8.guitag_remotenode = yes


		Bind Node11_MAC8023_PORT_8 Node11_Phy_PORT_8
		Bind Node11_Phy_PORT_8 Node11_PORT_8
	EndDefine

	Define port 9
		Module MAC8023 : Node11_MAC8023_PORT_9

			Set Node11_OFSwitch_0.port9 = Node11_MAC8023_PORT_9
			Set Node11_OFSwitch_0.fixed_net9 = Node11_MAC8023_PORT_9.no
			Set Node11_MAC8023_PORT_9.recvtarget = Node11_OFSwitch_0

			Set Node11_MAC8023_PORT_9.mac = 0:1:0:0:0:4a
			Set Node11_MAC8023_PORT_9.lock_mac = off
			Set Node11_MAC8023_PORT_9.PromisOpt = on
			Set Node11_MAC8023_PORT_9.mode = full
			Set Node11_MAC8023_PORT_9.log = off
			Set Node11_MAC8023_PORT_9.logInterval = 1
			Set Node11_MAC8023_PORT_9.NumCollision = off
			Set Node11_MAC8023_PORT_9.NumUniInPkt = off
			Set Node11_MAC8023_PORT_9.NumUniOutPkt = off
			Set Node11_MAC8023_PORT_9.NumUniInOutPkt = off
			Set Node11_MAC8023_PORT_9.NumBroInPkt = off
			Set Node11_MAC8023_PORT_9.NumBroOutPkt = off
			Set Node11_MAC8023_PORT_9.NumBroInOutPkt = off
			Set Node11_MAC8023_PORT_9.NumDrop = off
			Set Node11_MAC8023_PORT_9.InThrput = off
			Set Node11_MAC8023_PORT_9.OutThrput = off
			Set Node11_MAC8023_PORT_9.InOutThrput = off
			Set Node11_MAC8023_PORT_9.UniInLogFile = topo1.8023_N11_P9_UniIn.log
			Set Node11_MAC8023_PORT_9.UniOutLogFile = topo1.8023_N11_P9_UniOut.log
			Set Node11_MAC8023_PORT_9.UniInOutLogFile = topo1.8023_N11_P9_UniInOut.log
			Set Node11_MAC8023_PORT_9.BroInLogFile = topo1.8023_N11_P9_BroIn.log
			Set Node11_MAC8023_PORT_9.BroOutLogFile = topo1.8023_N11_P9_BroOut.log
			Set Node11_MAC8023_PORT_9.BroInOutLogFile = topo1.8023_N11_P9_BroInOut.log
			Set Node11_MAC8023_PORT_9.CollLogFile = topo1.8023_N11_P9_Coll.log
			Set Node11_MAC8023_PORT_9.DropLogFile = topo1.8023_N11_P9_Drop.log
			Set Node11_MAC8023_PORT_9.InThrputLogFile = topo1.8023_N11_P9_InThrput.log
			Set Node11_MAC8023_PORT_9.OutThrputLogFile = topo1.8023_N11_P9_OutThrput.log
			Set Node11_MAC8023_PORT_9.InOutThrputLogFile = topo1.8023_N11_P9_InOutThrput.log
			Set Node11_MAC8023_PORT_9.LinktoHub = 0

		Module Phy : Node11_Phy_PORT_9
			Set Node11_Phy_PORT_9.Bw = 10
			Set Node11_Phy_PORT_9.BER = 0.0
			Set Node11_Phy_PORT_9.PropDelay = 1
			Set Node11_Phy_PORT_9.linkfail = off
			Set Node11_Phy_PORT_9.linkfailFileName = topo1.phy_N11_P9.linkfail

		Module Link : Node11_PORT_9
			Set Node11_PORT_9.guitag_remotenode = yes


		Bind Node11_MAC8023_PORT_9 Node11_Phy_PORT_9
		Bind Node11_Phy_PORT_9 Node11_PORT_9
	EndDefine

	Define port 10
		Module MAC8023 : Node11_MAC8023_PORT_10

			Set Node11_OFSwitch_0.port10 = Node11_MAC8023_PORT_10
			Set Node11_OFSwitch_0.fixed_net10 = Node11_MAC8023_PORT_10.no
			Set Node11_MAC8023_PORT_10.recvtarget = Node11_OFSwitch_0

			Set Node11_MAC8023_PORT_10.mac = 0:1:0:0:0:4b
			Set Node11_MAC8023_PORT_10.lock_mac = off
			Set Node11_MAC8023_PORT_10.PromisOpt = on
			Set Node11_MAC8023_PORT_10.mode = full
			Set Node11_MAC8023_PORT_10.log = off
			Set Node11_MAC8023_PORT_10.logInterval = 1
			Set Node11_MAC8023_PORT_10.NumCollision = off
			Set Node11_MAC8023_PORT_10.NumUniInPkt = off
			Set Node11_MAC8023_PORT_10.NumUniOutPkt = off
			Set Node11_MAC8023_PORT_10.NumUniInOutPkt = off
			Set Node11_MAC8023_PORT_10.NumBroInPkt = off
			Set Node11_MAC8023_PORT_10.NumBroOutPkt = off
			Set Node11_MAC8023_PORT_10.NumBroInOutPkt = off
			Set Node11_MAC8023_PORT_10.NumDrop = off
			Set Node11_MAC8023_PORT_10.InThrput = off
			Set Node11_MAC8023_PORT_10.OutThrput = off
			Set Node11_MAC8023_PORT_10.InOutThrput = off
			Set Node11_MAC8023_PORT_10.UniInLogFile = topo1.8023_N11_P10_UniIn.log
			Set Node11_MAC8023_PORT_10.UniOutLogFile = topo1.8023_N11_P10_UniOut.log
			Set Node11_MAC8023_PORT_10.UniInOutLogFile = topo1.8023_N11_P10_UniInOut.log
			Set Node11_MAC8023_PORT_10.BroInLogFile = topo1.8023_N11_P10_BroIn.log
			Set Node11_MAC8023_PORT_10.BroOutLogFile = topo1.8023_N11_P10_BroOut.log
			Set Node11_MAC8023_PORT_10.BroInOutLogFile = topo1.8023_N11_P10_BroInOut.log
			Set Node11_MAC8023_PORT_10.CollLogFile = topo1.8023_N11_P10_Coll.log
			Set Node11_MAC8023_PORT_10.DropLogFile = topo1.8023_N11_P10_Drop.log
			Set Node11_MAC8023_PORT_10.InThrputLogFile = topo1.8023_N11_P10_InThrput.log
			Set Node11_MAC8023_PORT_10.OutThrputLogFile = topo1.8023_N11_P10_OutThrput.log
			Set Node11_MAC8023_PORT_10.InOutThrputLogFile = topo1.8023_N11_P10_InOutThrput.log
			Set Node11_MAC8023_PORT_10.LinktoHub = 0

		Module Phy : Node11_Phy_PORT_10
			Set Node11_Phy_PORT_10.Bw = 10
			Set Node11_Phy_PORT_10.BER = 0.0
			Set Node11_Phy_PORT_10.PropDelay = 1
			Set Node11_Phy_PORT_10.linkfail = off
			Set Node11_Phy_PORT_10.linkfailFileName = topo1.phy_N11_P10.linkfail

		Module Link : Node11_PORT_10
			Set Node11_PORT_10.guitag_remotenode = yes


		Bind Node11_MAC8023_PORT_10 Node11_Phy_PORT_10
		Bind Node11_Phy_PORT_10 Node11_PORT_10
	EndDefine

	Define port 11
		Module MAC8023 : Node11_MAC8023_PORT_11

			Set Node11_OFSwitch_0.port11 = Node11_MAC8023_PORT_11
			Set Node11_OFSwitch_0.fixed_net11 = Node11_MAC8023_PORT_11.no
			Set Node11_MAC8023_PORT_11.recvtarget = Node11_OFSwitch_0

			Set Node11_MAC8023_PORT_11.mac = 0:1:0:0:0:4c
			Set Node11_MAC8023_PORT_11.lock_mac = off
			Set Node11_MAC8023_PORT_11.PromisOpt = on
			Set Node11_MAC8023_PORT_11.mode = full
			Set Node11_MAC8023_PORT_11.log = off
			Set Node11_MAC8023_PORT_11.logInterval = 1
			Set Node11_MAC8023_PORT_11.NumCollision = off
			Set Node11_MAC8023_PORT_11.NumUniInPkt = off
			Set Node11_MAC8023_PORT_11.NumUniOutPkt = off
			Set Node11_MAC8023_PORT_11.NumUniInOutPkt = off
			Set Node11_MAC8023_PORT_11.NumBroInPkt = off
			Set Node11_MAC8023_PORT_11.NumBroOutPkt = off
			Set Node11_MAC8023_PORT_11.NumBroInOutPkt = off
			Set Node11_MAC8023_PORT_11.NumDrop = off
			Set Node11_MAC8023_PORT_11.InThrput = off
			Set Node11_MAC8023_PORT_11.OutThrput = off
			Set Node11_MAC8023_PORT_11.InOutThrput = off
			Set Node11_MAC8023_PORT_11.UniInLogFile = topo1.8023_N11_P11_UniIn.log
			Set Node11_MAC8023_PORT_11.UniOutLogFile = topo1.8023_N11_P11_UniOut.log
			Set Node11_MAC8023_PORT_11.UniInOutLogFile = topo1.8023_N11_P11_UniInOut.log
			Set Node11_MAC8023_PORT_11.BroInLogFile = topo1.8023_N11_P11_BroIn.log
			Set Node11_MAC8023_PORT_11.BroOutLogFile = topo1.8023_N11_P11_BroOut.log
			Set Node11_MAC8023_PORT_11.BroInOutLogFile = topo1.8023_N11_P11_BroInOut.log
			Set Node11_MAC8023_PORT_11.CollLogFile = topo1.8023_N11_P11_Coll.log
			Set Node11_MAC8023_PORT_11.DropLogFile = topo1.8023_N11_P11_Drop.log
			Set Node11_MAC8023_PORT_11.InThrputLogFile = topo1.8023_N11_P11_InThrput.log
			Set Node11_MAC8023_PORT_11.OutThrputLogFile = topo1.8023_N11_P11_OutThrput.log
			Set Node11_MAC8023_PORT_11.InOutThrputLogFile = topo1.8023_N11_P11_InOutThrput.log
			Set Node11_MAC8023_PORT_11.LinktoHub = 0

		Module Phy : Node11_Phy_PORT_11
			Set Node11_Phy_PORT_11.Bw = 10
			Set Node11_Phy_PORT_11.BER = 0.0
			Set Node11_Phy_PORT_11.PropDelay = 1
			Set Node11_Phy_PORT_11.linkfail = off
			Set Node11_Phy_PORT_11.linkfailFileName = topo1.phy_N11_P11.linkfail

		Module Link : Node11_PORT_11
			Set Node11_PORT_11.guitag_remotenode = yes


		Bind Node11_MAC8023_PORT_11 Node11_Phy_PORT_11
		Bind Node11_Phy_PORT_11 Node11_PORT_11
	EndDefine

	Define port 12
		Module MAC8023 : Node11_MAC8023_PORT_12

			Set Node11_OFSwitch_0.port12 = Node11_MAC8023_PORT_12
			Set Node11_OFSwitch_0.fixed_net12 = Node11_MAC8023_PORT_12.no
			Set Node11_MAC8023_PORT_12.recvtarget = Node11_OFSwitch_0

			Set Node11_MAC8023_PORT_12.mac = 0:1:0:0:0:4d
			Set Node11_MAC8023_PORT_12.lock_mac = off
			Set Node11_MAC8023_PORT_12.PromisOpt = on
			Set Node11_MAC8023_PORT_12.mode = full
			Set Node11_MAC8023_PORT_12.log = off
			Set Node11_MAC8023_PORT_12.logInterval = 1
			Set Node11_MAC8023_PORT_12.NumCollision = off
			Set Node11_MAC8023_PORT_12.NumUniInPkt = off
			Set Node11_MAC8023_PORT_12.NumUniOutPkt = off
			Set Node11_MAC8023_PORT_12.NumUniInOutPkt = off
			Set Node11_MAC8023_PORT_12.NumBroInPkt = off
			Set Node11_MAC8023_PORT_12.NumBroOutPkt = off
			Set Node11_MAC8023_PORT_12.NumBroInOutPkt = off
			Set Node11_MAC8023_PORT_12.NumDrop = off
			Set Node11_MAC8023_PORT_12.InThrput = off
			Set Node11_MAC8023_PORT_12.OutThrput = off
			Set Node11_MAC8023_PORT_12.InOutThrput = off
			Set Node11_MAC8023_PORT_12.UniInLogFile = topo1.8023_N11_P12_UniIn.log
			Set Node11_MAC8023_PORT_12.UniOutLogFile = topo1.8023_N11_P12_UniOut.log
			Set Node11_MAC8023_PORT_12.UniInOutLogFile = topo1.8023_N11_P12_UniInOut.log
			Set Node11_MAC8023_PORT_12.BroInLogFile = topo1.8023_N11_P12_BroIn.log
			Set Node11_MAC8023_PORT_12.BroOutLogFile = topo1.8023_N11_P12_BroOut.log
			Set Node11_MAC8023_PORT_12.BroInOutLogFile = topo1.8023_N11_P12_BroInOut.log
			Set Node11_MAC8023_PORT_12.CollLogFile = topo1.8023_N11_P12_Coll.log
			Set Node11_MAC8023_PORT_12.DropLogFile = topo1.8023_N11_P12_Drop.log
			Set Node11_MAC8023_PORT_12.InThrputLogFile = topo1.8023_N11_P12_InThrput.log
			Set Node11_MAC8023_PORT_12.OutThrputLogFile = topo1.8023_N11_P12_OutThrput.log
			Set Node11_MAC8023_PORT_12.InOutThrputLogFile = topo1.8023_N11_P12_InOutThrput.log
			Set Node11_MAC8023_PORT_12.LinktoHub = 0

		Module Phy : Node11_Phy_PORT_12
			Set Node11_Phy_PORT_12.Bw = 10
			Set Node11_Phy_PORT_12.BER = 0.0
			Set Node11_Phy_PORT_12.PropDelay = 1
			Set Node11_Phy_PORT_12.linkfail = off
			Set Node11_Phy_PORT_12.linkfailFileName = topo1.phy_N11_P12.linkfail

		Module Link : Node11_PORT_12
			Set Node11_PORT_12.guitag_remotenode = yes


		Bind Node11_MAC8023_PORT_12 Node11_Phy_PORT_12
		Bind Node11_Phy_PORT_12 Node11_PORT_12
	EndDefine

EndCreate

Create Node 12 as OF_SW with name = OF_SW12
	Module OFSwitch : Node12_OFSwitch_0
		Set Node12_OFSwitch_0.guitag_addport = yes
		Set Node12_OFSwitch_0.flow_table_amount = 15
		Set Node12_OFSwitch_0.flow_table_entry_amount = 256
		Set Node12_OFSwitch_0.group_table_entry_amount = 256
		Set Node12_OFSwitch_0.table_miss_buffer_size = 1000
		Set Node12_OFSwitch_0.fifo_queue_size = 50
		Set Node12_OFSwitch_0.controller_ip = 1.0.1.1
	Define port 1
		Module Interface : Node12_Interface_PORT_1

			Set Node12_OFSwitch_0.port1 = Node12_Interface_PORT_1
			Set Node12_OFSwitch_0.fixed_net1 = Node12_Interface_PORT_1.no
			Set Node12_Interface_PORT_1.recvtarget = Node12_OFSwitch_0

			Set Node12_Interface_PORT_1.ip = 1.0.1.7
			Set Node12_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node12_ARP_PORT_1
			Set Node12_ARP_PORT_1.arpMode = RunARP
			Set Node12_ARP_PORT_1.flushInterval = 3000
			Set Node12_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node12_FIFO_PORT_1
			Set Node12_FIFO_PORT_1.max_qlen = 50
			Set Node12_FIFO_PORT_1.log_qlen = off
			Set Node12_FIFO_PORT_1.log_option = FullLog
			Set Node12_FIFO_PORT_1.samplerate = 1
			Set Node12_FIFO_PORT_1.logFileName = topo1.fifo_N12_P1_qlen.log
			Set Node12_FIFO_PORT_1.log_drop = off
			Set Node12_FIFO_PORT_1.drop_samplerate = 1
			Set Node12_FIFO_PORT_1.droplogFileName = topo1.fifo_N12_P1_drop.log

		Module TCPDUMP : Node12_TCPDUMP_PORT_1

		Module MAC8023 : Node12_MAC8023_PORT_1
			Set Node12_MAC8023_PORT_1.mac = 0:1:0:0:0:4e
			Set Node12_MAC8023_PORT_1.lock_mac = off
			Set Node12_MAC8023_PORT_1.PromisOpt = on
			Set Node12_MAC8023_PORT_1.mode = full
			Set Node12_MAC8023_PORT_1.log = off
			Set Node12_MAC8023_PORT_1.logInterval = 1
			Set Node12_MAC8023_PORT_1.NumCollision = off
			Set Node12_MAC8023_PORT_1.NumUniInPkt = off
			Set Node12_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node12_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node12_MAC8023_PORT_1.NumBroInPkt = off
			Set Node12_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node12_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node12_MAC8023_PORT_1.NumDrop = off
			Set Node12_MAC8023_PORT_1.InThrput = off
			Set Node12_MAC8023_PORT_1.OutThrput = off
			Set Node12_MAC8023_PORT_1.InOutThrput = off
			Set Node12_MAC8023_PORT_1.UniInLogFile = topo1.8023_N12_P1_UniIn.log
			Set Node12_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N12_P1_UniOut.log
			Set Node12_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N12_P1_UniInOut.log
			Set Node12_MAC8023_PORT_1.BroInLogFile = topo1.8023_N12_P1_BroIn.log
			Set Node12_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N12_P1_BroOut.log
			Set Node12_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N12_P1_BroInOut.log
			Set Node12_MAC8023_PORT_1.CollLogFile = topo1.8023_N12_P1_Coll.log
			Set Node12_MAC8023_PORT_1.DropLogFile = topo1.8023_N12_P1_Drop.log
			Set Node12_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N12_P1_InThrput.log
			Set Node12_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N12_P1_OutThrput.log
			Set Node12_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N12_P1_InOutThrput.log
			Set Node12_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node12_Phy_PORT_1
			Set Node12_Phy_PORT_1.Bw = 10
			Set Node12_Phy_PORT_1.BER = 0.0
			Set Node12_Phy_PORT_1.PropDelay = 1
			Set Node12_Phy_PORT_1.linkfail = off
			Set Node12_Phy_PORT_1.linkfailFileName = topo1.phy_N12_P1.linkfail

		Module Link : Node12_PORT_1
			Set Node12_PORT_1.guitag_remotenode = yes


		Bind Node12_Interface_PORT_1 Node12_ARP_PORT_1
		Bind Node12_ARP_PORT_1 Node12_FIFO_PORT_1
		Bind Node12_FIFO_PORT_1 Node12_TCPDUMP_PORT_1
		Bind Node12_TCPDUMP_PORT_1 Node12_MAC8023_PORT_1
		Bind Node12_MAC8023_PORT_1 Node12_Phy_PORT_1
		Bind Node12_Phy_PORT_1 Node12_PORT_1
	EndDefine

	Define port 2
		Module MAC8023 : Node12_MAC8023_PORT_2

			Set Node12_OFSwitch_0.port2 = Node12_MAC8023_PORT_2
			Set Node12_OFSwitch_0.fixed_net2 = Node12_MAC8023_PORT_2.no
			Set Node12_MAC8023_PORT_2.recvtarget = Node12_OFSwitch_0

			Set Node12_MAC8023_PORT_2.mac = 0:1:0:0:0:4f
			Set Node12_MAC8023_PORT_2.lock_mac = off
			Set Node12_MAC8023_PORT_2.PromisOpt = on
			Set Node12_MAC8023_PORT_2.mode = full
			Set Node12_MAC8023_PORT_2.log = off
			Set Node12_MAC8023_PORT_2.logInterval = 1
			Set Node12_MAC8023_PORT_2.NumCollision = off
			Set Node12_MAC8023_PORT_2.NumUniInPkt = off
			Set Node12_MAC8023_PORT_2.NumUniOutPkt = off
			Set Node12_MAC8023_PORT_2.NumUniInOutPkt = off
			Set Node12_MAC8023_PORT_2.NumBroInPkt = off
			Set Node12_MAC8023_PORT_2.NumBroOutPkt = off
			Set Node12_MAC8023_PORT_2.NumBroInOutPkt = off
			Set Node12_MAC8023_PORT_2.NumDrop = off
			Set Node12_MAC8023_PORT_2.InThrput = off
			Set Node12_MAC8023_PORT_2.OutThrput = off
			Set Node12_MAC8023_PORT_2.InOutThrput = off
			Set Node12_MAC8023_PORT_2.UniInLogFile = topo1.8023_N12_P2_UniIn.log
			Set Node12_MAC8023_PORT_2.UniOutLogFile = topo1.8023_N12_P2_UniOut.log
			Set Node12_MAC8023_PORT_2.UniInOutLogFile = topo1.8023_N12_P2_UniInOut.log
			Set Node12_MAC8023_PORT_2.BroInLogFile = topo1.8023_N12_P2_BroIn.log
			Set Node12_MAC8023_PORT_2.BroOutLogFile = topo1.8023_N12_P2_BroOut.log
			Set Node12_MAC8023_PORT_2.BroInOutLogFile = topo1.8023_N12_P2_BroInOut.log
			Set Node12_MAC8023_PORT_2.CollLogFile = topo1.8023_N12_P2_Coll.log
			Set Node12_MAC8023_PORT_2.DropLogFile = topo1.8023_N12_P2_Drop.log
			Set Node12_MAC8023_PORT_2.InThrputLogFile = topo1.8023_N12_P2_InThrput.log
			Set Node12_MAC8023_PORT_2.OutThrputLogFile = topo1.8023_N12_P2_OutThrput.log
			Set Node12_MAC8023_PORT_2.InOutThrputLogFile = topo1.8023_N12_P2_InOutThrput.log
			Set Node12_MAC8023_PORT_2.LinktoHub = 0

		Module Phy : Node12_Phy_PORT_2
			Set Node12_Phy_PORT_2.Bw = 10
			Set Node12_Phy_PORT_2.BER = 0.0
			Set Node12_Phy_PORT_2.PropDelay = 1
			Set Node12_Phy_PORT_2.linkfail = off
			Set Node12_Phy_PORT_2.linkfailFileName = topo1.phy_N12_P2.linkfail

		Module Link : Node12_PORT_2
			Set Node12_PORT_2.guitag_remotenode = yes


		Bind Node12_MAC8023_PORT_2 Node12_Phy_PORT_2
		Bind Node12_Phy_PORT_2 Node12_PORT_2
	EndDefine

	Define port 3
		Module MAC8023 : Node12_MAC8023_PORT_3

			Set Node12_OFSwitch_0.port3 = Node12_MAC8023_PORT_3
			Set Node12_OFSwitch_0.fixed_net3 = Node12_MAC8023_PORT_3.no
			Set Node12_MAC8023_PORT_3.recvtarget = Node12_OFSwitch_0

			Set Node12_MAC8023_PORT_3.mac = 0:1:0:0:0:50
			Set Node12_MAC8023_PORT_3.lock_mac = off
			Set Node12_MAC8023_PORT_3.PromisOpt = on
			Set Node12_MAC8023_PORT_3.mode = full
			Set Node12_MAC8023_PORT_3.log = off
			Set Node12_MAC8023_PORT_3.logInterval = 1
			Set Node12_MAC8023_PORT_3.NumCollision = off
			Set Node12_MAC8023_PORT_3.NumUniInPkt = off
			Set Node12_MAC8023_PORT_3.NumUniOutPkt = off
			Set Node12_MAC8023_PORT_3.NumUniInOutPkt = off
			Set Node12_MAC8023_PORT_3.NumBroInPkt = off
			Set Node12_MAC8023_PORT_3.NumBroOutPkt = off
			Set Node12_MAC8023_PORT_3.NumBroInOutPkt = off
			Set Node12_MAC8023_PORT_3.NumDrop = off
			Set Node12_MAC8023_PORT_3.InThrput = off
			Set Node12_MAC8023_PORT_3.OutThrput = off
			Set Node12_MAC8023_PORT_3.InOutThrput = off
			Set Node12_MAC8023_PORT_3.UniInLogFile = topo1.8023_N12_P3_UniIn.log
			Set Node12_MAC8023_PORT_3.UniOutLogFile = topo1.8023_N12_P3_UniOut.log
			Set Node12_MAC8023_PORT_3.UniInOutLogFile = topo1.8023_N12_P3_UniInOut.log
			Set Node12_MAC8023_PORT_3.BroInLogFile = topo1.8023_N12_P3_BroIn.log
			Set Node12_MAC8023_PORT_3.BroOutLogFile = topo1.8023_N12_P3_BroOut.log
			Set Node12_MAC8023_PORT_3.BroInOutLogFile = topo1.8023_N12_P3_BroInOut.log
			Set Node12_MAC8023_PORT_3.CollLogFile = topo1.8023_N12_P3_Coll.log
			Set Node12_MAC8023_PORT_3.DropLogFile = topo1.8023_N12_P3_Drop.log
			Set Node12_MAC8023_PORT_3.InThrputLogFile = topo1.8023_N12_P3_InThrput.log
			Set Node12_MAC8023_PORT_3.OutThrputLogFile = topo1.8023_N12_P3_OutThrput.log
			Set Node12_MAC8023_PORT_3.InOutThrputLogFile = topo1.8023_N12_P3_InOutThrput.log
			Set Node12_MAC8023_PORT_3.LinktoHub = 0

		Module Phy : Node12_Phy_PORT_3
			Set Node12_Phy_PORT_3.Bw = 10
			Set Node12_Phy_PORT_3.BER = 0.0
			Set Node12_Phy_PORT_3.PropDelay = 1
			Set Node12_Phy_PORT_3.linkfail = off
			Set Node12_Phy_PORT_3.linkfailFileName = topo1.phy_N12_P3.linkfail

		Module Link : Node12_PORT_3
			Set Node12_PORT_3.guitag_remotenode = yes


		Bind Node12_MAC8023_PORT_3 Node12_Phy_PORT_3
		Bind Node12_Phy_PORT_3 Node12_PORT_3
	EndDefine

	Define port 4
		Module MAC8023 : Node12_MAC8023_PORT_4

			Set Node12_OFSwitch_0.port4 = Node12_MAC8023_PORT_4
			Set Node12_OFSwitch_0.fixed_net4 = Node12_MAC8023_PORT_4.no
			Set Node12_MAC8023_PORT_4.recvtarget = Node12_OFSwitch_0

			Set Node12_MAC8023_PORT_4.mac = 0:1:0:0:0:51
			Set Node12_MAC8023_PORT_4.lock_mac = off
			Set Node12_MAC8023_PORT_4.PromisOpt = on
			Set Node12_MAC8023_PORT_4.mode = full
			Set Node12_MAC8023_PORT_4.log = off
			Set Node12_MAC8023_PORT_4.logInterval = 1
			Set Node12_MAC8023_PORT_4.NumCollision = off
			Set Node12_MAC8023_PORT_4.NumUniInPkt = off
			Set Node12_MAC8023_PORT_4.NumUniOutPkt = off
			Set Node12_MAC8023_PORT_4.NumUniInOutPkt = off
			Set Node12_MAC8023_PORT_4.NumBroInPkt = off
			Set Node12_MAC8023_PORT_4.NumBroOutPkt = off
			Set Node12_MAC8023_PORT_4.NumBroInOutPkt = off
			Set Node12_MAC8023_PORT_4.NumDrop = off
			Set Node12_MAC8023_PORT_4.InThrput = off
			Set Node12_MAC8023_PORT_4.OutThrput = off
			Set Node12_MAC8023_PORT_4.InOutThrput = off
			Set Node12_MAC8023_PORT_4.UniInLogFile = topo1.8023_N12_P4_UniIn.log
			Set Node12_MAC8023_PORT_4.UniOutLogFile = topo1.8023_N12_P4_UniOut.log
			Set Node12_MAC8023_PORT_4.UniInOutLogFile = topo1.8023_N12_P4_UniInOut.log
			Set Node12_MAC8023_PORT_4.BroInLogFile = topo1.8023_N12_P4_BroIn.log
			Set Node12_MAC8023_PORT_4.BroOutLogFile = topo1.8023_N12_P4_BroOut.log
			Set Node12_MAC8023_PORT_4.BroInOutLogFile = topo1.8023_N12_P4_BroInOut.log
			Set Node12_MAC8023_PORT_4.CollLogFile = topo1.8023_N12_P4_Coll.log
			Set Node12_MAC8023_PORT_4.DropLogFile = topo1.8023_N12_P4_Drop.log
			Set Node12_MAC8023_PORT_4.InThrputLogFile = topo1.8023_N12_P4_InThrput.log
			Set Node12_MAC8023_PORT_4.OutThrputLogFile = topo1.8023_N12_P4_OutThrput.log
			Set Node12_MAC8023_PORT_4.InOutThrputLogFile = topo1.8023_N12_P4_InOutThrput.log
			Set Node12_MAC8023_PORT_4.LinktoHub = 0

		Module Phy : Node12_Phy_PORT_4
			Set Node12_Phy_PORT_4.Bw = 10
			Set Node12_Phy_PORT_4.BER = 0.0
			Set Node12_Phy_PORT_4.PropDelay = 1
			Set Node12_Phy_PORT_4.linkfail = off
			Set Node12_Phy_PORT_4.linkfailFileName = topo1.phy_N12_P4.linkfail

		Module Link : Node12_PORT_4
			Set Node12_PORT_4.guitag_remotenode = yes


		Bind Node12_MAC8023_PORT_4 Node12_Phy_PORT_4
		Bind Node12_Phy_PORT_4 Node12_PORT_4
	EndDefine

	Define port 5
		Module MAC8023 : Node12_MAC8023_PORT_5

			Set Node12_OFSwitch_0.port5 = Node12_MAC8023_PORT_5
			Set Node12_OFSwitch_0.fixed_net5 = Node12_MAC8023_PORT_5.no
			Set Node12_MAC8023_PORT_5.recvtarget = Node12_OFSwitch_0

			Set Node12_MAC8023_PORT_5.mac = 0:1:0:0:0:52
			Set Node12_MAC8023_PORT_5.lock_mac = off
			Set Node12_MAC8023_PORT_5.PromisOpt = on
			Set Node12_MAC8023_PORT_5.mode = full
			Set Node12_MAC8023_PORT_5.log = off
			Set Node12_MAC8023_PORT_5.logInterval = 1
			Set Node12_MAC8023_PORT_5.NumCollision = off
			Set Node12_MAC8023_PORT_5.NumUniInPkt = off
			Set Node12_MAC8023_PORT_5.NumUniOutPkt = off
			Set Node12_MAC8023_PORT_5.NumUniInOutPkt = off
			Set Node12_MAC8023_PORT_5.NumBroInPkt = off
			Set Node12_MAC8023_PORT_5.NumBroOutPkt = off
			Set Node12_MAC8023_PORT_5.NumBroInOutPkt = off
			Set Node12_MAC8023_PORT_5.NumDrop = off
			Set Node12_MAC8023_PORT_5.InThrput = off
			Set Node12_MAC8023_PORT_5.OutThrput = off
			Set Node12_MAC8023_PORT_5.InOutThrput = off
			Set Node12_MAC8023_PORT_5.UniInLogFile = topo1.8023_N12_P5_UniIn.log
			Set Node12_MAC8023_PORT_5.UniOutLogFile = topo1.8023_N12_P5_UniOut.log
			Set Node12_MAC8023_PORT_5.UniInOutLogFile = topo1.8023_N12_P5_UniInOut.log
			Set Node12_MAC8023_PORT_5.BroInLogFile = topo1.8023_N12_P5_BroIn.log
			Set Node12_MAC8023_PORT_5.BroOutLogFile = topo1.8023_N12_P5_BroOut.log
			Set Node12_MAC8023_PORT_5.BroInOutLogFile = topo1.8023_N12_P5_BroInOut.log
			Set Node12_MAC8023_PORT_5.CollLogFile = topo1.8023_N12_P5_Coll.log
			Set Node12_MAC8023_PORT_5.DropLogFile = topo1.8023_N12_P5_Drop.log
			Set Node12_MAC8023_PORT_5.InThrputLogFile = topo1.8023_N12_P5_InThrput.log
			Set Node12_MAC8023_PORT_5.OutThrputLogFile = topo1.8023_N12_P5_OutThrput.log
			Set Node12_MAC8023_PORT_5.InOutThrputLogFile = topo1.8023_N12_P5_InOutThrput.log
			Set Node12_MAC8023_PORT_5.LinktoHub = 0

		Module Phy : Node12_Phy_PORT_5
			Set Node12_Phy_PORT_5.Bw = 10
			Set Node12_Phy_PORT_5.BER = 0.0
			Set Node12_Phy_PORT_5.PropDelay = 1
			Set Node12_Phy_PORT_5.linkfail = off
			Set Node12_Phy_PORT_5.linkfailFileName = topo1.phy_N12_P5.linkfail

		Module Link : Node12_PORT_5
			Set Node12_PORT_5.guitag_remotenode = yes


		Bind Node12_MAC8023_PORT_5 Node12_Phy_PORT_5
		Bind Node12_Phy_PORT_5 Node12_PORT_5
	EndDefine

	Define port 6
		Module MAC8023 : Node12_MAC8023_PORT_6

			Set Node12_OFSwitch_0.port6 = Node12_MAC8023_PORT_6
			Set Node12_OFSwitch_0.fixed_net6 = Node12_MAC8023_PORT_6.no
			Set Node12_MAC8023_PORT_6.recvtarget = Node12_OFSwitch_0

			Set Node12_MAC8023_PORT_6.mac = 0:1:0:0:0:53
			Set Node12_MAC8023_PORT_6.lock_mac = off
			Set Node12_MAC8023_PORT_6.PromisOpt = on
			Set Node12_MAC8023_PORT_6.mode = full
			Set Node12_MAC8023_PORT_6.log = off
			Set Node12_MAC8023_PORT_6.logInterval = 1
			Set Node12_MAC8023_PORT_6.NumCollision = off
			Set Node12_MAC8023_PORT_6.NumUniInPkt = off
			Set Node12_MAC8023_PORT_6.NumUniOutPkt = off
			Set Node12_MAC8023_PORT_6.NumUniInOutPkt = off
			Set Node12_MAC8023_PORT_6.NumBroInPkt = off
			Set Node12_MAC8023_PORT_6.NumBroOutPkt = off
			Set Node12_MAC8023_PORT_6.NumBroInOutPkt = off
			Set Node12_MAC8023_PORT_6.NumDrop = off
			Set Node12_MAC8023_PORT_6.InThrput = off
			Set Node12_MAC8023_PORT_6.OutThrput = off
			Set Node12_MAC8023_PORT_6.InOutThrput = off
			Set Node12_MAC8023_PORT_6.UniInLogFile = topo1.8023_N12_P6_UniIn.log
			Set Node12_MAC8023_PORT_6.UniOutLogFile = topo1.8023_N12_P6_UniOut.log
			Set Node12_MAC8023_PORT_6.UniInOutLogFile = topo1.8023_N12_P6_UniInOut.log
			Set Node12_MAC8023_PORT_6.BroInLogFile = topo1.8023_N12_P6_BroIn.log
			Set Node12_MAC8023_PORT_6.BroOutLogFile = topo1.8023_N12_P6_BroOut.log
			Set Node12_MAC8023_PORT_6.BroInOutLogFile = topo1.8023_N12_P6_BroInOut.log
			Set Node12_MAC8023_PORT_6.CollLogFile = topo1.8023_N12_P6_Coll.log
			Set Node12_MAC8023_PORT_6.DropLogFile = topo1.8023_N12_P6_Drop.log
			Set Node12_MAC8023_PORT_6.InThrputLogFile = topo1.8023_N12_P6_InThrput.log
			Set Node12_MAC8023_PORT_6.OutThrputLogFile = topo1.8023_N12_P6_OutThrput.log
			Set Node12_MAC8023_PORT_6.InOutThrputLogFile = topo1.8023_N12_P6_InOutThrput.log
			Set Node12_MAC8023_PORT_6.LinktoHub = 0

		Module Phy : Node12_Phy_PORT_6
			Set Node12_Phy_PORT_6.Bw = 10
			Set Node12_Phy_PORT_6.BER = 0.0
			Set Node12_Phy_PORT_6.PropDelay = 1
			Set Node12_Phy_PORT_6.linkfail = off
			Set Node12_Phy_PORT_6.linkfailFileName = topo1.phy_N12_P6.linkfail

		Module Link : Node12_PORT_6
			Set Node12_PORT_6.guitag_remotenode = yes


		Bind Node12_MAC8023_PORT_6 Node12_Phy_PORT_6
		Bind Node12_Phy_PORT_6 Node12_PORT_6
	EndDefine

	Define port 7
		Module MAC8023 : Node12_MAC8023_PORT_7

			Set Node12_OFSwitch_0.port7 = Node12_MAC8023_PORT_7
			Set Node12_OFSwitch_0.fixed_net7 = Node12_MAC8023_PORT_7.no
			Set Node12_MAC8023_PORT_7.recvtarget = Node12_OFSwitch_0

			Set Node12_MAC8023_PORT_7.mac = 0:1:0:0:0:54
			Set Node12_MAC8023_PORT_7.lock_mac = off
			Set Node12_MAC8023_PORT_7.PromisOpt = on
			Set Node12_MAC8023_PORT_7.mode = full
			Set Node12_MAC8023_PORT_7.log = off
			Set Node12_MAC8023_PORT_7.logInterval = 1
			Set Node12_MAC8023_PORT_7.NumCollision = off
			Set Node12_MAC8023_PORT_7.NumUniInPkt = off
			Set Node12_MAC8023_PORT_7.NumUniOutPkt = off
			Set Node12_MAC8023_PORT_7.NumUniInOutPkt = off
			Set Node12_MAC8023_PORT_7.NumBroInPkt = off
			Set Node12_MAC8023_PORT_7.NumBroOutPkt = off
			Set Node12_MAC8023_PORT_7.NumBroInOutPkt = off
			Set Node12_MAC8023_PORT_7.NumDrop = off
			Set Node12_MAC8023_PORT_7.InThrput = off
			Set Node12_MAC8023_PORT_7.OutThrput = off
			Set Node12_MAC8023_PORT_7.InOutThrput = off
			Set Node12_MAC8023_PORT_7.UniInLogFile = topo1.8023_N12_P7_UniIn.log
			Set Node12_MAC8023_PORT_7.UniOutLogFile = topo1.8023_N12_P7_UniOut.log
			Set Node12_MAC8023_PORT_7.UniInOutLogFile = topo1.8023_N12_P7_UniInOut.log
			Set Node12_MAC8023_PORT_7.BroInLogFile = topo1.8023_N12_P7_BroIn.log
			Set Node12_MAC8023_PORT_7.BroOutLogFile = topo1.8023_N12_P7_BroOut.log
			Set Node12_MAC8023_PORT_7.BroInOutLogFile = topo1.8023_N12_P7_BroInOut.log
			Set Node12_MAC8023_PORT_7.CollLogFile = topo1.8023_N12_P7_Coll.log
			Set Node12_MAC8023_PORT_7.DropLogFile = topo1.8023_N12_P7_Drop.log
			Set Node12_MAC8023_PORT_7.InThrputLogFile = topo1.8023_N12_P7_InThrput.log
			Set Node12_MAC8023_PORT_7.OutThrputLogFile = topo1.8023_N12_P7_OutThrput.log
			Set Node12_MAC8023_PORT_7.InOutThrputLogFile = topo1.8023_N12_P7_InOutThrput.log
			Set Node12_MAC8023_PORT_7.LinktoHub = 0

		Module Phy : Node12_Phy_PORT_7
			Set Node12_Phy_PORT_7.Bw = 10
			Set Node12_Phy_PORT_7.BER = 0.0
			Set Node12_Phy_PORT_7.PropDelay = 1
			Set Node12_Phy_PORT_7.linkfail = off
			Set Node12_Phy_PORT_7.linkfailFileName = topo1.phy_N12_P7.linkfail

		Module Link : Node12_PORT_7
			Set Node12_PORT_7.guitag_remotenode = yes


		Bind Node12_MAC8023_PORT_7 Node12_Phy_PORT_7
		Bind Node12_Phy_PORT_7 Node12_PORT_7
	EndDefine

	Define port 8
		Module MAC8023 : Node12_MAC8023_PORT_8

			Set Node12_OFSwitch_0.port8 = Node12_MAC8023_PORT_8
			Set Node12_OFSwitch_0.fixed_net8 = Node12_MAC8023_PORT_8.no
			Set Node12_MAC8023_PORT_8.recvtarget = Node12_OFSwitch_0

			Set Node12_MAC8023_PORT_8.mac = 0:1:0:0:0:55
			Set Node12_MAC8023_PORT_8.lock_mac = off
			Set Node12_MAC8023_PORT_8.PromisOpt = on
			Set Node12_MAC8023_PORT_8.mode = full
			Set Node12_MAC8023_PORT_8.log = off
			Set Node12_MAC8023_PORT_8.logInterval = 1
			Set Node12_MAC8023_PORT_8.NumCollision = off
			Set Node12_MAC8023_PORT_8.NumUniInPkt = off
			Set Node12_MAC8023_PORT_8.NumUniOutPkt = off
			Set Node12_MAC8023_PORT_8.NumUniInOutPkt = off
			Set Node12_MAC8023_PORT_8.NumBroInPkt = off
			Set Node12_MAC8023_PORT_8.NumBroOutPkt = off
			Set Node12_MAC8023_PORT_8.NumBroInOutPkt = off
			Set Node12_MAC8023_PORT_8.NumDrop = off
			Set Node12_MAC8023_PORT_8.InThrput = off
			Set Node12_MAC8023_PORT_8.OutThrput = off
			Set Node12_MAC8023_PORT_8.InOutThrput = off
			Set Node12_MAC8023_PORT_8.UniInLogFile = topo1.8023_N12_P8_UniIn.log
			Set Node12_MAC8023_PORT_8.UniOutLogFile = topo1.8023_N12_P8_UniOut.log
			Set Node12_MAC8023_PORT_8.UniInOutLogFile = topo1.8023_N12_P8_UniInOut.log
			Set Node12_MAC8023_PORT_8.BroInLogFile = topo1.8023_N12_P8_BroIn.log
			Set Node12_MAC8023_PORT_8.BroOutLogFile = topo1.8023_N12_P8_BroOut.log
			Set Node12_MAC8023_PORT_8.BroInOutLogFile = topo1.8023_N12_P8_BroInOut.log
			Set Node12_MAC8023_PORT_8.CollLogFile = topo1.8023_N12_P8_Coll.log
			Set Node12_MAC8023_PORT_8.DropLogFile = topo1.8023_N12_P8_Drop.log
			Set Node12_MAC8023_PORT_8.InThrputLogFile = topo1.8023_N12_P8_InThrput.log
			Set Node12_MAC8023_PORT_8.OutThrputLogFile = topo1.8023_N12_P8_OutThrput.log
			Set Node12_MAC8023_PORT_8.InOutThrputLogFile = topo1.8023_N12_P8_InOutThrput.log
			Set Node12_MAC8023_PORT_8.LinktoHub = 0

		Module Phy : Node12_Phy_PORT_8
			Set Node12_Phy_PORT_8.Bw = 10
			Set Node12_Phy_PORT_8.BER = 0.0
			Set Node12_Phy_PORT_8.PropDelay = 1
			Set Node12_Phy_PORT_8.linkfail = off
			Set Node12_Phy_PORT_8.linkfailFileName = topo1.phy_N12_P8.linkfail

		Module Link : Node12_PORT_8
			Set Node12_PORT_8.guitag_remotenode = yes


		Bind Node12_MAC8023_PORT_8 Node12_Phy_PORT_8
		Bind Node12_Phy_PORT_8 Node12_PORT_8
	EndDefine

	Define port 9
		Module MAC8023 : Node12_MAC8023_PORT_9

			Set Node12_OFSwitch_0.port9 = Node12_MAC8023_PORT_9
			Set Node12_OFSwitch_0.fixed_net9 = Node12_MAC8023_PORT_9.no
			Set Node12_MAC8023_PORT_9.recvtarget = Node12_OFSwitch_0

			Set Node12_MAC8023_PORT_9.mac = 0:1:0:0:0:56
			Set Node12_MAC8023_PORT_9.lock_mac = off
			Set Node12_MAC8023_PORT_9.PromisOpt = on
			Set Node12_MAC8023_PORT_9.mode = full
			Set Node12_MAC8023_PORT_9.log = off
			Set Node12_MAC8023_PORT_9.logInterval = 1
			Set Node12_MAC8023_PORT_9.NumCollision = off
			Set Node12_MAC8023_PORT_9.NumUniInPkt = off
			Set Node12_MAC8023_PORT_9.NumUniOutPkt = off
			Set Node12_MAC8023_PORT_9.NumUniInOutPkt = off
			Set Node12_MAC8023_PORT_9.NumBroInPkt = off
			Set Node12_MAC8023_PORT_9.NumBroOutPkt = off
			Set Node12_MAC8023_PORT_9.NumBroInOutPkt = off
			Set Node12_MAC8023_PORT_9.NumDrop = off
			Set Node12_MAC8023_PORT_9.InThrput = off
			Set Node12_MAC8023_PORT_9.OutThrput = off
			Set Node12_MAC8023_PORT_9.InOutThrput = off
			Set Node12_MAC8023_PORT_9.UniInLogFile = topo1.8023_N12_P9_UniIn.log
			Set Node12_MAC8023_PORT_9.UniOutLogFile = topo1.8023_N12_P9_UniOut.log
			Set Node12_MAC8023_PORT_9.UniInOutLogFile = topo1.8023_N12_P9_UniInOut.log
			Set Node12_MAC8023_PORT_9.BroInLogFile = topo1.8023_N12_P9_BroIn.log
			Set Node12_MAC8023_PORT_9.BroOutLogFile = topo1.8023_N12_P9_BroOut.log
			Set Node12_MAC8023_PORT_9.BroInOutLogFile = topo1.8023_N12_P9_BroInOut.log
			Set Node12_MAC8023_PORT_9.CollLogFile = topo1.8023_N12_P9_Coll.log
			Set Node12_MAC8023_PORT_9.DropLogFile = topo1.8023_N12_P9_Drop.log
			Set Node12_MAC8023_PORT_9.InThrputLogFile = topo1.8023_N12_P9_InThrput.log
			Set Node12_MAC8023_PORT_9.OutThrputLogFile = topo1.8023_N12_P9_OutThrput.log
			Set Node12_MAC8023_PORT_9.InOutThrputLogFile = topo1.8023_N12_P9_InOutThrput.log
			Set Node12_MAC8023_PORT_9.LinktoHub = 0

		Module Phy : Node12_Phy_PORT_9
			Set Node12_Phy_PORT_9.Bw = 10
			Set Node12_Phy_PORT_9.BER = 0.0
			Set Node12_Phy_PORT_9.PropDelay = 1
			Set Node12_Phy_PORT_9.linkfail = off
			Set Node12_Phy_PORT_9.linkfailFileName = topo1.phy_N12_P9.linkfail

		Module Link : Node12_PORT_9
			Set Node12_PORT_9.guitag_remotenode = yes


		Bind Node12_MAC8023_PORT_9 Node12_Phy_PORT_9
		Bind Node12_Phy_PORT_9 Node12_PORT_9
	EndDefine

	Define port 10
		Module MAC8023 : Node12_MAC8023_PORT_10

			Set Node12_OFSwitch_0.port10 = Node12_MAC8023_PORT_10
			Set Node12_OFSwitch_0.fixed_net10 = Node12_MAC8023_PORT_10.no
			Set Node12_MAC8023_PORT_10.recvtarget = Node12_OFSwitch_0

			Set Node12_MAC8023_PORT_10.mac = 0:1:0:0:0:57
			Set Node12_MAC8023_PORT_10.lock_mac = off
			Set Node12_MAC8023_PORT_10.PromisOpt = on
			Set Node12_MAC8023_PORT_10.mode = full
			Set Node12_MAC8023_PORT_10.log = off
			Set Node12_MAC8023_PORT_10.logInterval = 1
			Set Node12_MAC8023_PORT_10.NumCollision = off
			Set Node12_MAC8023_PORT_10.NumUniInPkt = off
			Set Node12_MAC8023_PORT_10.NumUniOutPkt = off
			Set Node12_MAC8023_PORT_10.NumUniInOutPkt = off
			Set Node12_MAC8023_PORT_10.NumBroInPkt = off
			Set Node12_MAC8023_PORT_10.NumBroOutPkt = off
			Set Node12_MAC8023_PORT_10.NumBroInOutPkt = off
			Set Node12_MAC8023_PORT_10.NumDrop = off
			Set Node12_MAC8023_PORT_10.InThrput = off
			Set Node12_MAC8023_PORT_10.OutThrput = off
			Set Node12_MAC8023_PORT_10.InOutThrput = off
			Set Node12_MAC8023_PORT_10.UniInLogFile = topo1.8023_N12_P10_UniIn.log
			Set Node12_MAC8023_PORT_10.UniOutLogFile = topo1.8023_N12_P10_UniOut.log
			Set Node12_MAC8023_PORT_10.UniInOutLogFile = topo1.8023_N12_P10_UniInOut.log
			Set Node12_MAC8023_PORT_10.BroInLogFile = topo1.8023_N12_P10_BroIn.log
			Set Node12_MAC8023_PORT_10.BroOutLogFile = topo1.8023_N12_P10_BroOut.log
			Set Node12_MAC8023_PORT_10.BroInOutLogFile = topo1.8023_N12_P10_BroInOut.log
			Set Node12_MAC8023_PORT_10.CollLogFile = topo1.8023_N12_P10_Coll.log
			Set Node12_MAC8023_PORT_10.DropLogFile = topo1.8023_N12_P10_Drop.log
			Set Node12_MAC8023_PORT_10.InThrputLogFile = topo1.8023_N12_P10_InThrput.log
			Set Node12_MAC8023_PORT_10.OutThrputLogFile = topo1.8023_N12_P10_OutThrput.log
			Set Node12_MAC8023_PORT_10.InOutThrputLogFile = topo1.8023_N12_P10_InOutThrput.log
			Set Node12_MAC8023_PORT_10.LinktoHub = 0

		Module Phy : Node12_Phy_PORT_10
			Set Node12_Phy_PORT_10.Bw = 10
			Set Node12_Phy_PORT_10.BER = 0.0
			Set Node12_Phy_PORT_10.PropDelay = 1
			Set Node12_Phy_PORT_10.linkfail = off
			Set Node12_Phy_PORT_10.linkfailFileName = topo1.phy_N12_P10.linkfail

		Module Link : Node12_PORT_10
			Set Node12_PORT_10.guitag_remotenode = yes


		Bind Node12_MAC8023_PORT_10 Node12_Phy_PORT_10
		Bind Node12_Phy_PORT_10 Node12_PORT_10
	EndDefine

	Define port 11
		Module MAC8023 : Node12_MAC8023_PORT_11

			Set Node12_OFSwitch_0.port11 = Node12_MAC8023_PORT_11
			Set Node12_OFSwitch_0.fixed_net11 = Node12_MAC8023_PORT_11.no
			Set Node12_MAC8023_PORT_11.recvtarget = Node12_OFSwitch_0

			Set Node12_MAC8023_PORT_11.mac = 0:1:0:0:0:58
			Set Node12_MAC8023_PORT_11.lock_mac = off
			Set Node12_MAC8023_PORT_11.PromisOpt = on
			Set Node12_MAC8023_PORT_11.mode = full
			Set Node12_MAC8023_PORT_11.log = off
			Set Node12_MAC8023_PORT_11.logInterval = 1
			Set Node12_MAC8023_PORT_11.NumCollision = off
			Set Node12_MAC8023_PORT_11.NumUniInPkt = off
			Set Node12_MAC8023_PORT_11.NumUniOutPkt = off
			Set Node12_MAC8023_PORT_11.NumUniInOutPkt = off
			Set Node12_MAC8023_PORT_11.NumBroInPkt = off
			Set Node12_MAC8023_PORT_11.NumBroOutPkt = off
			Set Node12_MAC8023_PORT_11.NumBroInOutPkt = off
			Set Node12_MAC8023_PORT_11.NumDrop = off
			Set Node12_MAC8023_PORT_11.InThrput = off
			Set Node12_MAC8023_PORT_11.OutThrput = off
			Set Node12_MAC8023_PORT_11.InOutThrput = off
			Set Node12_MAC8023_PORT_11.UniInLogFile = topo1.8023_N12_P11_UniIn.log
			Set Node12_MAC8023_PORT_11.UniOutLogFile = topo1.8023_N12_P11_UniOut.log
			Set Node12_MAC8023_PORT_11.UniInOutLogFile = topo1.8023_N12_P11_UniInOut.log
			Set Node12_MAC8023_PORT_11.BroInLogFile = topo1.8023_N12_P11_BroIn.log
			Set Node12_MAC8023_PORT_11.BroOutLogFile = topo1.8023_N12_P11_BroOut.log
			Set Node12_MAC8023_PORT_11.BroInOutLogFile = topo1.8023_N12_P11_BroInOut.log
			Set Node12_MAC8023_PORT_11.CollLogFile = topo1.8023_N12_P11_Coll.log
			Set Node12_MAC8023_PORT_11.DropLogFile = topo1.8023_N12_P11_Drop.log
			Set Node12_MAC8023_PORT_11.InThrputLogFile = topo1.8023_N12_P11_InThrput.log
			Set Node12_MAC8023_PORT_11.OutThrputLogFile = topo1.8023_N12_P11_OutThrput.log
			Set Node12_MAC8023_PORT_11.InOutThrputLogFile = topo1.8023_N12_P11_InOutThrput.log
			Set Node12_MAC8023_PORT_11.LinktoHub = 0

		Module Phy : Node12_Phy_PORT_11
			Set Node12_Phy_PORT_11.Bw = 10
			Set Node12_Phy_PORT_11.BER = 0.0
			Set Node12_Phy_PORT_11.PropDelay = 1
			Set Node12_Phy_PORT_11.linkfail = off
			Set Node12_Phy_PORT_11.linkfailFileName = topo1.phy_N12_P11.linkfail

		Module Link : Node12_PORT_11
			Set Node12_PORT_11.guitag_remotenode = yes


		Bind Node12_MAC8023_PORT_11 Node12_Phy_PORT_11
		Bind Node12_Phy_PORT_11 Node12_PORT_11
	EndDefine

	Define port 12
		Module MAC8023 : Node12_MAC8023_PORT_12

			Set Node12_OFSwitch_0.port12 = Node12_MAC8023_PORT_12
			Set Node12_OFSwitch_0.fixed_net12 = Node12_MAC8023_PORT_12.no
			Set Node12_MAC8023_PORT_12.recvtarget = Node12_OFSwitch_0

			Set Node12_MAC8023_PORT_12.mac = 0:1:0:0:0:59
			Set Node12_MAC8023_PORT_12.lock_mac = off
			Set Node12_MAC8023_PORT_12.PromisOpt = on
			Set Node12_MAC8023_PORT_12.mode = full
			Set Node12_MAC8023_PORT_12.log = off
			Set Node12_MAC8023_PORT_12.logInterval = 1
			Set Node12_MAC8023_PORT_12.NumCollision = off
			Set Node12_MAC8023_PORT_12.NumUniInPkt = off
			Set Node12_MAC8023_PORT_12.NumUniOutPkt = off
			Set Node12_MAC8023_PORT_12.NumUniInOutPkt = off
			Set Node12_MAC8023_PORT_12.NumBroInPkt = off
			Set Node12_MAC8023_PORT_12.NumBroOutPkt = off
			Set Node12_MAC8023_PORT_12.NumBroInOutPkt = off
			Set Node12_MAC8023_PORT_12.NumDrop = off
			Set Node12_MAC8023_PORT_12.InThrput = off
			Set Node12_MAC8023_PORT_12.OutThrput = off
			Set Node12_MAC8023_PORT_12.InOutThrput = off
			Set Node12_MAC8023_PORT_12.UniInLogFile = topo1.8023_N12_P12_UniIn.log
			Set Node12_MAC8023_PORT_12.UniOutLogFile = topo1.8023_N12_P12_UniOut.log
			Set Node12_MAC8023_PORT_12.UniInOutLogFile = topo1.8023_N12_P12_UniInOut.log
			Set Node12_MAC8023_PORT_12.BroInLogFile = topo1.8023_N12_P12_BroIn.log
			Set Node12_MAC8023_PORT_12.BroOutLogFile = topo1.8023_N12_P12_BroOut.log
			Set Node12_MAC8023_PORT_12.BroInOutLogFile = topo1.8023_N12_P12_BroInOut.log
			Set Node12_MAC8023_PORT_12.CollLogFile = topo1.8023_N12_P12_Coll.log
			Set Node12_MAC8023_PORT_12.DropLogFile = topo1.8023_N12_P12_Drop.log
			Set Node12_MAC8023_PORT_12.InThrputLogFile = topo1.8023_N12_P12_InThrput.log
			Set Node12_MAC8023_PORT_12.OutThrputLogFile = topo1.8023_N12_P12_OutThrput.log
			Set Node12_MAC8023_PORT_12.InOutThrputLogFile = topo1.8023_N12_P12_InOutThrput.log
			Set Node12_MAC8023_PORT_12.LinktoHub = 0

		Module Phy : Node12_Phy_PORT_12
			Set Node12_Phy_PORT_12.Bw = 10
			Set Node12_Phy_PORT_12.BER = 0.0
			Set Node12_Phy_PORT_12.PropDelay = 1
			Set Node12_Phy_PORT_12.linkfail = off
			Set Node12_Phy_PORT_12.linkfailFileName = topo1.phy_N12_P12.linkfail

		Module Link : Node12_PORT_12
			Set Node12_PORT_12.guitag_remotenode = yes


		Bind Node12_MAC8023_PORT_12 Node12_Phy_PORT_12
		Bind Node12_Phy_PORT_12 Node12_PORT_12
	EndDefine

EndCreate

Create Node 13 as OF_SW with name = OF_SW13
	Module OFSwitch : Node13_OFSwitch_0
		Set Node13_OFSwitch_0.guitag_addport = yes
		Set Node13_OFSwitch_0.flow_table_amount = 15
		Set Node13_OFSwitch_0.flow_table_entry_amount = 256
		Set Node13_OFSwitch_0.group_table_entry_amount = 256
		Set Node13_OFSwitch_0.table_miss_buffer_size = 1000
		Set Node13_OFSwitch_0.fifo_queue_size = 50
		Set Node13_OFSwitch_0.controller_ip = 1.0.1.1
	Define port 1
		Module Interface : Node13_Interface_PORT_1

			Set Node13_OFSwitch_0.port1 = Node13_Interface_PORT_1
			Set Node13_OFSwitch_0.fixed_net1 = Node13_Interface_PORT_1.no
			Set Node13_Interface_PORT_1.recvtarget = Node13_OFSwitch_0

			Set Node13_Interface_PORT_1.ip = 1.0.1.8
			Set Node13_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node13_ARP_PORT_1
			Set Node13_ARP_PORT_1.arpMode = RunARP
			Set Node13_ARP_PORT_1.flushInterval = 3000
			Set Node13_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node13_FIFO_PORT_1
			Set Node13_FIFO_PORT_1.max_qlen = 50
			Set Node13_FIFO_PORT_1.log_qlen = off
			Set Node13_FIFO_PORT_1.log_option = FullLog
			Set Node13_FIFO_PORT_1.samplerate = 1
			Set Node13_FIFO_PORT_1.logFileName = topo1.fifo_N13_P1_qlen.log
			Set Node13_FIFO_PORT_1.log_drop = off
			Set Node13_FIFO_PORT_1.drop_samplerate = 1
			Set Node13_FIFO_PORT_1.droplogFileName = topo1.fifo_N13_P1_drop.log

		Module TCPDUMP : Node13_TCPDUMP_PORT_1

		Module MAC8023 : Node13_MAC8023_PORT_1
			Set Node13_MAC8023_PORT_1.mac = 0:1:0:0:0:5a
			Set Node13_MAC8023_PORT_1.lock_mac = off
			Set Node13_MAC8023_PORT_1.PromisOpt = on
			Set Node13_MAC8023_PORT_1.mode = full
			Set Node13_MAC8023_PORT_1.log = off
			Set Node13_MAC8023_PORT_1.logInterval = 1
			Set Node13_MAC8023_PORT_1.NumCollision = off
			Set Node13_MAC8023_PORT_1.NumUniInPkt = off
			Set Node13_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node13_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node13_MAC8023_PORT_1.NumBroInPkt = off
			Set Node13_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node13_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node13_MAC8023_PORT_1.NumDrop = off
			Set Node13_MAC8023_PORT_1.InThrput = off
			Set Node13_MAC8023_PORT_1.OutThrput = off
			Set Node13_MAC8023_PORT_1.InOutThrput = off
			Set Node13_MAC8023_PORT_1.UniInLogFile = topo1.8023_N13_P1_UniIn.log
			Set Node13_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N13_P1_UniOut.log
			Set Node13_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N13_P1_UniInOut.log
			Set Node13_MAC8023_PORT_1.BroInLogFile = topo1.8023_N13_P1_BroIn.log
			Set Node13_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N13_P1_BroOut.log
			Set Node13_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N13_P1_BroInOut.log
			Set Node13_MAC8023_PORT_1.CollLogFile = topo1.8023_N13_P1_Coll.log
			Set Node13_MAC8023_PORT_1.DropLogFile = topo1.8023_N13_P1_Drop.log
			Set Node13_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N13_P1_InThrput.log
			Set Node13_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N13_P1_OutThrput.log
			Set Node13_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N13_P1_InOutThrput.log
			Set Node13_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node13_Phy_PORT_1
			Set Node13_Phy_PORT_1.Bw = 10
			Set Node13_Phy_PORT_1.BER = 0.0
			Set Node13_Phy_PORT_1.PropDelay = 1
			Set Node13_Phy_PORT_1.linkfail = off
			Set Node13_Phy_PORT_1.linkfailFileName = topo1.phy_N13_P1.linkfail

		Module Link : Node13_PORT_1
			Set Node13_PORT_1.guitag_remotenode = yes


		Bind Node13_Interface_PORT_1 Node13_ARP_PORT_1
		Bind Node13_ARP_PORT_1 Node13_FIFO_PORT_1
		Bind Node13_FIFO_PORT_1 Node13_TCPDUMP_PORT_1
		Bind Node13_TCPDUMP_PORT_1 Node13_MAC8023_PORT_1
		Bind Node13_MAC8023_PORT_1 Node13_Phy_PORT_1
		Bind Node13_Phy_PORT_1 Node13_PORT_1
	EndDefine

	Define port 2
		Module MAC8023 : Node13_MAC8023_PORT_2

			Set Node13_OFSwitch_0.port2 = Node13_MAC8023_PORT_2
			Set Node13_OFSwitch_0.fixed_net2 = Node13_MAC8023_PORT_2.no
			Set Node13_MAC8023_PORT_2.recvtarget = Node13_OFSwitch_0

			Set Node13_MAC8023_PORT_2.mac = 0:1:0:0:0:5b
			Set Node13_MAC8023_PORT_2.lock_mac = off
			Set Node13_MAC8023_PORT_2.PromisOpt = on
			Set Node13_MAC8023_PORT_2.mode = full
			Set Node13_MAC8023_PORT_2.log = off
			Set Node13_MAC8023_PORT_2.logInterval = 1
			Set Node13_MAC8023_PORT_2.NumCollision = off
			Set Node13_MAC8023_PORT_2.NumUniInPkt = off
			Set Node13_MAC8023_PORT_2.NumUniOutPkt = off
			Set Node13_MAC8023_PORT_2.NumUniInOutPkt = off
			Set Node13_MAC8023_PORT_2.NumBroInPkt = off
			Set Node13_MAC8023_PORT_2.NumBroOutPkt = off
			Set Node13_MAC8023_PORT_2.NumBroInOutPkt = off
			Set Node13_MAC8023_PORT_2.NumDrop = off
			Set Node13_MAC8023_PORT_2.InThrput = off
			Set Node13_MAC8023_PORT_2.OutThrput = off
			Set Node13_MAC8023_PORT_2.InOutThrput = off
			Set Node13_MAC8023_PORT_2.UniInLogFile = topo1.8023_N13_P2_UniIn.log
			Set Node13_MAC8023_PORT_2.UniOutLogFile = topo1.8023_N13_P2_UniOut.log
			Set Node13_MAC8023_PORT_2.UniInOutLogFile = topo1.8023_N13_P2_UniInOut.log
			Set Node13_MAC8023_PORT_2.BroInLogFile = topo1.8023_N13_P2_BroIn.log
			Set Node13_MAC8023_PORT_2.BroOutLogFile = topo1.8023_N13_P2_BroOut.log
			Set Node13_MAC8023_PORT_2.BroInOutLogFile = topo1.8023_N13_P2_BroInOut.log
			Set Node13_MAC8023_PORT_2.CollLogFile = topo1.8023_N13_P2_Coll.log
			Set Node13_MAC8023_PORT_2.DropLogFile = topo1.8023_N13_P2_Drop.log
			Set Node13_MAC8023_PORT_2.InThrputLogFile = topo1.8023_N13_P2_InThrput.log
			Set Node13_MAC8023_PORT_2.OutThrputLogFile = topo1.8023_N13_P2_OutThrput.log
			Set Node13_MAC8023_PORT_2.InOutThrputLogFile = topo1.8023_N13_P2_InOutThrput.log
			Set Node13_MAC8023_PORT_2.LinktoHub = 0

		Module Phy : Node13_Phy_PORT_2
			Set Node13_Phy_PORT_2.Bw = 10
			Set Node13_Phy_PORT_2.BER = 0.0
			Set Node13_Phy_PORT_2.PropDelay = 1
			Set Node13_Phy_PORT_2.linkfail = off
			Set Node13_Phy_PORT_2.linkfailFileName = topo1.phy_N13_P2.linkfail

		Module Link : Node13_PORT_2
			Set Node13_PORT_2.guitag_remotenode = yes


		Bind Node13_MAC8023_PORT_2 Node13_Phy_PORT_2
		Bind Node13_Phy_PORT_2 Node13_PORT_2
	EndDefine

	Define port 3
		Module MAC8023 : Node13_MAC8023_PORT_3

			Set Node13_OFSwitch_0.port3 = Node13_MAC8023_PORT_3
			Set Node13_OFSwitch_0.fixed_net3 = Node13_MAC8023_PORT_3.no
			Set Node13_MAC8023_PORT_3.recvtarget = Node13_OFSwitch_0

			Set Node13_MAC8023_PORT_3.mac = 0:1:0:0:0:5c
			Set Node13_MAC8023_PORT_3.lock_mac = off
			Set Node13_MAC8023_PORT_3.PromisOpt = on
			Set Node13_MAC8023_PORT_3.mode = full
			Set Node13_MAC8023_PORT_3.log = off
			Set Node13_MAC8023_PORT_3.logInterval = 1
			Set Node13_MAC8023_PORT_3.NumCollision = off
			Set Node13_MAC8023_PORT_3.NumUniInPkt = off
			Set Node13_MAC8023_PORT_3.NumUniOutPkt = off
			Set Node13_MAC8023_PORT_3.NumUniInOutPkt = off
			Set Node13_MAC8023_PORT_3.NumBroInPkt = off
			Set Node13_MAC8023_PORT_3.NumBroOutPkt = off
			Set Node13_MAC8023_PORT_3.NumBroInOutPkt = off
			Set Node13_MAC8023_PORT_3.NumDrop = off
			Set Node13_MAC8023_PORT_3.InThrput = off
			Set Node13_MAC8023_PORT_3.OutThrput = off
			Set Node13_MAC8023_PORT_3.InOutThrput = off
			Set Node13_MAC8023_PORT_3.UniInLogFile = topo1.8023_N13_P3_UniIn.log
			Set Node13_MAC8023_PORT_3.UniOutLogFile = topo1.8023_N13_P3_UniOut.log
			Set Node13_MAC8023_PORT_3.UniInOutLogFile = topo1.8023_N13_P3_UniInOut.log
			Set Node13_MAC8023_PORT_3.BroInLogFile = topo1.8023_N13_P3_BroIn.log
			Set Node13_MAC8023_PORT_3.BroOutLogFile = topo1.8023_N13_P3_BroOut.log
			Set Node13_MAC8023_PORT_3.BroInOutLogFile = topo1.8023_N13_P3_BroInOut.log
			Set Node13_MAC8023_PORT_3.CollLogFile = topo1.8023_N13_P3_Coll.log
			Set Node13_MAC8023_PORT_3.DropLogFile = topo1.8023_N13_P3_Drop.log
			Set Node13_MAC8023_PORT_3.InThrputLogFile = topo1.8023_N13_P3_InThrput.log
			Set Node13_MAC8023_PORT_3.OutThrputLogFile = topo1.8023_N13_P3_OutThrput.log
			Set Node13_MAC8023_PORT_3.InOutThrputLogFile = topo1.8023_N13_P3_InOutThrput.log
			Set Node13_MAC8023_PORT_3.LinktoHub = 0

		Module Phy : Node13_Phy_PORT_3
			Set Node13_Phy_PORT_3.Bw = 10
			Set Node13_Phy_PORT_3.BER = 0.0
			Set Node13_Phy_PORT_3.PropDelay = 1
			Set Node13_Phy_PORT_3.linkfail = off
			Set Node13_Phy_PORT_3.linkfailFileName = topo1.phy_N13_P3.linkfail

		Module Link : Node13_PORT_3
			Set Node13_PORT_3.guitag_remotenode = yes


		Bind Node13_MAC8023_PORT_3 Node13_Phy_PORT_3
		Bind Node13_Phy_PORT_3 Node13_PORT_3
	EndDefine

	Define port 4
		Module MAC8023 : Node13_MAC8023_PORT_4

			Set Node13_OFSwitch_0.port4 = Node13_MAC8023_PORT_4
			Set Node13_OFSwitch_0.fixed_net4 = Node13_MAC8023_PORT_4.no
			Set Node13_MAC8023_PORT_4.recvtarget = Node13_OFSwitch_0

			Set Node13_MAC8023_PORT_4.mac = 0:1:0:0:0:5d
			Set Node13_MAC8023_PORT_4.lock_mac = off
			Set Node13_MAC8023_PORT_4.PromisOpt = on
			Set Node13_MAC8023_PORT_4.mode = full
			Set Node13_MAC8023_PORT_4.log = off
			Set Node13_MAC8023_PORT_4.logInterval = 1
			Set Node13_MAC8023_PORT_4.NumCollision = off
			Set Node13_MAC8023_PORT_4.NumUniInPkt = off
			Set Node13_MAC8023_PORT_4.NumUniOutPkt = off
			Set Node13_MAC8023_PORT_4.NumUniInOutPkt = off
			Set Node13_MAC8023_PORT_4.NumBroInPkt = off
			Set Node13_MAC8023_PORT_4.NumBroOutPkt = off
			Set Node13_MAC8023_PORT_4.NumBroInOutPkt = off
			Set Node13_MAC8023_PORT_4.NumDrop = off
			Set Node13_MAC8023_PORT_4.InThrput = off
			Set Node13_MAC8023_PORT_4.OutThrput = off
			Set Node13_MAC8023_PORT_4.InOutThrput = off
			Set Node13_MAC8023_PORT_4.UniInLogFile = topo1.8023_N13_P4_UniIn.log
			Set Node13_MAC8023_PORT_4.UniOutLogFile = topo1.8023_N13_P4_UniOut.log
			Set Node13_MAC8023_PORT_4.UniInOutLogFile = topo1.8023_N13_P4_UniInOut.log
			Set Node13_MAC8023_PORT_4.BroInLogFile = topo1.8023_N13_P4_BroIn.log
			Set Node13_MAC8023_PORT_4.BroOutLogFile = topo1.8023_N13_P4_BroOut.log
			Set Node13_MAC8023_PORT_4.BroInOutLogFile = topo1.8023_N13_P4_BroInOut.log
			Set Node13_MAC8023_PORT_4.CollLogFile = topo1.8023_N13_P4_Coll.log
			Set Node13_MAC8023_PORT_4.DropLogFile = topo1.8023_N13_P4_Drop.log
			Set Node13_MAC8023_PORT_4.InThrputLogFile = topo1.8023_N13_P4_InThrput.log
			Set Node13_MAC8023_PORT_4.OutThrputLogFile = topo1.8023_N13_P4_OutThrput.log
			Set Node13_MAC8023_PORT_4.InOutThrputLogFile = topo1.8023_N13_P4_InOutThrput.log
			Set Node13_MAC8023_PORT_4.LinktoHub = 0

		Module Phy : Node13_Phy_PORT_4
			Set Node13_Phy_PORT_4.Bw = 10
			Set Node13_Phy_PORT_4.BER = 0.0
			Set Node13_Phy_PORT_4.PropDelay = 1
			Set Node13_Phy_PORT_4.linkfail = off
			Set Node13_Phy_PORT_4.linkfailFileName = topo1.phy_N13_P4.linkfail

		Module Link : Node13_PORT_4
			Set Node13_PORT_4.guitag_remotenode = yes


		Bind Node13_MAC8023_PORT_4 Node13_Phy_PORT_4
		Bind Node13_Phy_PORT_4 Node13_PORT_4
	EndDefine

	Define port 5
		Module MAC8023 : Node13_MAC8023_PORT_5

			Set Node13_OFSwitch_0.port5 = Node13_MAC8023_PORT_5
			Set Node13_OFSwitch_0.fixed_net5 = Node13_MAC8023_PORT_5.no
			Set Node13_MAC8023_PORT_5.recvtarget = Node13_OFSwitch_0

			Set Node13_MAC8023_PORT_5.mac = 0:1:0:0:0:5e
			Set Node13_MAC8023_PORT_5.lock_mac = off
			Set Node13_MAC8023_PORT_5.PromisOpt = on
			Set Node13_MAC8023_PORT_5.mode = full
			Set Node13_MAC8023_PORT_5.log = off
			Set Node13_MAC8023_PORT_5.logInterval = 1
			Set Node13_MAC8023_PORT_5.NumCollision = off
			Set Node13_MAC8023_PORT_5.NumUniInPkt = off
			Set Node13_MAC8023_PORT_5.NumUniOutPkt = off
			Set Node13_MAC8023_PORT_5.NumUniInOutPkt = off
			Set Node13_MAC8023_PORT_5.NumBroInPkt = off
			Set Node13_MAC8023_PORT_5.NumBroOutPkt = off
			Set Node13_MAC8023_PORT_5.NumBroInOutPkt = off
			Set Node13_MAC8023_PORT_5.NumDrop = off
			Set Node13_MAC8023_PORT_5.InThrput = off
			Set Node13_MAC8023_PORT_5.OutThrput = off
			Set Node13_MAC8023_PORT_5.InOutThrput = off
			Set Node13_MAC8023_PORT_5.UniInLogFile = topo1.8023_N13_P5_UniIn.log
			Set Node13_MAC8023_PORT_5.UniOutLogFile = topo1.8023_N13_P5_UniOut.log
			Set Node13_MAC8023_PORT_5.UniInOutLogFile = topo1.8023_N13_P5_UniInOut.log
			Set Node13_MAC8023_PORT_5.BroInLogFile = topo1.8023_N13_P5_BroIn.log
			Set Node13_MAC8023_PORT_5.BroOutLogFile = topo1.8023_N13_P5_BroOut.log
			Set Node13_MAC8023_PORT_5.BroInOutLogFile = topo1.8023_N13_P5_BroInOut.log
			Set Node13_MAC8023_PORT_5.CollLogFile = topo1.8023_N13_P5_Coll.log
			Set Node13_MAC8023_PORT_5.DropLogFile = topo1.8023_N13_P5_Drop.log
			Set Node13_MAC8023_PORT_5.InThrputLogFile = topo1.8023_N13_P5_InThrput.log
			Set Node13_MAC8023_PORT_5.OutThrputLogFile = topo1.8023_N13_P5_OutThrput.log
			Set Node13_MAC8023_PORT_5.InOutThrputLogFile = topo1.8023_N13_P5_InOutThrput.log
			Set Node13_MAC8023_PORT_5.LinktoHub = 0

		Module Phy : Node13_Phy_PORT_5
			Set Node13_Phy_PORT_5.Bw = 10
			Set Node13_Phy_PORT_5.BER = 0.0
			Set Node13_Phy_PORT_5.PropDelay = 1
			Set Node13_Phy_PORT_5.linkfail = off
			Set Node13_Phy_PORT_5.linkfailFileName = topo1.phy_N13_P5.linkfail

		Module Link : Node13_PORT_5
			Set Node13_PORT_5.guitag_remotenode = yes


		Bind Node13_MAC8023_PORT_5 Node13_Phy_PORT_5
		Bind Node13_Phy_PORT_5 Node13_PORT_5
	EndDefine

	Define port 6
		Module MAC8023 : Node13_MAC8023_PORT_6

			Set Node13_OFSwitch_0.port6 = Node13_MAC8023_PORT_6
			Set Node13_OFSwitch_0.fixed_net6 = Node13_MAC8023_PORT_6.no
			Set Node13_MAC8023_PORT_6.recvtarget = Node13_OFSwitch_0

			Set Node13_MAC8023_PORT_6.mac = 0:1:0:0:0:5f
			Set Node13_MAC8023_PORT_6.lock_mac = off
			Set Node13_MAC8023_PORT_6.PromisOpt = on
			Set Node13_MAC8023_PORT_6.mode = full
			Set Node13_MAC8023_PORT_6.log = off
			Set Node13_MAC8023_PORT_6.logInterval = 1
			Set Node13_MAC8023_PORT_6.NumCollision = off
			Set Node13_MAC8023_PORT_6.NumUniInPkt = off
			Set Node13_MAC8023_PORT_6.NumUniOutPkt = off
			Set Node13_MAC8023_PORT_6.NumUniInOutPkt = off
			Set Node13_MAC8023_PORT_6.NumBroInPkt = off
			Set Node13_MAC8023_PORT_6.NumBroOutPkt = off
			Set Node13_MAC8023_PORT_6.NumBroInOutPkt = off
			Set Node13_MAC8023_PORT_6.NumDrop = off
			Set Node13_MAC8023_PORT_6.InThrput = off
			Set Node13_MAC8023_PORT_6.OutThrput = off
			Set Node13_MAC8023_PORT_6.InOutThrput = off
			Set Node13_MAC8023_PORT_6.UniInLogFile = topo1.8023_N13_P6_UniIn.log
			Set Node13_MAC8023_PORT_6.UniOutLogFile = topo1.8023_N13_P6_UniOut.log
			Set Node13_MAC8023_PORT_6.UniInOutLogFile = topo1.8023_N13_P6_UniInOut.log
			Set Node13_MAC8023_PORT_6.BroInLogFile = topo1.8023_N13_P6_BroIn.log
			Set Node13_MAC8023_PORT_6.BroOutLogFile = topo1.8023_N13_P6_BroOut.log
			Set Node13_MAC8023_PORT_6.BroInOutLogFile = topo1.8023_N13_P6_BroInOut.log
			Set Node13_MAC8023_PORT_6.CollLogFile = topo1.8023_N13_P6_Coll.log
			Set Node13_MAC8023_PORT_6.DropLogFile = topo1.8023_N13_P6_Drop.log
			Set Node13_MAC8023_PORT_6.InThrputLogFile = topo1.8023_N13_P6_InThrput.log
			Set Node13_MAC8023_PORT_6.OutThrputLogFile = topo1.8023_N13_P6_OutThrput.log
			Set Node13_MAC8023_PORT_6.InOutThrputLogFile = topo1.8023_N13_P6_InOutThrput.log
			Set Node13_MAC8023_PORT_6.LinktoHub = 0

		Module Phy : Node13_Phy_PORT_6
			Set Node13_Phy_PORT_6.Bw = 10
			Set Node13_Phy_PORT_6.BER = 0.0
			Set Node13_Phy_PORT_6.PropDelay = 1
			Set Node13_Phy_PORT_6.linkfail = off
			Set Node13_Phy_PORT_6.linkfailFileName = topo1.phy_N13_P6.linkfail

		Module Link : Node13_PORT_6
			Set Node13_PORT_6.guitag_remotenode = yes


		Bind Node13_MAC8023_PORT_6 Node13_Phy_PORT_6
		Bind Node13_Phy_PORT_6 Node13_PORT_6
	EndDefine

	Define port 7
		Module MAC8023 : Node13_MAC8023_PORT_7

			Set Node13_OFSwitch_0.port7 = Node13_MAC8023_PORT_7
			Set Node13_OFSwitch_0.fixed_net7 = Node13_MAC8023_PORT_7.no
			Set Node13_MAC8023_PORT_7.recvtarget = Node13_OFSwitch_0

			Set Node13_MAC8023_PORT_7.mac = 0:1:0:0:0:60
			Set Node13_MAC8023_PORT_7.lock_mac = off
			Set Node13_MAC8023_PORT_7.PromisOpt = on
			Set Node13_MAC8023_PORT_7.mode = full
			Set Node13_MAC8023_PORT_7.log = off
			Set Node13_MAC8023_PORT_7.logInterval = 1
			Set Node13_MAC8023_PORT_7.NumCollision = off
			Set Node13_MAC8023_PORT_7.NumUniInPkt = off
			Set Node13_MAC8023_PORT_7.NumUniOutPkt = off
			Set Node13_MAC8023_PORT_7.NumUniInOutPkt = off
			Set Node13_MAC8023_PORT_7.NumBroInPkt = off
			Set Node13_MAC8023_PORT_7.NumBroOutPkt = off
			Set Node13_MAC8023_PORT_7.NumBroInOutPkt = off
			Set Node13_MAC8023_PORT_7.NumDrop = off
			Set Node13_MAC8023_PORT_7.InThrput = off
			Set Node13_MAC8023_PORT_7.OutThrput = off
			Set Node13_MAC8023_PORT_7.InOutThrput = off
			Set Node13_MAC8023_PORT_7.UniInLogFile = topo1.8023_N13_P7_UniIn.log
			Set Node13_MAC8023_PORT_7.UniOutLogFile = topo1.8023_N13_P7_UniOut.log
			Set Node13_MAC8023_PORT_7.UniInOutLogFile = topo1.8023_N13_P7_UniInOut.log
			Set Node13_MAC8023_PORT_7.BroInLogFile = topo1.8023_N13_P7_BroIn.log
			Set Node13_MAC8023_PORT_7.BroOutLogFile = topo1.8023_N13_P7_BroOut.log
			Set Node13_MAC8023_PORT_7.BroInOutLogFile = topo1.8023_N13_P7_BroInOut.log
			Set Node13_MAC8023_PORT_7.CollLogFile = topo1.8023_N13_P7_Coll.log
			Set Node13_MAC8023_PORT_7.DropLogFile = topo1.8023_N13_P7_Drop.log
			Set Node13_MAC8023_PORT_7.InThrputLogFile = topo1.8023_N13_P7_InThrput.log
			Set Node13_MAC8023_PORT_7.OutThrputLogFile = topo1.8023_N13_P7_OutThrput.log
			Set Node13_MAC8023_PORT_7.InOutThrputLogFile = topo1.8023_N13_P7_InOutThrput.log
			Set Node13_MAC8023_PORT_7.LinktoHub = 0

		Module Phy : Node13_Phy_PORT_7
			Set Node13_Phy_PORT_7.Bw = 10
			Set Node13_Phy_PORT_7.BER = 0.0
			Set Node13_Phy_PORT_7.PropDelay = 1
			Set Node13_Phy_PORT_7.linkfail = off
			Set Node13_Phy_PORT_7.linkfailFileName = topo1.phy_N13_P7.linkfail

		Module Link : Node13_PORT_7
			Set Node13_PORT_7.guitag_remotenode = yes


		Bind Node13_MAC8023_PORT_7 Node13_Phy_PORT_7
		Bind Node13_Phy_PORT_7 Node13_PORT_7
	EndDefine

	Define port 8
		Module MAC8023 : Node13_MAC8023_PORT_8

			Set Node13_OFSwitch_0.port8 = Node13_MAC8023_PORT_8
			Set Node13_OFSwitch_0.fixed_net8 = Node13_MAC8023_PORT_8.no
			Set Node13_MAC8023_PORT_8.recvtarget = Node13_OFSwitch_0

			Set Node13_MAC8023_PORT_8.mac = 0:1:0:0:0:61
			Set Node13_MAC8023_PORT_8.lock_mac = off
			Set Node13_MAC8023_PORT_8.PromisOpt = on
			Set Node13_MAC8023_PORT_8.mode = full
			Set Node13_MAC8023_PORT_8.log = off
			Set Node13_MAC8023_PORT_8.logInterval = 1
			Set Node13_MAC8023_PORT_8.NumCollision = off
			Set Node13_MAC8023_PORT_8.NumUniInPkt = off
			Set Node13_MAC8023_PORT_8.NumUniOutPkt = off
			Set Node13_MAC8023_PORT_8.NumUniInOutPkt = off
			Set Node13_MAC8023_PORT_8.NumBroInPkt = off
			Set Node13_MAC8023_PORT_8.NumBroOutPkt = off
			Set Node13_MAC8023_PORT_8.NumBroInOutPkt = off
			Set Node13_MAC8023_PORT_8.NumDrop = off
			Set Node13_MAC8023_PORT_8.InThrput = off
			Set Node13_MAC8023_PORT_8.OutThrput = off
			Set Node13_MAC8023_PORT_8.InOutThrput = off
			Set Node13_MAC8023_PORT_8.UniInLogFile = topo1.8023_N13_P8_UniIn.log
			Set Node13_MAC8023_PORT_8.UniOutLogFile = topo1.8023_N13_P8_UniOut.log
			Set Node13_MAC8023_PORT_8.UniInOutLogFile = topo1.8023_N13_P8_UniInOut.log
			Set Node13_MAC8023_PORT_8.BroInLogFile = topo1.8023_N13_P8_BroIn.log
			Set Node13_MAC8023_PORT_8.BroOutLogFile = topo1.8023_N13_P8_BroOut.log
			Set Node13_MAC8023_PORT_8.BroInOutLogFile = topo1.8023_N13_P8_BroInOut.log
			Set Node13_MAC8023_PORT_8.CollLogFile = topo1.8023_N13_P8_Coll.log
			Set Node13_MAC8023_PORT_8.DropLogFile = topo1.8023_N13_P8_Drop.log
			Set Node13_MAC8023_PORT_8.InThrputLogFile = topo1.8023_N13_P8_InThrput.log
			Set Node13_MAC8023_PORT_8.OutThrputLogFile = topo1.8023_N13_P8_OutThrput.log
			Set Node13_MAC8023_PORT_8.InOutThrputLogFile = topo1.8023_N13_P8_InOutThrput.log
			Set Node13_MAC8023_PORT_8.LinktoHub = 0

		Module Phy : Node13_Phy_PORT_8
			Set Node13_Phy_PORT_8.Bw = 10
			Set Node13_Phy_PORT_8.BER = 0.0
			Set Node13_Phy_PORT_8.PropDelay = 1
			Set Node13_Phy_PORT_8.linkfail = off
			Set Node13_Phy_PORT_8.linkfailFileName = topo1.phy_N13_P8.linkfail

		Module Link : Node13_PORT_8
			Set Node13_PORT_8.guitag_remotenode = yes


		Bind Node13_MAC8023_PORT_8 Node13_Phy_PORT_8
		Bind Node13_Phy_PORT_8 Node13_PORT_8
	EndDefine

	Define port 9
		Module MAC8023 : Node13_MAC8023_PORT_9

			Set Node13_OFSwitch_0.port9 = Node13_MAC8023_PORT_9
			Set Node13_OFSwitch_0.fixed_net9 = Node13_MAC8023_PORT_9.no
			Set Node13_MAC8023_PORT_9.recvtarget = Node13_OFSwitch_0

			Set Node13_MAC8023_PORT_9.mac = 0:1:0:0:0:62
			Set Node13_MAC8023_PORT_9.lock_mac = off
			Set Node13_MAC8023_PORT_9.PromisOpt = on
			Set Node13_MAC8023_PORT_9.mode = full
			Set Node13_MAC8023_PORT_9.log = off
			Set Node13_MAC8023_PORT_9.logInterval = 1
			Set Node13_MAC8023_PORT_9.NumCollision = off
			Set Node13_MAC8023_PORT_9.NumUniInPkt = off
			Set Node13_MAC8023_PORT_9.NumUniOutPkt = off
			Set Node13_MAC8023_PORT_9.NumUniInOutPkt = off
			Set Node13_MAC8023_PORT_9.NumBroInPkt = off
			Set Node13_MAC8023_PORT_9.NumBroOutPkt = off
			Set Node13_MAC8023_PORT_9.NumBroInOutPkt = off
			Set Node13_MAC8023_PORT_9.NumDrop = off
			Set Node13_MAC8023_PORT_9.InThrput = off
			Set Node13_MAC8023_PORT_9.OutThrput = off
			Set Node13_MAC8023_PORT_9.InOutThrput = off
			Set Node13_MAC8023_PORT_9.UniInLogFile = topo1.8023_N13_P9_UniIn.log
			Set Node13_MAC8023_PORT_9.UniOutLogFile = topo1.8023_N13_P9_UniOut.log
			Set Node13_MAC8023_PORT_9.UniInOutLogFile = topo1.8023_N13_P9_UniInOut.log
			Set Node13_MAC8023_PORT_9.BroInLogFile = topo1.8023_N13_P9_BroIn.log
			Set Node13_MAC8023_PORT_9.BroOutLogFile = topo1.8023_N13_P9_BroOut.log
			Set Node13_MAC8023_PORT_9.BroInOutLogFile = topo1.8023_N13_P9_BroInOut.log
			Set Node13_MAC8023_PORT_9.CollLogFile = topo1.8023_N13_P9_Coll.log
			Set Node13_MAC8023_PORT_9.DropLogFile = topo1.8023_N13_P9_Drop.log
			Set Node13_MAC8023_PORT_9.InThrputLogFile = topo1.8023_N13_P9_InThrput.log
			Set Node13_MAC8023_PORT_9.OutThrputLogFile = topo1.8023_N13_P9_OutThrput.log
			Set Node13_MAC8023_PORT_9.InOutThrputLogFile = topo1.8023_N13_P9_InOutThrput.log
			Set Node13_MAC8023_PORT_9.LinktoHub = 0

		Module Phy : Node13_Phy_PORT_9
			Set Node13_Phy_PORT_9.Bw = 10
			Set Node13_Phy_PORT_9.BER = 0.0
			Set Node13_Phy_PORT_9.PropDelay = 1
			Set Node13_Phy_PORT_9.linkfail = off
			Set Node13_Phy_PORT_9.linkfailFileName = topo1.phy_N13_P9.linkfail

		Module Link : Node13_PORT_9
			Set Node13_PORT_9.guitag_remotenode = yes


		Bind Node13_MAC8023_PORT_9 Node13_Phy_PORT_9
		Bind Node13_Phy_PORT_9 Node13_PORT_9
	EndDefine

	Define port 10
		Module MAC8023 : Node13_MAC8023_PORT_10

			Set Node13_OFSwitch_0.port10 = Node13_MAC8023_PORT_10
			Set Node13_OFSwitch_0.fixed_net10 = Node13_MAC8023_PORT_10.no
			Set Node13_MAC8023_PORT_10.recvtarget = Node13_OFSwitch_0

			Set Node13_MAC8023_PORT_10.mac = 0:1:0:0:0:63
			Set Node13_MAC8023_PORT_10.lock_mac = off
			Set Node13_MAC8023_PORT_10.PromisOpt = on
			Set Node13_MAC8023_PORT_10.mode = full
			Set Node13_MAC8023_PORT_10.log = off
			Set Node13_MAC8023_PORT_10.logInterval = 1
			Set Node13_MAC8023_PORT_10.NumCollision = off
			Set Node13_MAC8023_PORT_10.NumUniInPkt = off
			Set Node13_MAC8023_PORT_10.NumUniOutPkt = off
			Set Node13_MAC8023_PORT_10.NumUniInOutPkt = off
			Set Node13_MAC8023_PORT_10.NumBroInPkt = off
			Set Node13_MAC8023_PORT_10.NumBroOutPkt = off
			Set Node13_MAC8023_PORT_10.NumBroInOutPkt = off
			Set Node13_MAC8023_PORT_10.NumDrop = off
			Set Node13_MAC8023_PORT_10.InThrput = off
			Set Node13_MAC8023_PORT_10.OutThrput = off
			Set Node13_MAC8023_PORT_10.InOutThrput = off
			Set Node13_MAC8023_PORT_10.UniInLogFile = topo1.8023_N13_P10_UniIn.log
			Set Node13_MAC8023_PORT_10.UniOutLogFile = topo1.8023_N13_P10_UniOut.log
			Set Node13_MAC8023_PORT_10.UniInOutLogFile = topo1.8023_N13_P10_UniInOut.log
			Set Node13_MAC8023_PORT_10.BroInLogFile = topo1.8023_N13_P10_BroIn.log
			Set Node13_MAC8023_PORT_10.BroOutLogFile = topo1.8023_N13_P10_BroOut.log
			Set Node13_MAC8023_PORT_10.BroInOutLogFile = topo1.8023_N13_P10_BroInOut.log
			Set Node13_MAC8023_PORT_10.CollLogFile = topo1.8023_N13_P10_Coll.log
			Set Node13_MAC8023_PORT_10.DropLogFile = topo1.8023_N13_P10_Drop.log
			Set Node13_MAC8023_PORT_10.InThrputLogFile = topo1.8023_N13_P10_InThrput.log
			Set Node13_MAC8023_PORT_10.OutThrputLogFile = topo1.8023_N13_P10_OutThrput.log
			Set Node13_MAC8023_PORT_10.InOutThrputLogFile = topo1.8023_N13_P10_InOutThrput.log
			Set Node13_MAC8023_PORT_10.LinktoHub = 0

		Module Phy : Node13_Phy_PORT_10
			Set Node13_Phy_PORT_10.Bw = 10
			Set Node13_Phy_PORT_10.BER = 0.0
			Set Node13_Phy_PORT_10.PropDelay = 1
			Set Node13_Phy_PORT_10.linkfail = off
			Set Node13_Phy_PORT_10.linkfailFileName = topo1.phy_N13_P10.linkfail

		Module Link : Node13_PORT_10
			Set Node13_PORT_10.guitag_remotenode = yes


		Bind Node13_MAC8023_PORT_10 Node13_Phy_PORT_10
		Bind Node13_Phy_PORT_10 Node13_PORT_10
	EndDefine

	Define port 11
		Module MAC8023 : Node13_MAC8023_PORT_11

			Set Node13_OFSwitch_0.port11 = Node13_MAC8023_PORT_11
			Set Node13_OFSwitch_0.fixed_net11 = Node13_MAC8023_PORT_11.no
			Set Node13_MAC8023_PORT_11.recvtarget = Node13_OFSwitch_0

			Set Node13_MAC8023_PORT_11.mac = 0:1:0:0:0:64
			Set Node13_MAC8023_PORT_11.lock_mac = off
			Set Node13_MAC8023_PORT_11.PromisOpt = on
			Set Node13_MAC8023_PORT_11.mode = full
			Set Node13_MAC8023_PORT_11.log = off
			Set Node13_MAC8023_PORT_11.logInterval = 1
			Set Node13_MAC8023_PORT_11.NumCollision = off
			Set Node13_MAC8023_PORT_11.NumUniInPkt = off
			Set Node13_MAC8023_PORT_11.NumUniOutPkt = off
			Set Node13_MAC8023_PORT_11.NumUniInOutPkt = off
			Set Node13_MAC8023_PORT_11.NumBroInPkt = off
			Set Node13_MAC8023_PORT_11.NumBroOutPkt = off
			Set Node13_MAC8023_PORT_11.NumBroInOutPkt = off
			Set Node13_MAC8023_PORT_11.NumDrop = off
			Set Node13_MAC8023_PORT_11.InThrput = off
			Set Node13_MAC8023_PORT_11.OutThrput = off
			Set Node13_MAC8023_PORT_11.InOutThrput = off
			Set Node13_MAC8023_PORT_11.UniInLogFile = topo1.8023_N13_P11_UniIn.log
			Set Node13_MAC8023_PORT_11.UniOutLogFile = topo1.8023_N13_P11_UniOut.log
			Set Node13_MAC8023_PORT_11.UniInOutLogFile = topo1.8023_N13_P11_UniInOut.log
			Set Node13_MAC8023_PORT_11.BroInLogFile = topo1.8023_N13_P11_BroIn.log
			Set Node13_MAC8023_PORT_11.BroOutLogFile = topo1.8023_N13_P11_BroOut.log
			Set Node13_MAC8023_PORT_11.BroInOutLogFile = topo1.8023_N13_P11_BroInOut.log
			Set Node13_MAC8023_PORT_11.CollLogFile = topo1.8023_N13_P11_Coll.log
			Set Node13_MAC8023_PORT_11.DropLogFile = topo1.8023_N13_P11_Drop.log
			Set Node13_MAC8023_PORT_11.InThrputLogFile = topo1.8023_N13_P11_InThrput.log
			Set Node13_MAC8023_PORT_11.OutThrputLogFile = topo1.8023_N13_P11_OutThrput.log
			Set Node13_MAC8023_PORT_11.InOutThrputLogFile = topo1.8023_N13_P11_InOutThrput.log
			Set Node13_MAC8023_PORT_11.LinktoHub = 0

		Module Phy : Node13_Phy_PORT_11
			Set Node13_Phy_PORT_11.Bw = 10
			Set Node13_Phy_PORT_11.BER = 0.0
			Set Node13_Phy_PORT_11.PropDelay = 1
			Set Node13_Phy_PORT_11.linkfail = off
			Set Node13_Phy_PORT_11.linkfailFileName = topo1.phy_N13_P11.linkfail

		Module Link : Node13_PORT_11
			Set Node13_PORT_11.guitag_remotenode = yes


		Bind Node13_MAC8023_PORT_11 Node13_Phy_PORT_11
		Bind Node13_Phy_PORT_11 Node13_PORT_11
	EndDefine

	Define port 12
		Module MAC8023 : Node13_MAC8023_PORT_12

			Set Node13_OFSwitch_0.port12 = Node13_MAC8023_PORT_12
			Set Node13_OFSwitch_0.fixed_net12 = Node13_MAC8023_PORT_12.no
			Set Node13_MAC8023_PORT_12.recvtarget = Node13_OFSwitch_0

			Set Node13_MAC8023_PORT_12.mac = 0:1:0:0:0:65
			Set Node13_MAC8023_PORT_12.lock_mac = off
			Set Node13_MAC8023_PORT_12.PromisOpt = on
			Set Node13_MAC8023_PORT_12.mode = full
			Set Node13_MAC8023_PORT_12.log = off
			Set Node13_MAC8023_PORT_12.logInterval = 1
			Set Node13_MAC8023_PORT_12.NumCollision = off
			Set Node13_MAC8023_PORT_12.NumUniInPkt = off
			Set Node13_MAC8023_PORT_12.NumUniOutPkt = off
			Set Node13_MAC8023_PORT_12.NumUniInOutPkt = off
			Set Node13_MAC8023_PORT_12.NumBroInPkt = off
			Set Node13_MAC8023_PORT_12.NumBroOutPkt = off
			Set Node13_MAC8023_PORT_12.NumBroInOutPkt = off
			Set Node13_MAC8023_PORT_12.NumDrop = off
			Set Node13_MAC8023_PORT_12.InThrput = off
			Set Node13_MAC8023_PORT_12.OutThrput = off
			Set Node13_MAC8023_PORT_12.InOutThrput = off
			Set Node13_MAC8023_PORT_12.UniInLogFile = topo1.8023_N13_P12_UniIn.log
			Set Node13_MAC8023_PORT_12.UniOutLogFile = topo1.8023_N13_P12_UniOut.log
			Set Node13_MAC8023_PORT_12.UniInOutLogFile = topo1.8023_N13_P12_UniInOut.log
			Set Node13_MAC8023_PORT_12.BroInLogFile = topo1.8023_N13_P12_BroIn.log
			Set Node13_MAC8023_PORT_12.BroOutLogFile = topo1.8023_N13_P12_BroOut.log
			Set Node13_MAC8023_PORT_12.BroInOutLogFile = topo1.8023_N13_P12_BroInOut.log
			Set Node13_MAC8023_PORT_12.CollLogFile = topo1.8023_N13_P12_Coll.log
			Set Node13_MAC8023_PORT_12.DropLogFile = topo1.8023_N13_P12_Drop.log
			Set Node13_MAC8023_PORT_12.InThrputLogFile = topo1.8023_N13_P12_InThrput.log
			Set Node13_MAC8023_PORT_12.OutThrputLogFile = topo1.8023_N13_P12_OutThrput.log
			Set Node13_MAC8023_PORT_12.InOutThrputLogFile = topo1.8023_N13_P12_InOutThrput.log
			Set Node13_MAC8023_PORT_12.LinktoHub = 0

		Module Phy : Node13_Phy_PORT_12
			Set Node13_Phy_PORT_12.Bw = 10
			Set Node13_Phy_PORT_12.BER = 0.0
			Set Node13_Phy_PORT_12.PropDelay = 1
			Set Node13_Phy_PORT_12.linkfail = off
			Set Node13_Phy_PORT_12.linkfailFileName = topo1.phy_N13_P12.linkfail

		Module Link : Node13_PORT_12
			Set Node13_PORT_12.guitag_remotenode = yes


		Bind Node13_MAC8023_PORT_12 Node13_Phy_PORT_12
		Bind Node13_Phy_PORT_12 Node13_PORT_12
	EndDefine

EndCreate

Create Node 14 as OF_SW with name = OF_SW14
	Module OFSwitch : Node14_OFSwitch_0
		Set Node14_OFSwitch_0.guitag_addport = yes
		Set Node14_OFSwitch_0.flow_table_amount = 15
		Set Node14_OFSwitch_0.flow_table_entry_amount = 256
		Set Node14_OFSwitch_0.group_table_entry_amount = 256
		Set Node14_OFSwitch_0.table_miss_buffer_size = 1000
		Set Node14_OFSwitch_0.fifo_queue_size = 50
		Set Node14_OFSwitch_0.controller_ip = 1.0.1.1
	Define port 1
		Module Interface : Node14_Interface_PORT_1

			Set Node14_OFSwitch_0.port1 = Node14_Interface_PORT_1
			Set Node14_OFSwitch_0.fixed_net1 = Node14_Interface_PORT_1.no
			Set Node14_Interface_PORT_1.recvtarget = Node14_OFSwitch_0

			Set Node14_Interface_PORT_1.ip = 1.0.1.9
			Set Node14_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node14_ARP_PORT_1
			Set Node14_ARP_PORT_1.arpMode = RunARP
			Set Node14_ARP_PORT_1.flushInterval = 3000
			Set Node14_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node14_FIFO_PORT_1
			Set Node14_FIFO_PORT_1.max_qlen = 50
			Set Node14_FIFO_PORT_1.log_qlen = off
			Set Node14_FIFO_PORT_1.log_option = FullLog
			Set Node14_FIFO_PORT_1.samplerate = 1
			Set Node14_FIFO_PORT_1.logFileName = topo1.fifo_N14_P1_qlen.log
			Set Node14_FIFO_PORT_1.log_drop = off
			Set Node14_FIFO_PORT_1.drop_samplerate = 1
			Set Node14_FIFO_PORT_1.droplogFileName = topo1.fifo_N14_P1_drop.log

		Module TCPDUMP : Node14_TCPDUMP_PORT_1

		Module MAC8023 : Node14_MAC8023_PORT_1
			Set Node14_MAC8023_PORT_1.mac = 0:1:0:0:0:66
			Set Node14_MAC8023_PORT_1.lock_mac = off
			Set Node14_MAC8023_PORT_1.PromisOpt = on
			Set Node14_MAC8023_PORT_1.mode = full
			Set Node14_MAC8023_PORT_1.log = off
			Set Node14_MAC8023_PORT_1.logInterval = 1
			Set Node14_MAC8023_PORT_1.NumCollision = off
			Set Node14_MAC8023_PORT_1.NumUniInPkt = off
			Set Node14_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node14_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node14_MAC8023_PORT_1.NumBroInPkt = off
			Set Node14_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node14_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node14_MAC8023_PORT_1.NumDrop = off
			Set Node14_MAC8023_PORT_1.InThrput = off
			Set Node14_MAC8023_PORT_1.OutThrput = off
			Set Node14_MAC8023_PORT_1.InOutThrput = off
			Set Node14_MAC8023_PORT_1.UniInLogFile = topo1.8023_N14_P1_UniIn.log
			Set Node14_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N14_P1_UniOut.log
			Set Node14_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N14_P1_UniInOut.log
			Set Node14_MAC8023_PORT_1.BroInLogFile = topo1.8023_N14_P1_BroIn.log
			Set Node14_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N14_P1_BroOut.log
			Set Node14_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N14_P1_BroInOut.log
			Set Node14_MAC8023_PORT_1.CollLogFile = topo1.8023_N14_P1_Coll.log
			Set Node14_MAC8023_PORT_1.DropLogFile = topo1.8023_N14_P1_Drop.log
			Set Node14_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N14_P1_InThrput.log
			Set Node14_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N14_P1_OutThrput.log
			Set Node14_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N14_P1_InOutThrput.log
			Set Node14_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node14_Phy_PORT_1
			Set Node14_Phy_PORT_1.Bw = 10
			Set Node14_Phy_PORT_1.BER = 0.0
			Set Node14_Phy_PORT_1.PropDelay = 1
			Set Node14_Phy_PORT_1.linkfail = off
			Set Node14_Phy_PORT_1.linkfailFileName = topo1.phy_N14_P1.linkfail

		Module Link : Node14_PORT_1
			Set Node14_PORT_1.guitag_remotenode = yes


		Bind Node14_Interface_PORT_1 Node14_ARP_PORT_1
		Bind Node14_ARP_PORT_1 Node14_FIFO_PORT_1
		Bind Node14_FIFO_PORT_1 Node14_TCPDUMP_PORT_1
		Bind Node14_TCPDUMP_PORT_1 Node14_MAC8023_PORT_1
		Bind Node14_MAC8023_PORT_1 Node14_Phy_PORT_1
		Bind Node14_Phy_PORT_1 Node14_PORT_1
	EndDefine

	Define port 2
		Module MAC8023 : Node14_MAC8023_PORT_2

			Set Node14_OFSwitch_0.port2 = Node14_MAC8023_PORT_2
			Set Node14_OFSwitch_0.fixed_net2 = Node14_MAC8023_PORT_2.no
			Set Node14_MAC8023_PORT_2.recvtarget = Node14_OFSwitch_0

			Set Node14_MAC8023_PORT_2.mac = 0:1:0:0:0:67
			Set Node14_MAC8023_PORT_2.lock_mac = off
			Set Node14_MAC8023_PORT_2.PromisOpt = on
			Set Node14_MAC8023_PORT_2.mode = full
			Set Node14_MAC8023_PORT_2.log = off
			Set Node14_MAC8023_PORT_2.logInterval = 1
			Set Node14_MAC8023_PORT_2.NumCollision = off
			Set Node14_MAC8023_PORT_2.NumUniInPkt = off
			Set Node14_MAC8023_PORT_2.NumUniOutPkt = off
			Set Node14_MAC8023_PORT_2.NumUniInOutPkt = off
			Set Node14_MAC8023_PORT_2.NumBroInPkt = off
			Set Node14_MAC8023_PORT_2.NumBroOutPkt = off
			Set Node14_MAC8023_PORT_2.NumBroInOutPkt = off
			Set Node14_MAC8023_PORT_2.NumDrop = off
			Set Node14_MAC8023_PORT_2.InThrput = off
			Set Node14_MAC8023_PORT_2.OutThrput = off
			Set Node14_MAC8023_PORT_2.InOutThrput = off
			Set Node14_MAC8023_PORT_2.UniInLogFile = topo1.8023_N14_P2_UniIn.log
			Set Node14_MAC8023_PORT_2.UniOutLogFile = topo1.8023_N14_P2_UniOut.log
			Set Node14_MAC8023_PORT_2.UniInOutLogFile = topo1.8023_N14_P2_UniInOut.log
			Set Node14_MAC8023_PORT_2.BroInLogFile = topo1.8023_N14_P2_BroIn.log
			Set Node14_MAC8023_PORT_2.BroOutLogFile = topo1.8023_N14_P2_BroOut.log
			Set Node14_MAC8023_PORT_2.BroInOutLogFile = topo1.8023_N14_P2_BroInOut.log
			Set Node14_MAC8023_PORT_2.CollLogFile = topo1.8023_N14_P2_Coll.log
			Set Node14_MAC8023_PORT_2.DropLogFile = topo1.8023_N14_P2_Drop.log
			Set Node14_MAC8023_PORT_2.InThrputLogFile = topo1.8023_N14_P2_InThrput.log
			Set Node14_MAC8023_PORT_2.OutThrputLogFile = topo1.8023_N14_P2_OutThrput.log
			Set Node14_MAC8023_PORT_2.InOutThrputLogFile = topo1.8023_N14_P2_InOutThrput.log
			Set Node14_MAC8023_PORT_2.LinktoHub = 0

		Module Phy : Node14_Phy_PORT_2
			Set Node14_Phy_PORT_2.Bw = 10
			Set Node14_Phy_PORT_2.BER = 0.0
			Set Node14_Phy_PORT_2.PropDelay = 1
			Set Node14_Phy_PORT_2.linkfail = off
			Set Node14_Phy_PORT_2.linkfailFileName = topo1.phy_N14_P2.linkfail

		Module Link : Node14_PORT_2
			Set Node14_PORT_2.guitag_remotenode = yes


		Bind Node14_MAC8023_PORT_2 Node14_Phy_PORT_2
		Bind Node14_Phy_PORT_2 Node14_PORT_2
	EndDefine

	Define port 3
		Module MAC8023 : Node14_MAC8023_PORT_3

			Set Node14_OFSwitch_0.port3 = Node14_MAC8023_PORT_3
			Set Node14_OFSwitch_0.fixed_net3 = Node14_MAC8023_PORT_3.no
			Set Node14_MAC8023_PORT_3.recvtarget = Node14_OFSwitch_0

			Set Node14_MAC8023_PORT_3.mac = 0:1:0:0:0:68
			Set Node14_MAC8023_PORT_3.lock_mac = off
			Set Node14_MAC8023_PORT_3.PromisOpt = on
			Set Node14_MAC8023_PORT_3.mode = full
			Set Node14_MAC8023_PORT_3.log = off
			Set Node14_MAC8023_PORT_3.logInterval = 1
			Set Node14_MAC8023_PORT_3.NumCollision = off
			Set Node14_MAC8023_PORT_3.NumUniInPkt = off
			Set Node14_MAC8023_PORT_3.NumUniOutPkt = off
			Set Node14_MAC8023_PORT_3.NumUniInOutPkt = off
			Set Node14_MAC8023_PORT_3.NumBroInPkt = off
			Set Node14_MAC8023_PORT_3.NumBroOutPkt = off
			Set Node14_MAC8023_PORT_3.NumBroInOutPkt = off
			Set Node14_MAC8023_PORT_3.NumDrop = off
			Set Node14_MAC8023_PORT_3.InThrput = off
			Set Node14_MAC8023_PORT_3.OutThrput = off
			Set Node14_MAC8023_PORT_3.InOutThrput = off
			Set Node14_MAC8023_PORT_3.UniInLogFile = topo1.8023_N14_P3_UniIn.log
			Set Node14_MAC8023_PORT_3.UniOutLogFile = topo1.8023_N14_P3_UniOut.log
			Set Node14_MAC8023_PORT_3.UniInOutLogFile = topo1.8023_N14_P3_UniInOut.log
			Set Node14_MAC8023_PORT_3.BroInLogFile = topo1.8023_N14_P3_BroIn.log
			Set Node14_MAC8023_PORT_3.BroOutLogFile = topo1.8023_N14_P3_BroOut.log
			Set Node14_MAC8023_PORT_3.BroInOutLogFile = topo1.8023_N14_P3_BroInOut.log
			Set Node14_MAC8023_PORT_3.CollLogFile = topo1.8023_N14_P3_Coll.log
			Set Node14_MAC8023_PORT_3.DropLogFile = topo1.8023_N14_P3_Drop.log
			Set Node14_MAC8023_PORT_3.InThrputLogFile = topo1.8023_N14_P3_InThrput.log
			Set Node14_MAC8023_PORT_3.OutThrputLogFile = topo1.8023_N14_P3_OutThrput.log
			Set Node14_MAC8023_PORT_3.InOutThrputLogFile = topo1.8023_N14_P3_InOutThrput.log
			Set Node14_MAC8023_PORT_3.LinktoHub = 0

		Module Phy : Node14_Phy_PORT_3
			Set Node14_Phy_PORT_3.Bw = 10
			Set Node14_Phy_PORT_3.BER = 0.0
			Set Node14_Phy_PORT_3.PropDelay = 1
			Set Node14_Phy_PORT_3.linkfail = off
			Set Node14_Phy_PORT_3.linkfailFileName = topo1.phy_N14_P3.linkfail

		Module Link : Node14_PORT_3
			Set Node14_PORT_3.guitag_remotenode = yes


		Bind Node14_MAC8023_PORT_3 Node14_Phy_PORT_3
		Bind Node14_Phy_PORT_3 Node14_PORT_3
	EndDefine

	Define port 4
		Module MAC8023 : Node14_MAC8023_PORT_4

			Set Node14_OFSwitch_0.port4 = Node14_MAC8023_PORT_4
			Set Node14_OFSwitch_0.fixed_net4 = Node14_MAC8023_PORT_4.no
			Set Node14_MAC8023_PORT_4.recvtarget = Node14_OFSwitch_0

			Set Node14_MAC8023_PORT_4.mac = 0:1:0:0:0:69
			Set Node14_MAC8023_PORT_4.lock_mac = off
			Set Node14_MAC8023_PORT_4.PromisOpt = on
			Set Node14_MAC8023_PORT_4.mode = full
			Set Node14_MAC8023_PORT_4.log = off
			Set Node14_MAC8023_PORT_4.logInterval = 1
			Set Node14_MAC8023_PORT_4.NumCollision = off
			Set Node14_MAC8023_PORT_4.NumUniInPkt = off
			Set Node14_MAC8023_PORT_4.NumUniOutPkt = off
			Set Node14_MAC8023_PORT_4.NumUniInOutPkt = off
			Set Node14_MAC8023_PORT_4.NumBroInPkt = off
			Set Node14_MAC8023_PORT_4.NumBroOutPkt = off
			Set Node14_MAC8023_PORT_4.NumBroInOutPkt = off
			Set Node14_MAC8023_PORT_4.NumDrop = off
			Set Node14_MAC8023_PORT_4.InThrput = off
			Set Node14_MAC8023_PORT_4.OutThrput = off
			Set Node14_MAC8023_PORT_4.InOutThrput = off
			Set Node14_MAC8023_PORT_4.UniInLogFile = topo1.8023_N14_P4_UniIn.log
			Set Node14_MAC8023_PORT_4.UniOutLogFile = topo1.8023_N14_P4_UniOut.log
			Set Node14_MAC8023_PORT_4.UniInOutLogFile = topo1.8023_N14_P4_UniInOut.log
			Set Node14_MAC8023_PORT_4.BroInLogFile = topo1.8023_N14_P4_BroIn.log
			Set Node14_MAC8023_PORT_4.BroOutLogFile = topo1.8023_N14_P4_BroOut.log
			Set Node14_MAC8023_PORT_4.BroInOutLogFile = topo1.8023_N14_P4_BroInOut.log
			Set Node14_MAC8023_PORT_4.CollLogFile = topo1.8023_N14_P4_Coll.log
			Set Node14_MAC8023_PORT_4.DropLogFile = topo1.8023_N14_P4_Drop.log
			Set Node14_MAC8023_PORT_4.InThrputLogFile = topo1.8023_N14_P4_InThrput.log
			Set Node14_MAC8023_PORT_4.OutThrputLogFile = topo1.8023_N14_P4_OutThrput.log
			Set Node14_MAC8023_PORT_4.InOutThrputLogFile = topo1.8023_N14_P4_InOutThrput.log
			Set Node14_MAC8023_PORT_4.LinktoHub = 0

		Module Phy : Node14_Phy_PORT_4
			Set Node14_Phy_PORT_4.Bw = 10
			Set Node14_Phy_PORT_4.BER = 0.0
			Set Node14_Phy_PORT_4.PropDelay = 1
			Set Node14_Phy_PORT_4.linkfail = off
			Set Node14_Phy_PORT_4.linkfailFileName = topo1.phy_N14_P4.linkfail

		Module Link : Node14_PORT_4
			Set Node14_PORT_4.guitag_remotenode = yes


		Bind Node14_MAC8023_PORT_4 Node14_Phy_PORT_4
		Bind Node14_Phy_PORT_4 Node14_PORT_4
	EndDefine

	Define port 5
		Module MAC8023 : Node14_MAC8023_PORT_5

			Set Node14_OFSwitch_0.port5 = Node14_MAC8023_PORT_5
			Set Node14_OFSwitch_0.fixed_net5 = Node14_MAC8023_PORT_5.no
			Set Node14_MAC8023_PORT_5.recvtarget = Node14_OFSwitch_0

			Set Node14_MAC8023_PORT_5.mac = 0:1:0:0:0:6a
			Set Node14_MAC8023_PORT_5.lock_mac = off
			Set Node14_MAC8023_PORT_5.PromisOpt = on
			Set Node14_MAC8023_PORT_5.mode = full
			Set Node14_MAC8023_PORT_5.log = off
			Set Node14_MAC8023_PORT_5.logInterval = 1
			Set Node14_MAC8023_PORT_5.NumCollision = off
			Set Node14_MAC8023_PORT_5.NumUniInPkt = off
			Set Node14_MAC8023_PORT_5.NumUniOutPkt = off
			Set Node14_MAC8023_PORT_5.NumUniInOutPkt = off
			Set Node14_MAC8023_PORT_5.NumBroInPkt = off
			Set Node14_MAC8023_PORT_5.NumBroOutPkt = off
			Set Node14_MAC8023_PORT_5.NumBroInOutPkt = off
			Set Node14_MAC8023_PORT_5.NumDrop = off
			Set Node14_MAC8023_PORT_5.InThrput = off
			Set Node14_MAC8023_PORT_5.OutThrput = off
			Set Node14_MAC8023_PORT_5.InOutThrput = off
			Set Node14_MAC8023_PORT_5.UniInLogFile = topo1.8023_N14_P5_UniIn.log
			Set Node14_MAC8023_PORT_5.UniOutLogFile = topo1.8023_N14_P5_UniOut.log
			Set Node14_MAC8023_PORT_5.UniInOutLogFile = topo1.8023_N14_P5_UniInOut.log
			Set Node14_MAC8023_PORT_5.BroInLogFile = topo1.8023_N14_P5_BroIn.log
			Set Node14_MAC8023_PORT_5.BroOutLogFile = topo1.8023_N14_P5_BroOut.log
			Set Node14_MAC8023_PORT_5.BroInOutLogFile = topo1.8023_N14_P5_BroInOut.log
			Set Node14_MAC8023_PORT_5.CollLogFile = topo1.8023_N14_P5_Coll.log
			Set Node14_MAC8023_PORT_5.DropLogFile = topo1.8023_N14_P5_Drop.log
			Set Node14_MAC8023_PORT_5.InThrputLogFile = topo1.8023_N14_P5_InThrput.log
			Set Node14_MAC8023_PORT_5.OutThrputLogFile = topo1.8023_N14_P5_OutThrput.log
			Set Node14_MAC8023_PORT_5.InOutThrputLogFile = topo1.8023_N14_P5_InOutThrput.log
			Set Node14_MAC8023_PORT_5.LinktoHub = 0

		Module Phy : Node14_Phy_PORT_5
			Set Node14_Phy_PORT_5.Bw = 10
			Set Node14_Phy_PORT_5.BER = 0.0
			Set Node14_Phy_PORT_5.PropDelay = 1
			Set Node14_Phy_PORT_5.linkfail = off
			Set Node14_Phy_PORT_5.linkfailFileName = topo1.phy_N14_P5.linkfail

		Module Link : Node14_PORT_5
			Set Node14_PORT_5.guitag_remotenode = yes


		Bind Node14_MAC8023_PORT_5 Node14_Phy_PORT_5
		Bind Node14_Phy_PORT_5 Node14_PORT_5
	EndDefine

	Define port 6
		Module MAC8023 : Node14_MAC8023_PORT_6

			Set Node14_OFSwitch_0.port6 = Node14_MAC8023_PORT_6
			Set Node14_OFSwitch_0.fixed_net6 = Node14_MAC8023_PORT_6.no
			Set Node14_MAC8023_PORT_6.recvtarget = Node14_OFSwitch_0

			Set Node14_MAC8023_PORT_6.mac = 0:1:0:0:0:6b
			Set Node14_MAC8023_PORT_6.lock_mac = off
			Set Node14_MAC8023_PORT_6.PromisOpt = on
			Set Node14_MAC8023_PORT_6.mode = full
			Set Node14_MAC8023_PORT_6.log = off
			Set Node14_MAC8023_PORT_6.logInterval = 1
			Set Node14_MAC8023_PORT_6.NumCollision = off
			Set Node14_MAC8023_PORT_6.NumUniInPkt = off
			Set Node14_MAC8023_PORT_6.NumUniOutPkt = off
			Set Node14_MAC8023_PORT_6.NumUniInOutPkt = off
			Set Node14_MAC8023_PORT_6.NumBroInPkt = off
			Set Node14_MAC8023_PORT_6.NumBroOutPkt = off
			Set Node14_MAC8023_PORT_6.NumBroInOutPkt = off
			Set Node14_MAC8023_PORT_6.NumDrop = off
			Set Node14_MAC8023_PORT_6.InThrput = off
			Set Node14_MAC8023_PORT_6.OutThrput = off
			Set Node14_MAC8023_PORT_6.InOutThrput = off
			Set Node14_MAC8023_PORT_6.UniInLogFile = topo1.8023_N14_P6_UniIn.log
			Set Node14_MAC8023_PORT_6.UniOutLogFile = topo1.8023_N14_P6_UniOut.log
			Set Node14_MAC8023_PORT_6.UniInOutLogFile = topo1.8023_N14_P6_UniInOut.log
			Set Node14_MAC8023_PORT_6.BroInLogFile = topo1.8023_N14_P6_BroIn.log
			Set Node14_MAC8023_PORT_6.BroOutLogFile = topo1.8023_N14_P6_BroOut.log
			Set Node14_MAC8023_PORT_6.BroInOutLogFile = topo1.8023_N14_P6_BroInOut.log
			Set Node14_MAC8023_PORT_6.CollLogFile = topo1.8023_N14_P6_Coll.log
			Set Node14_MAC8023_PORT_6.DropLogFile = topo1.8023_N14_P6_Drop.log
			Set Node14_MAC8023_PORT_6.InThrputLogFile = topo1.8023_N14_P6_InThrput.log
			Set Node14_MAC8023_PORT_6.OutThrputLogFile = topo1.8023_N14_P6_OutThrput.log
			Set Node14_MAC8023_PORT_6.InOutThrputLogFile = topo1.8023_N14_P6_InOutThrput.log
			Set Node14_MAC8023_PORT_6.LinktoHub = 0

		Module Phy : Node14_Phy_PORT_6
			Set Node14_Phy_PORT_6.Bw = 10
			Set Node14_Phy_PORT_6.BER = 0.0
			Set Node14_Phy_PORT_6.PropDelay = 1
			Set Node14_Phy_PORT_6.linkfail = off
			Set Node14_Phy_PORT_6.linkfailFileName = topo1.phy_N14_P6.linkfail

		Module Link : Node14_PORT_6
			Set Node14_PORT_6.guitag_remotenode = yes


		Bind Node14_MAC8023_PORT_6 Node14_Phy_PORT_6
		Bind Node14_Phy_PORT_6 Node14_PORT_6
	EndDefine

	Define port 7
		Module MAC8023 : Node14_MAC8023_PORT_7

			Set Node14_OFSwitch_0.port7 = Node14_MAC8023_PORT_7
			Set Node14_OFSwitch_0.fixed_net7 = Node14_MAC8023_PORT_7.no
			Set Node14_MAC8023_PORT_7.recvtarget = Node14_OFSwitch_0

			Set Node14_MAC8023_PORT_7.mac = 0:1:0:0:0:6c
			Set Node14_MAC8023_PORT_7.lock_mac = off
			Set Node14_MAC8023_PORT_7.PromisOpt = on
			Set Node14_MAC8023_PORT_7.mode = full
			Set Node14_MAC8023_PORT_7.log = off
			Set Node14_MAC8023_PORT_7.logInterval = 1
			Set Node14_MAC8023_PORT_7.NumCollision = off
			Set Node14_MAC8023_PORT_7.NumUniInPkt = off
			Set Node14_MAC8023_PORT_7.NumUniOutPkt = off
			Set Node14_MAC8023_PORT_7.NumUniInOutPkt = off
			Set Node14_MAC8023_PORT_7.NumBroInPkt = off
			Set Node14_MAC8023_PORT_7.NumBroOutPkt = off
			Set Node14_MAC8023_PORT_7.NumBroInOutPkt = off
			Set Node14_MAC8023_PORT_7.NumDrop = off
			Set Node14_MAC8023_PORT_7.InThrput = off
			Set Node14_MAC8023_PORT_7.OutThrput = off
			Set Node14_MAC8023_PORT_7.InOutThrput = off
			Set Node14_MAC8023_PORT_7.UniInLogFile = topo1.8023_N14_P7_UniIn.log
			Set Node14_MAC8023_PORT_7.UniOutLogFile = topo1.8023_N14_P7_UniOut.log
			Set Node14_MAC8023_PORT_7.UniInOutLogFile = topo1.8023_N14_P7_UniInOut.log
			Set Node14_MAC8023_PORT_7.BroInLogFile = topo1.8023_N14_P7_BroIn.log
			Set Node14_MAC8023_PORT_7.BroOutLogFile = topo1.8023_N14_P7_BroOut.log
			Set Node14_MAC8023_PORT_7.BroInOutLogFile = topo1.8023_N14_P7_BroInOut.log
			Set Node14_MAC8023_PORT_7.CollLogFile = topo1.8023_N14_P7_Coll.log
			Set Node14_MAC8023_PORT_7.DropLogFile = topo1.8023_N14_P7_Drop.log
			Set Node14_MAC8023_PORT_7.InThrputLogFile = topo1.8023_N14_P7_InThrput.log
			Set Node14_MAC8023_PORT_7.OutThrputLogFile = topo1.8023_N14_P7_OutThrput.log
			Set Node14_MAC8023_PORT_7.InOutThrputLogFile = topo1.8023_N14_P7_InOutThrput.log
			Set Node14_MAC8023_PORT_7.LinktoHub = 0

		Module Phy : Node14_Phy_PORT_7
			Set Node14_Phy_PORT_7.Bw = 10
			Set Node14_Phy_PORT_7.BER = 0.0
			Set Node14_Phy_PORT_7.PropDelay = 1
			Set Node14_Phy_PORT_7.linkfail = off
			Set Node14_Phy_PORT_7.linkfailFileName = topo1.phy_N14_P7.linkfail

		Module Link : Node14_PORT_7
			Set Node14_PORT_7.guitag_remotenode = yes


		Bind Node14_MAC8023_PORT_7 Node14_Phy_PORT_7
		Bind Node14_Phy_PORT_7 Node14_PORT_7
	EndDefine

	Define port 8
		Module MAC8023 : Node14_MAC8023_PORT_8

			Set Node14_OFSwitch_0.port8 = Node14_MAC8023_PORT_8
			Set Node14_OFSwitch_0.fixed_net8 = Node14_MAC8023_PORT_8.no
			Set Node14_MAC8023_PORT_8.recvtarget = Node14_OFSwitch_0

			Set Node14_MAC8023_PORT_8.mac = 0:1:0:0:0:6d
			Set Node14_MAC8023_PORT_8.lock_mac = off
			Set Node14_MAC8023_PORT_8.PromisOpt = on
			Set Node14_MAC8023_PORT_8.mode = full
			Set Node14_MAC8023_PORT_8.log = off
			Set Node14_MAC8023_PORT_8.logInterval = 1
			Set Node14_MAC8023_PORT_8.NumCollision = off
			Set Node14_MAC8023_PORT_8.NumUniInPkt = off
			Set Node14_MAC8023_PORT_8.NumUniOutPkt = off
			Set Node14_MAC8023_PORT_8.NumUniInOutPkt = off
			Set Node14_MAC8023_PORT_8.NumBroInPkt = off
			Set Node14_MAC8023_PORT_8.NumBroOutPkt = off
			Set Node14_MAC8023_PORT_8.NumBroInOutPkt = off
			Set Node14_MAC8023_PORT_8.NumDrop = off
			Set Node14_MAC8023_PORT_8.InThrput = off
			Set Node14_MAC8023_PORT_8.OutThrput = off
			Set Node14_MAC8023_PORT_8.InOutThrput = off
			Set Node14_MAC8023_PORT_8.UniInLogFile = topo1.8023_N14_P8_UniIn.log
			Set Node14_MAC8023_PORT_8.UniOutLogFile = topo1.8023_N14_P8_UniOut.log
			Set Node14_MAC8023_PORT_8.UniInOutLogFile = topo1.8023_N14_P8_UniInOut.log
			Set Node14_MAC8023_PORT_8.BroInLogFile = topo1.8023_N14_P8_BroIn.log
			Set Node14_MAC8023_PORT_8.BroOutLogFile = topo1.8023_N14_P8_BroOut.log
			Set Node14_MAC8023_PORT_8.BroInOutLogFile = topo1.8023_N14_P8_BroInOut.log
			Set Node14_MAC8023_PORT_8.CollLogFile = topo1.8023_N14_P8_Coll.log
			Set Node14_MAC8023_PORT_8.DropLogFile = topo1.8023_N14_P8_Drop.log
			Set Node14_MAC8023_PORT_8.InThrputLogFile = topo1.8023_N14_P8_InThrput.log
			Set Node14_MAC8023_PORT_8.OutThrputLogFile = topo1.8023_N14_P8_OutThrput.log
			Set Node14_MAC8023_PORT_8.InOutThrputLogFile = topo1.8023_N14_P8_InOutThrput.log
			Set Node14_MAC8023_PORT_8.LinktoHub = 0

		Module Phy : Node14_Phy_PORT_8
			Set Node14_Phy_PORT_8.Bw = 10
			Set Node14_Phy_PORT_8.BER = 0.0
			Set Node14_Phy_PORT_8.PropDelay = 1
			Set Node14_Phy_PORT_8.linkfail = off
			Set Node14_Phy_PORT_8.linkfailFileName = topo1.phy_N14_P8.linkfail

		Module Link : Node14_PORT_8
			Set Node14_PORT_8.guitag_remotenode = yes


		Bind Node14_MAC8023_PORT_8 Node14_Phy_PORT_8
		Bind Node14_Phy_PORT_8 Node14_PORT_8
	EndDefine

	Define port 9
		Module MAC8023 : Node14_MAC8023_PORT_9

			Set Node14_OFSwitch_0.port9 = Node14_MAC8023_PORT_9
			Set Node14_OFSwitch_0.fixed_net9 = Node14_MAC8023_PORT_9.no
			Set Node14_MAC8023_PORT_9.recvtarget = Node14_OFSwitch_0

			Set Node14_MAC8023_PORT_9.mac = 0:1:0:0:0:6e
			Set Node14_MAC8023_PORT_9.lock_mac = off
			Set Node14_MAC8023_PORT_9.PromisOpt = on
			Set Node14_MAC8023_PORT_9.mode = full
			Set Node14_MAC8023_PORT_9.log = off
			Set Node14_MAC8023_PORT_9.logInterval = 1
			Set Node14_MAC8023_PORT_9.NumCollision = off
			Set Node14_MAC8023_PORT_9.NumUniInPkt = off
			Set Node14_MAC8023_PORT_9.NumUniOutPkt = off
			Set Node14_MAC8023_PORT_9.NumUniInOutPkt = off
			Set Node14_MAC8023_PORT_9.NumBroInPkt = off
			Set Node14_MAC8023_PORT_9.NumBroOutPkt = off
			Set Node14_MAC8023_PORT_9.NumBroInOutPkt = off
			Set Node14_MAC8023_PORT_9.NumDrop = off
			Set Node14_MAC8023_PORT_9.InThrput = off
			Set Node14_MAC8023_PORT_9.OutThrput = off
			Set Node14_MAC8023_PORT_9.InOutThrput = off
			Set Node14_MAC8023_PORT_9.UniInLogFile = topo1.8023_N14_P9_UniIn.log
			Set Node14_MAC8023_PORT_9.UniOutLogFile = topo1.8023_N14_P9_UniOut.log
			Set Node14_MAC8023_PORT_9.UniInOutLogFile = topo1.8023_N14_P9_UniInOut.log
			Set Node14_MAC8023_PORT_9.BroInLogFile = topo1.8023_N14_P9_BroIn.log
			Set Node14_MAC8023_PORT_9.BroOutLogFile = topo1.8023_N14_P9_BroOut.log
			Set Node14_MAC8023_PORT_9.BroInOutLogFile = topo1.8023_N14_P9_BroInOut.log
			Set Node14_MAC8023_PORT_9.CollLogFile = topo1.8023_N14_P9_Coll.log
			Set Node14_MAC8023_PORT_9.DropLogFile = topo1.8023_N14_P9_Drop.log
			Set Node14_MAC8023_PORT_9.InThrputLogFile = topo1.8023_N14_P9_InThrput.log
			Set Node14_MAC8023_PORT_9.OutThrputLogFile = topo1.8023_N14_P9_OutThrput.log
			Set Node14_MAC8023_PORT_9.InOutThrputLogFile = topo1.8023_N14_P9_InOutThrput.log
			Set Node14_MAC8023_PORT_9.LinktoHub = 0

		Module Phy : Node14_Phy_PORT_9
			Set Node14_Phy_PORT_9.Bw = 10
			Set Node14_Phy_PORT_9.BER = 0.0
			Set Node14_Phy_PORT_9.PropDelay = 1
			Set Node14_Phy_PORT_9.linkfail = off
			Set Node14_Phy_PORT_9.linkfailFileName = topo1.phy_N14_P9.linkfail

		Module Link : Node14_PORT_9
			Set Node14_PORT_9.guitag_remotenode = yes


		Bind Node14_MAC8023_PORT_9 Node14_Phy_PORT_9
		Bind Node14_Phy_PORT_9 Node14_PORT_9
	EndDefine

	Define port 10
		Module MAC8023 : Node14_MAC8023_PORT_10

			Set Node14_OFSwitch_0.port10 = Node14_MAC8023_PORT_10
			Set Node14_OFSwitch_0.fixed_net10 = Node14_MAC8023_PORT_10.no
			Set Node14_MAC8023_PORT_10.recvtarget = Node14_OFSwitch_0

			Set Node14_MAC8023_PORT_10.mac = 0:1:0:0:0:6f
			Set Node14_MAC8023_PORT_10.lock_mac = off
			Set Node14_MAC8023_PORT_10.PromisOpt = on
			Set Node14_MAC8023_PORT_10.mode = full
			Set Node14_MAC8023_PORT_10.log = off
			Set Node14_MAC8023_PORT_10.logInterval = 1
			Set Node14_MAC8023_PORT_10.NumCollision = off
			Set Node14_MAC8023_PORT_10.NumUniInPkt = off
			Set Node14_MAC8023_PORT_10.NumUniOutPkt = off
			Set Node14_MAC8023_PORT_10.NumUniInOutPkt = off
			Set Node14_MAC8023_PORT_10.NumBroInPkt = off
			Set Node14_MAC8023_PORT_10.NumBroOutPkt = off
			Set Node14_MAC8023_PORT_10.NumBroInOutPkt = off
			Set Node14_MAC8023_PORT_10.NumDrop = off
			Set Node14_MAC8023_PORT_10.InThrput = off
			Set Node14_MAC8023_PORT_10.OutThrput = off
			Set Node14_MAC8023_PORT_10.InOutThrput = off
			Set Node14_MAC8023_PORT_10.UniInLogFile = topo1.8023_N14_P10_UniIn.log
			Set Node14_MAC8023_PORT_10.UniOutLogFile = topo1.8023_N14_P10_UniOut.log
			Set Node14_MAC8023_PORT_10.UniInOutLogFile = topo1.8023_N14_P10_UniInOut.log
			Set Node14_MAC8023_PORT_10.BroInLogFile = topo1.8023_N14_P10_BroIn.log
			Set Node14_MAC8023_PORT_10.BroOutLogFile = topo1.8023_N14_P10_BroOut.log
			Set Node14_MAC8023_PORT_10.BroInOutLogFile = topo1.8023_N14_P10_BroInOut.log
			Set Node14_MAC8023_PORT_10.CollLogFile = topo1.8023_N14_P10_Coll.log
			Set Node14_MAC8023_PORT_10.DropLogFile = topo1.8023_N14_P10_Drop.log
			Set Node14_MAC8023_PORT_10.InThrputLogFile = topo1.8023_N14_P10_InThrput.log
			Set Node14_MAC8023_PORT_10.OutThrputLogFile = topo1.8023_N14_P10_OutThrput.log
			Set Node14_MAC8023_PORT_10.InOutThrputLogFile = topo1.8023_N14_P10_InOutThrput.log
			Set Node14_MAC8023_PORT_10.LinktoHub = 0

		Module Phy : Node14_Phy_PORT_10
			Set Node14_Phy_PORT_10.Bw = 10
			Set Node14_Phy_PORT_10.BER = 0.0
			Set Node14_Phy_PORT_10.PropDelay = 1
			Set Node14_Phy_PORT_10.linkfail = off
			Set Node14_Phy_PORT_10.linkfailFileName = topo1.phy_N14_P10.linkfail

		Module Link : Node14_PORT_10
			Set Node14_PORT_10.guitag_remotenode = yes


		Bind Node14_MAC8023_PORT_10 Node14_Phy_PORT_10
		Bind Node14_Phy_PORT_10 Node14_PORT_10
	EndDefine

	Define port 11
		Module MAC8023 : Node14_MAC8023_PORT_11

			Set Node14_OFSwitch_0.port11 = Node14_MAC8023_PORT_11
			Set Node14_OFSwitch_0.fixed_net11 = Node14_MAC8023_PORT_11.no
			Set Node14_MAC8023_PORT_11.recvtarget = Node14_OFSwitch_0

			Set Node14_MAC8023_PORT_11.mac = 0:1:0:0:0:70
			Set Node14_MAC8023_PORT_11.lock_mac = off
			Set Node14_MAC8023_PORT_11.PromisOpt = on
			Set Node14_MAC8023_PORT_11.mode = full
			Set Node14_MAC8023_PORT_11.log = off
			Set Node14_MAC8023_PORT_11.logInterval = 1
			Set Node14_MAC8023_PORT_11.NumCollision = off
			Set Node14_MAC8023_PORT_11.NumUniInPkt = off
			Set Node14_MAC8023_PORT_11.NumUniOutPkt = off
			Set Node14_MAC8023_PORT_11.NumUniInOutPkt = off
			Set Node14_MAC8023_PORT_11.NumBroInPkt = off
			Set Node14_MAC8023_PORT_11.NumBroOutPkt = off
			Set Node14_MAC8023_PORT_11.NumBroInOutPkt = off
			Set Node14_MAC8023_PORT_11.NumDrop = off
			Set Node14_MAC8023_PORT_11.InThrput = off
			Set Node14_MAC8023_PORT_11.OutThrput = off
			Set Node14_MAC8023_PORT_11.InOutThrput = off
			Set Node14_MAC8023_PORT_11.UniInLogFile = topo1.8023_N14_P11_UniIn.log
			Set Node14_MAC8023_PORT_11.UniOutLogFile = topo1.8023_N14_P11_UniOut.log
			Set Node14_MAC8023_PORT_11.UniInOutLogFile = topo1.8023_N14_P11_UniInOut.log
			Set Node14_MAC8023_PORT_11.BroInLogFile = topo1.8023_N14_P11_BroIn.log
			Set Node14_MAC8023_PORT_11.BroOutLogFile = topo1.8023_N14_P11_BroOut.log
			Set Node14_MAC8023_PORT_11.BroInOutLogFile = topo1.8023_N14_P11_BroInOut.log
			Set Node14_MAC8023_PORT_11.CollLogFile = topo1.8023_N14_P11_Coll.log
			Set Node14_MAC8023_PORT_11.DropLogFile = topo1.8023_N14_P11_Drop.log
			Set Node14_MAC8023_PORT_11.InThrputLogFile = topo1.8023_N14_P11_InThrput.log
			Set Node14_MAC8023_PORT_11.OutThrputLogFile = topo1.8023_N14_P11_OutThrput.log
			Set Node14_MAC8023_PORT_11.InOutThrputLogFile = topo1.8023_N14_P11_InOutThrput.log
			Set Node14_MAC8023_PORT_11.LinktoHub = 0

		Module Phy : Node14_Phy_PORT_11
			Set Node14_Phy_PORT_11.Bw = 10
			Set Node14_Phy_PORT_11.BER = 0.0
			Set Node14_Phy_PORT_11.PropDelay = 1
			Set Node14_Phy_PORT_11.linkfail = off
			Set Node14_Phy_PORT_11.linkfailFileName = topo1.phy_N14_P11.linkfail

		Module Link : Node14_PORT_11
			Set Node14_PORT_11.guitag_remotenode = yes


		Bind Node14_MAC8023_PORT_11 Node14_Phy_PORT_11
		Bind Node14_Phy_PORT_11 Node14_PORT_11
	EndDefine

	Define port 12
		Module MAC8023 : Node14_MAC8023_PORT_12

			Set Node14_OFSwitch_0.port12 = Node14_MAC8023_PORT_12
			Set Node14_OFSwitch_0.fixed_net12 = Node14_MAC8023_PORT_12.no
			Set Node14_MAC8023_PORT_12.recvtarget = Node14_OFSwitch_0

			Set Node14_MAC8023_PORT_12.mac = 0:1:0:0:0:71
			Set Node14_MAC8023_PORT_12.lock_mac = off
			Set Node14_MAC8023_PORT_12.PromisOpt = on
			Set Node14_MAC8023_PORT_12.mode = full
			Set Node14_MAC8023_PORT_12.log = off
			Set Node14_MAC8023_PORT_12.logInterval = 1
			Set Node14_MAC8023_PORT_12.NumCollision = off
			Set Node14_MAC8023_PORT_12.NumUniInPkt = off
			Set Node14_MAC8023_PORT_12.NumUniOutPkt = off
			Set Node14_MAC8023_PORT_12.NumUniInOutPkt = off
			Set Node14_MAC8023_PORT_12.NumBroInPkt = off
			Set Node14_MAC8023_PORT_12.NumBroOutPkt = off
			Set Node14_MAC8023_PORT_12.NumBroInOutPkt = off
			Set Node14_MAC8023_PORT_12.NumDrop = off
			Set Node14_MAC8023_PORT_12.InThrput = off
			Set Node14_MAC8023_PORT_12.OutThrput = off
			Set Node14_MAC8023_PORT_12.InOutThrput = off
			Set Node14_MAC8023_PORT_12.UniInLogFile = topo1.8023_N14_P12_UniIn.log
			Set Node14_MAC8023_PORT_12.UniOutLogFile = topo1.8023_N14_P12_UniOut.log
			Set Node14_MAC8023_PORT_12.UniInOutLogFile = topo1.8023_N14_P12_UniInOut.log
			Set Node14_MAC8023_PORT_12.BroInLogFile = topo1.8023_N14_P12_BroIn.log
			Set Node14_MAC8023_PORT_12.BroOutLogFile = topo1.8023_N14_P12_BroOut.log
			Set Node14_MAC8023_PORT_12.BroInOutLogFile = topo1.8023_N14_P12_BroInOut.log
			Set Node14_MAC8023_PORT_12.CollLogFile = topo1.8023_N14_P12_Coll.log
			Set Node14_MAC8023_PORT_12.DropLogFile = topo1.8023_N14_P12_Drop.log
			Set Node14_MAC8023_PORT_12.InThrputLogFile = topo1.8023_N14_P12_InThrput.log
			Set Node14_MAC8023_PORT_12.OutThrputLogFile = topo1.8023_N14_P12_OutThrput.log
			Set Node14_MAC8023_PORT_12.InOutThrputLogFile = topo1.8023_N14_P12_InOutThrput.log
			Set Node14_MAC8023_PORT_12.LinktoHub = 0

		Module Phy : Node14_Phy_PORT_12
			Set Node14_Phy_PORT_12.Bw = 10
			Set Node14_Phy_PORT_12.BER = 0.0
			Set Node14_Phy_PORT_12.PropDelay = 1
			Set Node14_Phy_PORT_12.linkfail = off
			Set Node14_Phy_PORT_12.linkfailFileName = topo1.phy_N14_P12.linkfail

		Module Link : Node14_PORT_12
			Set Node14_PORT_12.guitag_remotenode = yes


		Bind Node14_MAC8023_PORT_12 Node14_Phy_PORT_12
		Bind Node14_Phy_PORT_12 Node14_PORT_12
	EndDefine

EndCreate

Create Node 15 as OF_SW with name = OF_SW15
	Module OFSwitch : Node15_OFSwitch_0
		Set Node15_OFSwitch_0.guitag_addport = yes
		Set Node15_OFSwitch_0.flow_table_amount = 15
		Set Node15_OFSwitch_0.flow_table_entry_amount = 256
		Set Node15_OFSwitch_0.group_table_entry_amount = 256
		Set Node15_OFSwitch_0.table_miss_buffer_size = 1000
		Set Node15_OFSwitch_0.fifo_queue_size = 50
		Set Node15_OFSwitch_0.controller_ip = 1.0.1.1
	Define port 1
		Module Interface : Node15_Interface_PORT_1

			Set Node15_OFSwitch_0.port1 = Node15_Interface_PORT_1
			Set Node15_OFSwitch_0.fixed_net1 = Node15_Interface_PORT_1.no
			Set Node15_Interface_PORT_1.recvtarget = Node15_OFSwitch_0

			Set Node15_Interface_PORT_1.ip = 1.0.1.10
			Set Node15_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node15_ARP_PORT_1
			Set Node15_ARP_PORT_1.arpMode = RunARP
			Set Node15_ARP_PORT_1.flushInterval = 3000
			Set Node15_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node15_FIFO_PORT_1
			Set Node15_FIFO_PORT_1.max_qlen = 50
			Set Node15_FIFO_PORT_1.log_qlen = off
			Set Node15_FIFO_PORT_1.log_option = FullLog
			Set Node15_FIFO_PORT_1.samplerate = 1
			Set Node15_FIFO_PORT_1.logFileName = topo1.fifo_N15_P1_qlen.log
			Set Node15_FIFO_PORT_1.log_drop = off
			Set Node15_FIFO_PORT_1.drop_samplerate = 1
			Set Node15_FIFO_PORT_1.droplogFileName = topo1.fifo_N15_P1_drop.log

		Module TCPDUMP : Node15_TCPDUMP_PORT_1

		Module MAC8023 : Node15_MAC8023_PORT_1
			Set Node15_MAC8023_PORT_1.mac = 0:1:0:0:0:72
			Set Node15_MAC8023_PORT_1.lock_mac = off
			Set Node15_MAC8023_PORT_1.PromisOpt = on
			Set Node15_MAC8023_PORT_1.mode = full
			Set Node15_MAC8023_PORT_1.log = off
			Set Node15_MAC8023_PORT_1.logInterval = 1
			Set Node15_MAC8023_PORT_1.NumCollision = off
			Set Node15_MAC8023_PORT_1.NumUniInPkt = off
			Set Node15_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node15_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node15_MAC8023_PORT_1.NumBroInPkt = off
			Set Node15_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node15_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node15_MAC8023_PORT_1.NumDrop = off
			Set Node15_MAC8023_PORT_1.InThrput = off
			Set Node15_MAC8023_PORT_1.OutThrput = off
			Set Node15_MAC8023_PORT_1.InOutThrput = off
			Set Node15_MAC8023_PORT_1.UniInLogFile = topo1.8023_N15_P1_UniIn.log
			Set Node15_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N15_P1_UniOut.log
			Set Node15_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N15_P1_UniInOut.log
			Set Node15_MAC8023_PORT_1.BroInLogFile = topo1.8023_N15_P1_BroIn.log
			Set Node15_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N15_P1_BroOut.log
			Set Node15_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N15_P1_BroInOut.log
			Set Node15_MAC8023_PORT_1.CollLogFile = topo1.8023_N15_P1_Coll.log
			Set Node15_MAC8023_PORT_1.DropLogFile = topo1.8023_N15_P1_Drop.log
			Set Node15_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N15_P1_InThrput.log
			Set Node15_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N15_P1_OutThrput.log
			Set Node15_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N15_P1_InOutThrput.log
			Set Node15_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node15_Phy_PORT_1
			Set Node15_Phy_PORT_1.Bw = 10
			Set Node15_Phy_PORT_1.BER = 0.0
			Set Node15_Phy_PORT_1.PropDelay = 1
			Set Node15_Phy_PORT_1.linkfail = off
			Set Node15_Phy_PORT_1.linkfailFileName = topo1.phy_N15_P1.linkfail

		Module Link : Node15_PORT_1
			Set Node15_PORT_1.guitag_remotenode = yes


		Bind Node15_Interface_PORT_1 Node15_ARP_PORT_1
		Bind Node15_ARP_PORT_1 Node15_FIFO_PORT_1
		Bind Node15_FIFO_PORT_1 Node15_TCPDUMP_PORT_1
		Bind Node15_TCPDUMP_PORT_1 Node15_MAC8023_PORT_1
		Bind Node15_MAC8023_PORT_1 Node15_Phy_PORT_1
		Bind Node15_Phy_PORT_1 Node15_PORT_1
	EndDefine

	Define port 2
		Module MAC8023 : Node15_MAC8023_PORT_2

			Set Node15_OFSwitch_0.port2 = Node15_MAC8023_PORT_2
			Set Node15_OFSwitch_0.fixed_net2 = Node15_MAC8023_PORT_2.no
			Set Node15_MAC8023_PORT_2.recvtarget = Node15_OFSwitch_0

			Set Node15_MAC8023_PORT_2.mac = 0:1:0:0:0:73
			Set Node15_MAC8023_PORT_2.lock_mac = off
			Set Node15_MAC8023_PORT_2.PromisOpt = on
			Set Node15_MAC8023_PORT_2.mode = full
			Set Node15_MAC8023_PORT_2.log = off
			Set Node15_MAC8023_PORT_2.logInterval = 1
			Set Node15_MAC8023_PORT_2.NumCollision = off
			Set Node15_MAC8023_PORT_2.NumUniInPkt = off
			Set Node15_MAC8023_PORT_2.NumUniOutPkt = off
			Set Node15_MAC8023_PORT_2.NumUniInOutPkt = off
			Set Node15_MAC8023_PORT_2.NumBroInPkt = off
			Set Node15_MAC8023_PORT_2.NumBroOutPkt = off
			Set Node15_MAC8023_PORT_2.NumBroInOutPkt = off
			Set Node15_MAC8023_PORT_2.NumDrop = off
			Set Node15_MAC8023_PORT_2.InThrput = off
			Set Node15_MAC8023_PORT_2.OutThrput = off
			Set Node15_MAC8023_PORT_2.InOutThrput = off
			Set Node15_MAC8023_PORT_2.UniInLogFile = topo1.8023_N15_P2_UniIn.log
			Set Node15_MAC8023_PORT_2.UniOutLogFile = topo1.8023_N15_P2_UniOut.log
			Set Node15_MAC8023_PORT_2.UniInOutLogFile = topo1.8023_N15_P2_UniInOut.log
			Set Node15_MAC8023_PORT_2.BroInLogFile = topo1.8023_N15_P2_BroIn.log
			Set Node15_MAC8023_PORT_2.BroOutLogFile = topo1.8023_N15_P2_BroOut.log
			Set Node15_MAC8023_PORT_2.BroInOutLogFile = topo1.8023_N15_P2_BroInOut.log
			Set Node15_MAC8023_PORT_2.CollLogFile = topo1.8023_N15_P2_Coll.log
			Set Node15_MAC8023_PORT_2.DropLogFile = topo1.8023_N15_P2_Drop.log
			Set Node15_MAC8023_PORT_2.InThrputLogFile = topo1.8023_N15_P2_InThrput.log
			Set Node15_MAC8023_PORT_2.OutThrputLogFile = topo1.8023_N15_P2_OutThrput.log
			Set Node15_MAC8023_PORT_2.InOutThrputLogFile = topo1.8023_N15_P2_InOutThrput.log
			Set Node15_MAC8023_PORT_2.LinktoHub = 0

		Module Phy : Node15_Phy_PORT_2
			Set Node15_Phy_PORT_2.Bw = 10
			Set Node15_Phy_PORT_2.BER = 0.0
			Set Node15_Phy_PORT_2.PropDelay = 1
			Set Node15_Phy_PORT_2.linkfail = off
			Set Node15_Phy_PORT_2.linkfailFileName = topo1.phy_N15_P2.linkfail

		Module Link : Node15_PORT_2
			Set Node15_PORT_2.guitag_remotenode = yes


		Bind Node15_MAC8023_PORT_2 Node15_Phy_PORT_2
		Bind Node15_Phy_PORT_2 Node15_PORT_2
	EndDefine

	Define port 3
		Module MAC8023 : Node15_MAC8023_PORT_3

			Set Node15_OFSwitch_0.port3 = Node15_MAC8023_PORT_3
			Set Node15_OFSwitch_0.fixed_net3 = Node15_MAC8023_PORT_3.no
			Set Node15_MAC8023_PORT_3.recvtarget = Node15_OFSwitch_0

			Set Node15_MAC8023_PORT_3.mac = 0:1:0:0:0:74
			Set Node15_MAC8023_PORT_3.lock_mac = off
			Set Node15_MAC8023_PORT_3.PromisOpt = on
			Set Node15_MAC8023_PORT_3.mode = full
			Set Node15_MAC8023_PORT_3.log = off
			Set Node15_MAC8023_PORT_3.logInterval = 1
			Set Node15_MAC8023_PORT_3.NumCollision = off
			Set Node15_MAC8023_PORT_3.NumUniInPkt = off
			Set Node15_MAC8023_PORT_3.NumUniOutPkt = off
			Set Node15_MAC8023_PORT_3.NumUniInOutPkt = off
			Set Node15_MAC8023_PORT_3.NumBroInPkt = off
			Set Node15_MAC8023_PORT_3.NumBroOutPkt = off
			Set Node15_MAC8023_PORT_3.NumBroInOutPkt = off
			Set Node15_MAC8023_PORT_3.NumDrop = off
			Set Node15_MAC8023_PORT_3.InThrput = off
			Set Node15_MAC8023_PORT_3.OutThrput = off
			Set Node15_MAC8023_PORT_3.InOutThrput = off
			Set Node15_MAC8023_PORT_3.UniInLogFile = topo1.8023_N15_P3_UniIn.log
			Set Node15_MAC8023_PORT_3.UniOutLogFile = topo1.8023_N15_P3_UniOut.log
			Set Node15_MAC8023_PORT_3.UniInOutLogFile = topo1.8023_N15_P3_UniInOut.log
			Set Node15_MAC8023_PORT_3.BroInLogFile = topo1.8023_N15_P3_BroIn.log
			Set Node15_MAC8023_PORT_3.BroOutLogFile = topo1.8023_N15_P3_BroOut.log
			Set Node15_MAC8023_PORT_3.BroInOutLogFile = topo1.8023_N15_P3_BroInOut.log
			Set Node15_MAC8023_PORT_3.CollLogFile = topo1.8023_N15_P3_Coll.log
			Set Node15_MAC8023_PORT_3.DropLogFile = topo1.8023_N15_P3_Drop.log
			Set Node15_MAC8023_PORT_3.InThrputLogFile = topo1.8023_N15_P3_InThrput.log
			Set Node15_MAC8023_PORT_3.OutThrputLogFile = topo1.8023_N15_P3_OutThrput.log
			Set Node15_MAC8023_PORT_3.InOutThrputLogFile = topo1.8023_N15_P3_InOutThrput.log
			Set Node15_MAC8023_PORT_3.LinktoHub = 0

		Module Phy : Node15_Phy_PORT_3
			Set Node15_Phy_PORT_3.Bw = 10
			Set Node15_Phy_PORT_3.BER = 0.0
			Set Node15_Phy_PORT_3.PropDelay = 1
			Set Node15_Phy_PORT_3.linkfail = off
			Set Node15_Phy_PORT_3.linkfailFileName = topo1.phy_N15_P3.linkfail

		Module Link : Node15_PORT_3
			Set Node15_PORT_3.guitag_remotenode = yes


		Bind Node15_MAC8023_PORT_3 Node15_Phy_PORT_3
		Bind Node15_Phy_PORT_3 Node15_PORT_3
	EndDefine

	Define port 4
		Module MAC8023 : Node15_MAC8023_PORT_4

			Set Node15_OFSwitch_0.port4 = Node15_MAC8023_PORT_4
			Set Node15_OFSwitch_0.fixed_net4 = Node15_MAC8023_PORT_4.no
			Set Node15_MAC8023_PORT_4.recvtarget = Node15_OFSwitch_0

			Set Node15_MAC8023_PORT_4.mac = 0:1:0:0:0:75
			Set Node15_MAC8023_PORT_4.lock_mac = off
			Set Node15_MAC8023_PORT_4.PromisOpt = on
			Set Node15_MAC8023_PORT_4.mode = full
			Set Node15_MAC8023_PORT_4.log = off
			Set Node15_MAC8023_PORT_4.logInterval = 1
			Set Node15_MAC8023_PORT_4.NumCollision = off
			Set Node15_MAC8023_PORT_4.NumUniInPkt = off
			Set Node15_MAC8023_PORT_4.NumUniOutPkt = off
			Set Node15_MAC8023_PORT_4.NumUniInOutPkt = off
			Set Node15_MAC8023_PORT_4.NumBroInPkt = off
			Set Node15_MAC8023_PORT_4.NumBroOutPkt = off
			Set Node15_MAC8023_PORT_4.NumBroInOutPkt = off
			Set Node15_MAC8023_PORT_4.NumDrop = off
			Set Node15_MAC8023_PORT_4.InThrput = off
			Set Node15_MAC8023_PORT_4.OutThrput = off
			Set Node15_MAC8023_PORT_4.InOutThrput = off
			Set Node15_MAC8023_PORT_4.UniInLogFile = topo1.8023_N15_P4_UniIn.log
			Set Node15_MAC8023_PORT_4.UniOutLogFile = topo1.8023_N15_P4_UniOut.log
			Set Node15_MAC8023_PORT_4.UniInOutLogFile = topo1.8023_N15_P4_UniInOut.log
			Set Node15_MAC8023_PORT_4.BroInLogFile = topo1.8023_N15_P4_BroIn.log
			Set Node15_MAC8023_PORT_4.BroOutLogFile = topo1.8023_N15_P4_BroOut.log
			Set Node15_MAC8023_PORT_4.BroInOutLogFile = topo1.8023_N15_P4_BroInOut.log
			Set Node15_MAC8023_PORT_4.CollLogFile = topo1.8023_N15_P4_Coll.log
			Set Node15_MAC8023_PORT_4.DropLogFile = topo1.8023_N15_P4_Drop.log
			Set Node15_MAC8023_PORT_4.InThrputLogFile = topo1.8023_N15_P4_InThrput.log
			Set Node15_MAC8023_PORT_4.OutThrputLogFile = topo1.8023_N15_P4_OutThrput.log
			Set Node15_MAC8023_PORT_4.InOutThrputLogFile = topo1.8023_N15_P4_InOutThrput.log
			Set Node15_MAC8023_PORT_4.LinktoHub = 0

		Module Phy : Node15_Phy_PORT_4
			Set Node15_Phy_PORT_4.Bw = 10
			Set Node15_Phy_PORT_4.BER = 0.0
			Set Node15_Phy_PORT_4.PropDelay = 1
			Set Node15_Phy_PORT_4.linkfail = off
			Set Node15_Phy_PORT_4.linkfailFileName = topo1.phy_N15_P4.linkfail

		Module Link : Node15_PORT_4
			Set Node15_PORT_4.guitag_remotenode = yes


		Bind Node15_MAC8023_PORT_4 Node15_Phy_PORT_4
		Bind Node15_Phy_PORT_4 Node15_PORT_4
	EndDefine

	Define port 5
		Module MAC8023 : Node15_MAC8023_PORT_5

			Set Node15_OFSwitch_0.port5 = Node15_MAC8023_PORT_5
			Set Node15_OFSwitch_0.fixed_net5 = Node15_MAC8023_PORT_5.no
			Set Node15_MAC8023_PORT_5.recvtarget = Node15_OFSwitch_0

			Set Node15_MAC8023_PORT_5.mac = 0:1:0:0:0:76
			Set Node15_MAC8023_PORT_5.lock_mac = off
			Set Node15_MAC8023_PORT_5.PromisOpt = on
			Set Node15_MAC8023_PORT_5.mode = full
			Set Node15_MAC8023_PORT_5.log = off
			Set Node15_MAC8023_PORT_5.logInterval = 1
			Set Node15_MAC8023_PORT_5.NumCollision = off
			Set Node15_MAC8023_PORT_5.NumUniInPkt = off
			Set Node15_MAC8023_PORT_5.NumUniOutPkt = off
			Set Node15_MAC8023_PORT_5.NumUniInOutPkt = off
			Set Node15_MAC8023_PORT_5.NumBroInPkt = off
			Set Node15_MAC8023_PORT_5.NumBroOutPkt = off
			Set Node15_MAC8023_PORT_5.NumBroInOutPkt = off
			Set Node15_MAC8023_PORT_5.NumDrop = off
			Set Node15_MAC8023_PORT_5.InThrput = off
			Set Node15_MAC8023_PORT_5.OutThrput = off
			Set Node15_MAC8023_PORT_5.InOutThrput = off
			Set Node15_MAC8023_PORT_5.UniInLogFile = topo1.8023_N15_P5_UniIn.log
			Set Node15_MAC8023_PORT_5.UniOutLogFile = topo1.8023_N15_P5_UniOut.log
			Set Node15_MAC8023_PORT_5.UniInOutLogFile = topo1.8023_N15_P5_UniInOut.log
			Set Node15_MAC8023_PORT_5.BroInLogFile = topo1.8023_N15_P5_BroIn.log
			Set Node15_MAC8023_PORT_5.BroOutLogFile = topo1.8023_N15_P5_BroOut.log
			Set Node15_MAC8023_PORT_5.BroInOutLogFile = topo1.8023_N15_P5_BroInOut.log
			Set Node15_MAC8023_PORT_5.CollLogFile = topo1.8023_N15_P5_Coll.log
			Set Node15_MAC8023_PORT_5.DropLogFile = topo1.8023_N15_P5_Drop.log
			Set Node15_MAC8023_PORT_5.InThrputLogFile = topo1.8023_N15_P5_InThrput.log
			Set Node15_MAC8023_PORT_5.OutThrputLogFile = topo1.8023_N15_P5_OutThrput.log
			Set Node15_MAC8023_PORT_5.InOutThrputLogFile = topo1.8023_N15_P5_InOutThrput.log
			Set Node15_MAC8023_PORT_5.LinktoHub = 0

		Module Phy : Node15_Phy_PORT_5
			Set Node15_Phy_PORT_5.Bw = 10
			Set Node15_Phy_PORT_5.BER = 0.0
			Set Node15_Phy_PORT_5.PropDelay = 1
			Set Node15_Phy_PORT_5.linkfail = off
			Set Node15_Phy_PORT_5.linkfailFileName = topo1.phy_N15_P5.linkfail

		Module Link : Node15_PORT_5
			Set Node15_PORT_5.guitag_remotenode = yes


		Bind Node15_MAC8023_PORT_5 Node15_Phy_PORT_5
		Bind Node15_Phy_PORT_5 Node15_PORT_5
	EndDefine

	Define port 6
		Module MAC8023 : Node15_MAC8023_PORT_6

			Set Node15_OFSwitch_0.port6 = Node15_MAC8023_PORT_6
			Set Node15_OFSwitch_0.fixed_net6 = Node15_MAC8023_PORT_6.no
			Set Node15_MAC8023_PORT_6.recvtarget = Node15_OFSwitch_0

			Set Node15_MAC8023_PORT_6.mac = 0:1:0:0:0:77
			Set Node15_MAC8023_PORT_6.lock_mac = off
			Set Node15_MAC8023_PORT_6.PromisOpt = on
			Set Node15_MAC8023_PORT_6.mode = full
			Set Node15_MAC8023_PORT_6.log = off
			Set Node15_MAC8023_PORT_6.logInterval = 1
			Set Node15_MAC8023_PORT_6.NumCollision = off
			Set Node15_MAC8023_PORT_6.NumUniInPkt = off
			Set Node15_MAC8023_PORT_6.NumUniOutPkt = off
			Set Node15_MAC8023_PORT_6.NumUniInOutPkt = off
			Set Node15_MAC8023_PORT_6.NumBroInPkt = off
			Set Node15_MAC8023_PORT_6.NumBroOutPkt = off
			Set Node15_MAC8023_PORT_6.NumBroInOutPkt = off
			Set Node15_MAC8023_PORT_6.NumDrop = off
			Set Node15_MAC8023_PORT_6.InThrput = off
			Set Node15_MAC8023_PORT_6.OutThrput = off
			Set Node15_MAC8023_PORT_6.InOutThrput = off
			Set Node15_MAC8023_PORT_6.UniInLogFile = topo1.8023_N15_P6_UniIn.log
			Set Node15_MAC8023_PORT_6.UniOutLogFile = topo1.8023_N15_P6_UniOut.log
			Set Node15_MAC8023_PORT_6.UniInOutLogFile = topo1.8023_N15_P6_UniInOut.log
			Set Node15_MAC8023_PORT_6.BroInLogFile = topo1.8023_N15_P6_BroIn.log
			Set Node15_MAC8023_PORT_6.BroOutLogFile = topo1.8023_N15_P6_BroOut.log
			Set Node15_MAC8023_PORT_6.BroInOutLogFile = topo1.8023_N15_P6_BroInOut.log
			Set Node15_MAC8023_PORT_6.CollLogFile = topo1.8023_N15_P6_Coll.log
			Set Node15_MAC8023_PORT_6.DropLogFile = topo1.8023_N15_P6_Drop.log
			Set Node15_MAC8023_PORT_6.InThrputLogFile = topo1.8023_N15_P6_InThrput.log
			Set Node15_MAC8023_PORT_6.OutThrputLogFile = topo1.8023_N15_P6_OutThrput.log
			Set Node15_MAC8023_PORT_6.InOutThrputLogFile = topo1.8023_N15_P6_InOutThrput.log
			Set Node15_MAC8023_PORT_6.LinktoHub = 0

		Module Phy : Node15_Phy_PORT_6
			Set Node15_Phy_PORT_6.Bw = 10
			Set Node15_Phy_PORT_6.BER = 0.0
			Set Node15_Phy_PORT_6.PropDelay = 1
			Set Node15_Phy_PORT_6.linkfail = off
			Set Node15_Phy_PORT_6.linkfailFileName = topo1.phy_N15_P6.linkfail

		Module Link : Node15_PORT_6
			Set Node15_PORT_6.guitag_remotenode = yes


		Bind Node15_MAC8023_PORT_6 Node15_Phy_PORT_6
		Bind Node15_Phy_PORT_6 Node15_PORT_6
	EndDefine

	Define port 7
		Module MAC8023 : Node15_MAC8023_PORT_7

			Set Node15_OFSwitch_0.port7 = Node15_MAC8023_PORT_7
			Set Node15_OFSwitch_0.fixed_net7 = Node15_MAC8023_PORT_7.no
			Set Node15_MAC8023_PORT_7.recvtarget = Node15_OFSwitch_0

			Set Node15_MAC8023_PORT_7.mac = 0:1:0:0:0:78
			Set Node15_MAC8023_PORT_7.lock_mac = off
			Set Node15_MAC8023_PORT_7.PromisOpt = on
			Set Node15_MAC8023_PORT_7.mode = full
			Set Node15_MAC8023_PORT_7.log = off
			Set Node15_MAC8023_PORT_7.logInterval = 1
			Set Node15_MAC8023_PORT_7.NumCollision = off
			Set Node15_MAC8023_PORT_7.NumUniInPkt = off
			Set Node15_MAC8023_PORT_7.NumUniOutPkt = off
			Set Node15_MAC8023_PORT_7.NumUniInOutPkt = off
			Set Node15_MAC8023_PORT_7.NumBroInPkt = off
			Set Node15_MAC8023_PORT_7.NumBroOutPkt = off
			Set Node15_MAC8023_PORT_7.NumBroInOutPkt = off
			Set Node15_MAC8023_PORT_7.NumDrop = off
			Set Node15_MAC8023_PORT_7.InThrput = off
			Set Node15_MAC8023_PORT_7.OutThrput = off
			Set Node15_MAC8023_PORT_7.InOutThrput = off
			Set Node15_MAC8023_PORT_7.UniInLogFile = topo1.8023_N15_P7_UniIn.log
			Set Node15_MAC8023_PORT_7.UniOutLogFile = topo1.8023_N15_P7_UniOut.log
			Set Node15_MAC8023_PORT_7.UniInOutLogFile = topo1.8023_N15_P7_UniInOut.log
			Set Node15_MAC8023_PORT_7.BroInLogFile = topo1.8023_N15_P7_BroIn.log
			Set Node15_MAC8023_PORT_7.BroOutLogFile = topo1.8023_N15_P7_BroOut.log
			Set Node15_MAC8023_PORT_7.BroInOutLogFile = topo1.8023_N15_P7_BroInOut.log
			Set Node15_MAC8023_PORT_7.CollLogFile = topo1.8023_N15_P7_Coll.log
			Set Node15_MAC8023_PORT_7.DropLogFile = topo1.8023_N15_P7_Drop.log
			Set Node15_MAC8023_PORT_7.InThrputLogFile = topo1.8023_N15_P7_InThrput.log
			Set Node15_MAC8023_PORT_7.OutThrputLogFile = topo1.8023_N15_P7_OutThrput.log
			Set Node15_MAC8023_PORT_7.InOutThrputLogFile = topo1.8023_N15_P7_InOutThrput.log
			Set Node15_MAC8023_PORT_7.LinktoHub = 0

		Module Phy : Node15_Phy_PORT_7
			Set Node15_Phy_PORT_7.Bw = 10
			Set Node15_Phy_PORT_7.BER = 0.0
			Set Node15_Phy_PORT_7.PropDelay = 1
			Set Node15_Phy_PORT_7.linkfail = off
			Set Node15_Phy_PORT_7.linkfailFileName = topo1.phy_N15_P7.linkfail

		Module Link : Node15_PORT_7
			Set Node15_PORT_7.guitag_remotenode = yes


		Bind Node15_MAC8023_PORT_7 Node15_Phy_PORT_7
		Bind Node15_Phy_PORT_7 Node15_PORT_7
	EndDefine

	Define port 8
		Module MAC8023 : Node15_MAC8023_PORT_8

			Set Node15_OFSwitch_0.port8 = Node15_MAC8023_PORT_8
			Set Node15_OFSwitch_0.fixed_net8 = Node15_MAC8023_PORT_8.no
			Set Node15_MAC8023_PORT_8.recvtarget = Node15_OFSwitch_0

			Set Node15_MAC8023_PORT_8.mac = 0:1:0:0:0:79
			Set Node15_MAC8023_PORT_8.lock_mac = off
			Set Node15_MAC8023_PORT_8.PromisOpt = on
			Set Node15_MAC8023_PORT_8.mode = full
			Set Node15_MAC8023_PORT_8.log = off
			Set Node15_MAC8023_PORT_8.logInterval = 1
			Set Node15_MAC8023_PORT_8.NumCollision = off
			Set Node15_MAC8023_PORT_8.NumUniInPkt = off
			Set Node15_MAC8023_PORT_8.NumUniOutPkt = off
			Set Node15_MAC8023_PORT_8.NumUniInOutPkt = off
			Set Node15_MAC8023_PORT_8.NumBroInPkt = off
			Set Node15_MAC8023_PORT_8.NumBroOutPkt = off
			Set Node15_MAC8023_PORT_8.NumBroInOutPkt = off
			Set Node15_MAC8023_PORT_8.NumDrop = off
			Set Node15_MAC8023_PORT_8.InThrput = off
			Set Node15_MAC8023_PORT_8.OutThrput = off
			Set Node15_MAC8023_PORT_8.InOutThrput = off
			Set Node15_MAC8023_PORT_8.UniInLogFile = topo1.8023_N15_P8_UniIn.log
			Set Node15_MAC8023_PORT_8.UniOutLogFile = topo1.8023_N15_P8_UniOut.log
			Set Node15_MAC8023_PORT_8.UniInOutLogFile = topo1.8023_N15_P8_UniInOut.log
			Set Node15_MAC8023_PORT_8.BroInLogFile = topo1.8023_N15_P8_BroIn.log
			Set Node15_MAC8023_PORT_8.BroOutLogFile = topo1.8023_N15_P8_BroOut.log
			Set Node15_MAC8023_PORT_8.BroInOutLogFile = topo1.8023_N15_P8_BroInOut.log
			Set Node15_MAC8023_PORT_8.CollLogFile = topo1.8023_N15_P8_Coll.log
			Set Node15_MAC8023_PORT_8.DropLogFile = topo1.8023_N15_P8_Drop.log
			Set Node15_MAC8023_PORT_8.InThrputLogFile = topo1.8023_N15_P8_InThrput.log
			Set Node15_MAC8023_PORT_8.OutThrputLogFile = topo1.8023_N15_P8_OutThrput.log
			Set Node15_MAC8023_PORT_8.InOutThrputLogFile = topo1.8023_N15_P8_InOutThrput.log
			Set Node15_MAC8023_PORT_8.LinktoHub = 0

		Module Phy : Node15_Phy_PORT_8
			Set Node15_Phy_PORT_8.Bw = 10
			Set Node15_Phy_PORT_8.BER = 0.0
			Set Node15_Phy_PORT_8.PropDelay = 1
			Set Node15_Phy_PORT_8.linkfail = off
			Set Node15_Phy_PORT_8.linkfailFileName = topo1.phy_N15_P8.linkfail

		Module Link : Node15_PORT_8
			Set Node15_PORT_8.guitag_remotenode = yes


		Bind Node15_MAC8023_PORT_8 Node15_Phy_PORT_8
		Bind Node15_Phy_PORT_8 Node15_PORT_8
	EndDefine

	Define port 9
		Module MAC8023 : Node15_MAC8023_PORT_9

			Set Node15_OFSwitch_0.port9 = Node15_MAC8023_PORT_9
			Set Node15_OFSwitch_0.fixed_net9 = Node15_MAC8023_PORT_9.no
			Set Node15_MAC8023_PORT_9.recvtarget = Node15_OFSwitch_0

			Set Node15_MAC8023_PORT_9.mac = 0:1:0:0:0:7a
			Set Node15_MAC8023_PORT_9.lock_mac = off
			Set Node15_MAC8023_PORT_9.PromisOpt = on
			Set Node15_MAC8023_PORT_9.mode = full
			Set Node15_MAC8023_PORT_9.log = off
			Set Node15_MAC8023_PORT_9.logInterval = 1
			Set Node15_MAC8023_PORT_9.NumCollision = off
			Set Node15_MAC8023_PORT_9.NumUniInPkt = off
			Set Node15_MAC8023_PORT_9.NumUniOutPkt = off
			Set Node15_MAC8023_PORT_9.NumUniInOutPkt = off
			Set Node15_MAC8023_PORT_9.NumBroInPkt = off
			Set Node15_MAC8023_PORT_9.NumBroOutPkt = off
			Set Node15_MAC8023_PORT_9.NumBroInOutPkt = off
			Set Node15_MAC8023_PORT_9.NumDrop = off
			Set Node15_MAC8023_PORT_9.InThrput = off
			Set Node15_MAC8023_PORT_9.OutThrput = off
			Set Node15_MAC8023_PORT_9.InOutThrput = off
			Set Node15_MAC8023_PORT_9.UniInLogFile = topo1.8023_N15_P9_UniIn.log
			Set Node15_MAC8023_PORT_9.UniOutLogFile = topo1.8023_N15_P9_UniOut.log
			Set Node15_MAC8023_PORT_9.UniInOutLogFile = topo1.8023_N15_P9_UniInOut.log
			Set Node15_MAC8023_PORT_9.BroInLogFile = topo1.8023_N15_P9_BroIn.log
			Set Node15_MAC8023_PORT_9.BroOutLogFile = topo1.8023_N15_P9_BroOut.log
			Set Node15_MAC8023_PORT_9.BroInOutLogFile = topo1.8023_N15_P9_BroInOut.log
			Set Node15_MAC8023_PORT_9.CollLogFile = topo1.8023_N15_P9_Coll.log
			Set Node15_MAC8023_PORT_9.DropLogFile = topo1.8023_N15_P9_Drop.log
			Set Node15_MAC8023_PORT_9.InThrputLogFile = topo1.8023_N15_P9_InThrput.log
			Set Node15_MAC8023_PORT_9.OutThrputLogFile = topo1.8023_N15_P9_OutThrput.log
			Set Node15_MAC8023_PORT_9.InOutThrputLogFile = topo1.8023_N15_P9_InOutThrput.log
			Set Node15_MAC8023_PORT_9.LinktoHub = 0

		Module Phy : Node15_Phy_PORT_9
			Set Node15_Phy_PORT_9.Bw = 10
			Set Node15_Phy_PORT_9.BER = 0.0
			Set Node15_Phy_PORT_9.PropDelay = 1
			Set Node15_Phy_PORT_9.linkfail = off
			Set Node15_Phy_PORT_9.linkfailFileName = topo1.phy_N15_P9.linkfail

		Module Link : Node15_PORT_9
			Set Node15_PORT_9.guitag_remotenode = yes


		Bind Node15_MAC8023_PORT_9 Node15_Phy_PORT_9
		Bind Node15_Phy_PORT_9 Node15_PORT_9
	EndDefine

	Define port 10
		Module MAC8023 : Node15_MAC8023_PORT_10

			Set Node15_OFSwitch_0.port10 = Node15_MAC8023_PORT_10
			Set Node15_OFSwitch_0.fixed_net10 = Node15_MAC8023_PORT_10.no
			Set Node15_MAC8023_PORT_10.recvtarget = Node15_OFSwitch_0

			Set Node15_MAC8023_PORT_10.mac = 0:1:0:0:0:7b
			Set Node15_MAC8023_PORT_10.lock_mac = off
			Set Node15_MAC8023_PORT_10.PromisOpt = on
			Set Node15_MAC8023_PORT_10.mode = full
			Set Node15_MAC8023_PORT_10.log = off
			Set Node15_MAC8023_PORT_10.logInterval = 1
			Set Node15_MAC8023_PORT_10.NumCollision = off
			Set Node15_MAC8023_PORT_10.NumUniInPkt = off
			Set Node15_MAC8023_PORT_10.NumUniOutPkt = off
			Set Node15_MAC8023_PORT_10.NumUniInOutPkt = off
			Set Node15_MAC8023_PORT_10.NumBroInPkt = off
			Set Node15_MAC8023_PORT_10.NumBroOutPkt = off
			Set Node15_MAC8023_PORT_10.NumBroInOutPkt = off
			Set Node15_MAC8023_PORT_10.NumDrop = off
			Set Node15_MAC8023_PORT_10.InThrput = off
			Set Node15_MAC8023_PORT_10.OutThrput = off
			Set Node15_MAC8023_PORT_10.InOutThrput = off
			Set Node15_MAC8023_PORT_10.UniInLogFile = topo1.8023_N15_P10_UniIn.log
			Set Node15_MAC8023_PORT_10.UniOutLogFile = topo1.8023_N15_P10_UniOut.log
			Set Node15_MAC8023_PORT_10.UniInOutLogFile = topo1.8023_N15_P10_UniInOut.log
			Set Node15_MAC8023_PORT_10.BroInLogFile = topo1.8023_N15_P10_BroIn.log
			Set Node15_MAC8023_PORT_10.BroOutLogFile = topo1.8023_N15_P10_BroOut.log
			Set Node15_MAC8023_PORT_10.BroInOutLogFile = topo1.8023_N15_P10_BroInOut.log
			Set Node15_MAC8023_PORT_10.CollLogFile = topo1.8023_N15_P10_Coll.log
			Set Node15_MAC8023_PORT_10.DropLogFile = topo1.8023_N15_P10_Drop.log
			Set Node15_MAC8023_PORT_10.InThrputLogFile = topo1.8023_N15_P10_InThrput.log
			Set Node15_MAC8023_PORT_10.OutThrputLogFile = topo1.8023_N15_P10_OutThrput.log
			Set Node15_MAC8023_PORT_10.InOutThrputLogFile = topo1.8023_N15_P10_InOutThrput.log
			Set Node15_MAC8023_PORT_10.LinktoHub = 0

		Module Phy : Node15_Phy_PORT_10
			Set Node15_Phy_PORT_10.Bw = 10
			Set Node15_Phy_PORT_10.BER = 0.0
			Set Node15_Phy_PORT_10.PropDelay = 1
			Set Node15_Phy_PORT_10.linkfail = off
			Set Node15_Phy_PORT_10.linkfailFileName = topo1.phy_N15_P10.linkfail

		Module Link : Node15_PORT_10
			Set Node15_PORT_10.guitag_remotenode = yes


		Bind Node15_MAC8023_PORT_10 Node15_Phy_PORT_10
		Bind Node15_Phy_PORT_10 Node15_PORT_10
	EndDefine

	Define port 11
		Module MAC8023 : Node15_MAC8023_PORT_11

			Set Node15_OFSwitch_0.port11 = Node15_MAC8023_PORT_11
			Set Node15_OFSwitch_0.fixed_net11 = Node15_MAC8023_PORT_11.no
			Set Node15_MAC8023_PORT_11.recvtarget = Node15_OFSwitch_0

			Set Node15_MAC8023_PORT_11.mac = 0:1:0:0:0:7c
			Set Node15_MAC8023_PORT_11.lock_mac = off
			Set Node15_MAC8023_PORT_11.PromisOpt = on
			Set Node15_MAC8023_PORT_11.mode = full
			Set Node15_MAC8023_PORT_11.log = off
			Set Node15_MAC8023_PORT_11.logInterval = 1
			Set Node15_MAC8023_PORT_11.NumCollision = off
			Set Node15_MAC8023_PORT_11.NumUniInPkt = off
			Set Node15_MAC8023_PORT_11.NumUniOutPkt = off
			Set Node15_MAC8023_PORT_11.NumUniInOutPkt = off
			Set Node15_MAC8023_PORT_11.NumBroInPkt = off
			Set Node15_MAC8023_PORT_11.NumBroOutPkt = off
			Set Node15_MAC8023_PORT_11.NumBroInOutPkt = off
			Set Node15_MAC8023_PORT_11.NumDrop = off
			Set Node15_MAC8023_PORT_11.InThrput = off
			Set Node15_MAC8023_PORT_11.OutThrput = off
			Set Node15_MAC8023_PORT_11.InOutThrput = off
			Set Node15_MAC8023_PORT_11.UniInLogFile = topo1.8023_N15_P11_UniIn.log
			Set Node15_MAC8023_PORT_11.UniOutLogFile = topo1.8023_N15_P11_UniOut.log
			Set Node15_MAC8023_PORT_11.UniInOutLogFile = topo1.8023_N15_P11_UniInOut.log
			Set Node15_MAC8023_PORT_11.BroInLogFile = topo1.8023_N15_P11_BroIn.log
			Set Node15_MAC8023_PORT_11.BroOutLogFile = topo1.8023_N15_P11_BroOut.log
			Set Node15_MAC8023_PORT_11.BroInOutLogFile = topo1.8023_N15_P11_BroInOut.log
			Set Node15_MAC8023_PORT_11.CollLogFile = topo1.8023_N15_P11_Coll.log
			Set Node15_MAC8023_PORT_11.DropLogFile = topo1.8023_N15_P11_Drop.log
			Set Node15_MAC8023_PORT_11.InThrputLogFile = topo1.8023_N15_P11_InThrput.log
			Set Node15_MAC8023_PORT_11.OutThrputLogFile = topo1.8023_N15_P11_OutThrput.log
			Set Node15_MAC8023_PORT_11.InOutThrputLogFile = topo1.8023_N15_P11_InOutThrput.log
			Set Node15_MAC8023_PORT_11.LinktoHub = 0

		Module Phy : Node15_Phy_PORT_11
			Set Node15_Phy_PORT_11.Bw = 10
			Set Node15_Phy_PORT_11.BER = 0.0
			Set Node15_Phy_PORT_11.PropDelay = 1
			Set Node15_Phy_PORT_11.linkfail = off
			Set Node15_Phy_PORT_11.linkfailFileName = topo1.phy_N15_P11.linkfail

		Module Link : Node15_PORT_11
			Set Node15_PORT_11.guitag_remotenode = yes


		Bind Node15_MAC8023_PORT_11 Node15_Phy_PORT_11
		Bind Node15_Phy_PORT_11 Node15_PORT_11
	EndDefine

	Define port 12
		Module MAC8023 : Node15_MAC8023_PORT_12

			Set Node15_OFSwitch_0.port12 = Node15_MAC8023_PORT_12
			Set Node15_OFSwitch_0.fixed_net12 = Node15_MAC8023_PORT_12.no
			Set Node15_MAC8023_PORT_12.recvtarget = Node15_OFSwitch_0

			Set Node15_MAC8023_PORT_12.mac = 0:1:0:0:0:7d
			Set Node15_MAC8023_PORT_12.lock_mac = off
			Set Node15_MAC8023_PORT_12.PromisOpt = on
			Set Node15_MAC8023_PORT_12.mode = full
			Set Node15_MAC8023_PORT_12.log = off
			Set Node15_MAC8023_PORT_12.logInterval = 1
			Set Node15_MAC8023_PORT_12.NumCollision = off
			Set Node15_MAC8023_PORT_12.NumUniInPkt = off
			Set Node15_MAC8023_PORT_12.NumUniOutPkt = off
			Set Node15_MAC8023_PORT_12.NumUniInOutPkt = off
			Set Node15_MAC8023_PORT_12.NumBroInPkt = off
			Set Node15_MAC8023_PORT_12.NumBroOutPkt = off
			Set Node15_MAC8023_PORT_12.NumBroInOutPkt = off
			Set Node15_MAC8023_PORT_12.NumDrop = off
			Set Node15_MAC8023_PORT_12.InThrput = off
			Set Node15_MAC8023_PORT_12.OutThrput = off
			Set Node15_MAC8023_PORT_12.InOutThrput = off
			Set Node15_MAC8023_PORT_12.UniInLogFile = topo1.8023_N15_P12_UniIn.log
			Set Node15_MAC8023_PORT_12.UniOutLogFile = topo1.8023_N15_P12_UniOut.log
			Set Node15_MAC8023_PORT_12.UniInOutLogFile = topo1.8023_N15_P12_UniInOut.log
			Set Node15_MAC8023_PORT_12.BroInLogFile = topo1.8023_N15_P12_BroIn.log
			Set Node15_MAC8023_PORT_12.BroOutLogFile = topo1.8023_N15_P12_BroOut.log
			Set Node15_MAC8023_PORT_12.BroInOutLogFile = topo1.8023_N15_P12_BroInOut.log
			Set Node15_MAC8023_PORT_12.CollLogFile = topo1.8023_N15_P12_Coll.log
			Set Node15_MAC8023_PORT_12.DropLogFile = topo1.8023_N15_P12_Drop.log
			Set Node15_MAC8023_PORT_12.InThrputLogFile = topo1.8023_N15_P12_InThrput.log
			Set Node15_MAC8023_PORT_12.OutThrputLogFile = topo1.8023_N15_P12_OutThrput.log
			Set Node15_MAC8023_PORT_12.InOutThrputLogFile = topo1.8023_N15_P12_InOutThrput.log
			Set Node15_MAC8023_PORT_12.LinktoHub = 0

		Module Phy : Node15_Phy_PORT_12
			Set Node15_Phy_PORT_12.Bw = 10
			Set Node15_Phy_PORT_12.BER = 0.0
			Set Node15_Phy_PORT_12.PropDelay = 1
			Set Node15_Phy_PORT_12.linkfail = off
			Set Node15_Phy_PORT_12.linkfailFileName = topo1.phy_N15_P12.linkfail

		Module Link : Node15_PORT_12
			Set Node15_PORT_12.guitag_remotenode = yes


		Bind Node15_MAC8023_PORT_12 Node15_Phy_PORT_12
		Bind Node15_Phy_PORT_12 Node15_PORT_12
	EndDefine

EndCreate

Create Node 16 as OF_SW with name = OF_SW16
	Module OFSwitch : Node16_OFSwitch_0
		Set Node16_OFSwitch_0.guitag_addport = yes
		Set Node16_OFSwitch_0.flow_table_amount = 15
		Set Node16_OFSwitch_0.flow_table_entry_amount = 256
		Set Node16_OFSwitch_0.group_table_entry_amount = 256
		Set Node16_OFSwitch_0.table_miss_buffer_size = 1000
		Set Node16_OFSwitch_0.fifo_queue_size = 50
		Set Node16_OFSwitch_0.controller_ip = 1.0.1.1
	Define port 1
		Module Interface : Node16_Interface_PORT_1

			Set Node16_OFSwitch_0.port1 = Node16_Interface_PORT_1
			Set Node16_OFSwitch_0.fixed_net1 = Node16_Interface_PORT_1.no
			Set Node16_Interface_PORT_1.recvtarget = Node16_OFSwitch_0

			Set Node16_Interface_PORT_1.ip = 1.0.1.11
			Set Node16_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node16_ARP_PORT_1
			Set Node16_ARP_PORT_1.arpMode = RunARP
			Set Node16_ARP_PORT_1.flushInterval = 3000
			Set Node16_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node16_FIFO_PORT_1
			Set Node16_FIFO_PORT_1.max_qlen = 50
			Set Node16_FIFO_PORT_1.log_qlen = off
			Set Node16_FIFO_PORT_1.log_option = FullLog
			Set Node16_FIFO_PORT_1.samplerate = 1
			Set Node16_FIFO_PORT_1.logFileName = topo1.fifo_N16_P1_qlen.log
			Set Node16_FIFO_PORT_1.log_drop = off
			Set Node16_FIFO_PORT_1.drop_samplerate = 1
			Set Node16_FIFO_PORT_1.droplogFileName = topo1.fifo_N16_P1_drop.log

		Module TCPDUMP : Node16_TCPDUMP_PORT_1

		Module MAC8023 : Node16_MAC8023_PORT_1
			Set Node16_MAC8023_PORT_1.mac = 0:1:0:0:0:7e
			Set Node16_MAC8023_PORT_1.lock_mac = off
			Set Node16_MAC8023_PORT_1.PromisOpt = on
			Set Node16_MAC8023_PORT_1.mode = full
			Set Node16_MAC8023_PORT_1.log = off
			Set Node16_MAC8023_PORT_1.logInterval = 1
			Set Node16_MAC8023_PORT_1.NumCollision = off
			Set Node16_MAC8023_PORT_1.NumUniInPkt = off
			Set Node16_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node16_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node16_MAC8023_PORT_1.NumBroInPkt = off
			Set Node16_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node16_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node16_MAC8023_PORT_1.NumDrop = off
			Set Node16_MAC8023_PORT_1.InThrput = off
			Set Node16_MAC8023_PORT_1.OutThrput = off
			Set Node16_MAC8023_PORT_1.InOutThrput = off
			Set Node16_MAC8023_PORT_1.UniInLogFile = topo1.8023_N16_P1_UniIn.log
			Set Node16_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N16_P1_UniOut.log
			Set Node16_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N16_P1_UniInOut.log
			Set Node16_MAC8023_PORT_1.BroInLogFile = topo1.8023_N16_P1_BroIn.log
			Set Node16_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N16_P1_BroOut.log
			Set Node16_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N16_P1_BroInOut.log
			Set Node16_MAC8023_PORT_1.CollLogFile = topo1.8023_N16_P1_Coll.log
			Set Node16_MAC8023_PORT_1.DropLogFile = topo1.8023_N16_P1_Drop.log
			Set Node16_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N16_P1_InThrput.log
			Set Node16_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N16_P1_OutThrput.log
			Set Node16_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N16_P1_InOutThrput.log
			Set Node16_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node16_Phy_PORT_1
			Set Node16_Phy_PORT_1.Bw = 10
			Set Node16_Phy_PORT_1.BER = 0.0
			Set Node16_Phy_PORT_1.PropDelay = 1
			Set Node16_Phy_PORT_1.linkfail = off
			Set Node16_Phy_PORT_1.linkfailFileName = topo1.phy_N16_P1.linkfail

		Module Link : Node16_PORT_1
			Set Node16_PORT_1.guitag_remotenode = yes


		Bind Node16_Interface_PORT_1 Node16_ARP_PORT_1
		Bind Node16_ARP_PORT_1 Node16_FIFO_PORT_1
		Bind Node16_FIFO_PORT_1 Node16_TCPDUMP_PORT_1
		Bind Node16_TCPDUMP_PORT_1 Node16_MAC8023_PORT_1
		Bind Node16_MAC8023_PORT_1 Node16_Phy_PORT_1
		Bind Node16_Phy_PORT_1 Node16_PORT_1
	EndDefine

	Define port 2
		Module MAC8023 : Node16_MAC8023_PORT_2

			Set Node16_OFSwitch_0.port2 = Node16_MAC8023_PORT_2
			Set Node16_OFSwitch_0.fixed_net2 = Node16_MAC8023_PORT_2.no
			Set Node16_MAC8023_PORT_2.recvtarget = Node16_OFSwitch_0

			Set Node16_MAC8023_PORT_2.mac = 0:1:0:0:0:7f
			Set Node16_MAC8023_PORT_2.lock_mac = off
			Set Node16_MAC8023_PORT_2.PromisOpt = on
			Set Node16_MAC8023_PORT_2.mode = full
			Set Node16_MAC8023_PORT_2.log = off
			Set Node16_MAC8023_PORT_2.logInterval = 1
			Set Node16_MAC8023_PORT_2.NumCollision = off
			Set Node16_MAC8023_PORT_2.NumUniInPkt = off
			Set Node16_MAC8023_PORT_2.NumUniOutPkt = off
			Set Node16_MAC8023_PORT_2.NumUniInOutPkt = off
			Set Node16_MAC8023_PORT_2.NumBroInPkt = off
			Set Node16_MAC8023_PORT_2.NumBroOutPkt = off
			Set Node16_MAC8023_PORT_2.NumBroInOutPkt = off
			Set Node16_MAC8023_PORT_2.NumDrop = off
			Set Node16_MAC8023_PORT_2.InThrput = off
			Set Node16_MAC8023_PORT_2.OutThrput = off
			Set Node16_MAC8023_PORT_2.InOutThrput = off
			Set Node16_MAC8023_PORT_2.UniInLogFile = topo1.8023_N16_P2_UniIn.log
			Set Node16_MAC8023_PORT_2.UniOutLogFile = topo1.8023_N16_P2_UniOut.log
			Set Node16_MAC8023_PORT_2.UniInOutLogFile = topo1.8023_N16_P2_UniInOut.log
			Set Node16_MAC8023_PORT_2.BroInLogFile = topo1.8023_N16_P2_BroIn.log
			Set Node16_MAC8023_PORT_2.BroOutLogFile = topo1.8023_N16_P2_BroOut.log
			Set Node16_MAC8023_PORT_2.BroInOutLogFile = topo1.8023_N16_P2_BroInOut.log
			Set Node16_MAC8023_PORT_2.CollLogFile = topo1.8023_N16_P2_Coll.log
			Set Node16_MAC8023_PORT_2.DropLogFile = topo1.8023_N16_P2_Drop.log
			Set Node16_MAC8023_PORT_2.InThrputLogFile = topo1.8023_N16_P2_InThrput.log
			Set Node16_MAC8023_PORT_2.OutThrputLogFile = topo1.8023_N16_P2_OutThrput.log
			Set Node16_MAC8023_PORT_2.InOutThrputLogFile = topo1.8023_N16_P2_InOutThrput.log
			Set Node16_MAC8023_PORT_2.LinktoHub = 0

		Module Phy : Node16_Phy_PORT_2
			Set Node16_Phy_PORT_2.Bw = 10
			Set Node16_Phy_PORT_2.BER = 0.0
			Set Node16_Phy_PORT_2.PropDelay = 1
			Set Node16_Phy_PORT_2.linkfail = off
			Set Node16_Phy_PORT_2.linkfailFileName = topo1.phy_N16_P2.linkfail

		Module Link : Node16_PORT_2
			Set Node16_PORT_2.guitag_remotenode = yes


		Bind Node16_MAC8023_PORT_2 Node16_Phy_PORT_2
		Bind Node16_Phy_PORT_2 Node16_PORT_2
	EndDefine

	Define port 3
		Module MAC8023 : Node16_MAC8023_PORT_3

			Set Node16_OFSwitch_0.port3 = Node16_MAC8023_PORT_3
			Set Node16_OFSwitch_0.fixed_net3 = Node16_MAC8023_PORT_3.no
			Set Node16_MAC8023_PORT_3.recvtarget = Node16_OFSwitch_0

			Set Node16_MAC8023_PORT_3.mac = 0:1:0:0:0:80
			Set Node16_MAC8023_PORT_3.lock_mac = off
			Set Node16_MAC8023_PORT_3.PromisOpt = on
			Set Node16_MAC8023_PORT_3.mode = full
			Set Node16_MAC8023_PORT_3.log = off
			Set Node16_MAC8023_PORT_3.logInterval = 1
			Set Node16_MAC8023_PORT_3.NumCollision = off
			Set Node16_MAC8023_PORT_3.NumUniInPkt = off
			Set Node16_MAC8023_PORT_3.NumUniOutPkt = off
			Set Node16_MAC8023_PORT_3.NumUniInOutPkt = off
			Set Node16_MAC8023_PORT_3.NumBroInPkt = off
			Set Node16_MAC8023_PORT_3.NumBroOutPkt = off
			Set Node16_MAC8023_PORT_3.NumBroInOutPkt = off
			Set Node16_MAC8023_PORT_3.NumDrop = off
			Set Node16_MAC8023_PORT_3.InThrput = off
			Set Node16_MAC8023_PORT_3.OutThrput = off
			Set Node16_MAC8023_PORT_3.InOutThrput = off
			Set Node16_MAC8023_PORT_3.UniInLogFile = topo1.8023_N16_P3_UniIn.log
			Set Node16_MAC8023_PORT_3.UniOutLogFile = topo1.8023_N16_P3_UniOut.log
			Set Node16_MAC8023_PORT_3.UniInOutLogFile = topo1.8023_N16_P3_UniInOut.log
			Set Node16_MAC8023_PORT_3.BroInLogFile = topo1.8023_N16_P3_BroIn.log
			Set Node16_MAC8023_PORT_3.BroOutLogFile = topo1.8023_N16_P3_BroOut.log
			Set Node16_MAC8023_PORT_3.BroInOutLogFile = topo1.8023_N16_P3_BroInOut.log
			Set Node16_MAC8023_PORT_3.CollLogFile = topo1.8023_N16_P3_Coll.log
			Set Node16_MAC8023_PORT_3.DropLogFile = topo1.8023_N16_P3_Drop.log
			Set Node16_MAC8023_PORT_3.InThrputLogFile = topo1.8023_N16_P3_InThrput.log
			Set Node16_MAC8023_PORT_3.OutThrputLogFile = topo1.8023_N16_P3_OutThrput.log
			Set Node16_MAC8023_PORT_3.InOutThrputLogFile = topo1.8023_N16_P3_InOutThrput.log
			Set Node16_MAC8023_PORT_3.LinktoHub = 0

		Module Phy : Node16_Phy_PORT_3
			Set Node16_Phy_PORT_3.Bw = 10
			Set Node16_Phy_PORT_3.BER = 0.0
			Set Node16_Phy_PORT_3.PropDelay = 1
			Set Node16_Phy_PORT_3.linkfail = off
			Set Node16_Phy_PORT_3.linkfailFileName = topo1.phy_N16_P3.linkfail

		Module Link : Node16_PORT_3
			Set Node16_PORT_3.guitag_remotenode = yes


		Bind Node16_MAC8023_PORT_3 Node16_Phy_PORT_3
		Bind Node16_Phy_PORT_3 Node16_PORT_3
	EndDefine

	Define port 4
		Module MAC8023 : Node16_MAC8023_PORT_4

			Set Node16_OFSwitch_0.port4 = Node16_MAC8023_PORT_4
			Set Node16_OFSwitch_0.fixed_net4 = Node16_MAC8023_PORT_4.no
			Set Node16_MAC8023_PORT_4.recvtarget = Node16_OFSwitch_0

			Set Node16_MAC8023_PORT_4.mac = 0:1:0:0:0:81
			Set Node16_MAC8023_PORT_4.lock_mac = off
			Set Node16_MAC8023_PORT_4.PromisOpt = on
			Set Node16_MAC8023_PORT_4.mode = full
			Set Node16_MAC8023_PORT_4.log = off
			Set Node16_MAC8023_PORT_4.logInterval = 1
			Set Node16_MAC8023_PORT_4.NumCollision = off
			Set Node16_MAC8023_PORT_4.NumUniInPkt = off
			Set Node16_MAC8023_PORT_4.NumUniOutPkt = off
			Set Node16_MAC8023_PORT_4.NumUniInOutPkt = off
			Set Node16_MAC8023_PORT_4.NumBroInPkt = off
			Set Node16_MAC8023_PORT_4.NumBroOutPkt = off
			Set Node16_MAC8023_PORT_4.NumBroInOutPkt = off
			Set Node16_MAC8023_PORT_4.NumDrop = off
			Set Node16_MAC8023_PORT_4.InThrput = off
			Set Node16_MAC8023_PORT_4.OutThrput = off
			Set Node16_MAC8023_PORT_4.InOutThrput = off
			Set Node16_MAC8023_PORT_4.UniInLogFile = topo1.8023_N16_P4_UniIn.log
			Set Node16_MAC8023_PORT_4.UniOutLogFile = topo1.8023_N16_P4_UniOut.log
			Set Node16_MAC8023_PORT_4.UniInOutLogFile = topo1.8023_N16_P4_UniInOut.log
			Set Node16_MAC8023_PORT_4.BroInLogFile = topo1.8023_N16_P4_BroIn.log
			Set Node16_MAC8023_PORT_4.BroOutLogFile = topo1.8023_N16_P4_BroOut.log
			Set Node16_MAC8023_PORT_4.BroInOutLogFile = topo1.8023_N16_P4_BroInOut.log
			Set Node16_MAC8023_PORT_4.CollLogFile = topo1.8023_N16_P4_Coll.log
			Set Node16_MAC8023_PORT_4.DropLogFile = topo1.8023_N16_P4_Drop.log
			Set Node16_MAC8023_PORT_4.InThrputLogFile = topo1.8023_N16_P4_InThrput.log
			Set Node16_MAC8023_PORT_4.OutThrputLogFile = topo1.8023_N16_P4_OutThrput.log
			Set Node16_MAC8023_PORT_4.InOutThrputLogFile = topo1.8023_N16_P4_InOutThrput.log
			Set Node16_MAC8023_PORT_4.LinktoHub = 0

		Module Phy : Node16_Phy_PORT_4
			Set Node16_Phy_PORT_4.Bw = 10
			Set Node16_Phy_PORT_4.BER = 0.0
			Set Node16_Phy_PORT_4.PropDelay = 1
			Set Node16_Phy_PORT_4.linkfail = off
			Set Node16_Phy_PORT_4.linkfailFileName = topo1.phy_N16_P4.linkfail

		Module Link : Node16_PORT_4
			Set Node16_PORT_4.guitag_remotenode = yes


		Bind Node16_MAC8023_PORT_4 Node16_Phy_PORT_4
		Bind Node16_Phy_PORT_4 Node16_PORT_4
	EndDefine

	Define port 5
		Module MAC8023 : Node16_MAC8023_PORT_5

			Set Node16_OFSwitch_0.port5 = Node16_MAC8023_PORT_5
			Set Node16_OFSwitch_0.fixed_net5 = Node16_MAC8023_PORT_5.no
			Set Node16_MAC8023_PORT_5.recvtarget = Node16_OFSwitch_0

			Set Node16_MAC8023_PORT_5.mac = 0:1:0:0:0:82
			Set Node16_MAC8023_PORT_5.lock_mac = off
			Set Node16_MAC8023_PORT_5.PromisOpt = on
			Set Node16_MAC8023_PORT_5.mode = full
			Set Node16_MAC8023_PORT_5.log = off
			Set Node16_MAC8023_PORT_5.logInterval = 1
			Set Node16_MAC8023_PORT_5.NumCollision = off
			Set Node16_MAC8023_PORT_5.NumUniInPkt = off
			Set Node16_MAC8023_PORT_5.NumUniOutPkt = off
			Set Node16_MAC8023_PORT_5.NumUniInOutPkt = off
			Set Node16_MAC8023_PORT_5.NumBroInPkt = off
			Set Node16_MAC8023_PORT_5.NumBroOutPkt = off
			Set Node16_MAC8023_PORT_5.NumBroInOutPkt = off
			Set Node16_MAC8023_PORT_5.NumDrop = off
			Set Node16_MAC8023_PORT_5.InThrput = off
			Set Node16_MAC8023_PORT_5.OutThrput = off
			Set Node16_MAC8023_PORT_5.InOutThrput = off
			Set Node16_MAC8023_PORT_5.UniInLogFile = topo1.8023_N16_P5_UniIn.log
			Set Node16_MAC8023_PORT_5.UniOutLogFile = topo1.8023_N16_P5_UniOut.log
			Set Node16_MAC8023_PORT_5.UniInOutLogFile = topo1.8023_N16_P5_UniInOut.log
			Set Node16_MAC8023_PORT_5.BroInLogFile = topo1.8023_N16_P5_BroIn.log
			Set Node16_MAC8023_PORT_5.BroOutLogFile = topo1.8023_N16_P5_BroOut.log
			Set Node16_MAC8023_PORT_5.BroInOutLogFile = topo1.8023_N16_P5_BroInOut.log
			Set Node16_MAC8023_PORT_5.CollLogFile = topo1.8023_N16_P5_Coll.log
			Set Node16_MAC8023_PORT_5.DropLogFile = topo1.8023_N16_P5_Drop.log
			Set Node16_MAC8023_PORT_5.InThrputLogFile = topo1.8023_N16_P5_InThrput.log
			Set Node16_MAC8023_PORT_5.OutThrputLogFile = topo1.8023_N16_P5_OutThrput.log
			Set Node16_MAC8023_PORT_5.InOutThrputLogFile = topo1.8023_N16_P5_InOutThrput.log
			Set Node16_MAC8023_PORT_5.LinktoHub = 0

		Module Phy : Node16_Phy_PORT_5
			Set Node16_Phy_PORT_5.Bw = 10
			Set Node16_Phy_PORT_5.BER = 0.0
			Set Node16_Phy_PORT_5.PropDelay = 1
			Set Node16_Phy_PORT_5.linkfail = off
			Set Node16_Phy_PORT_5.linkfailFileName = topo1.phy_N16_P5.linkfail

		Module Link : Node16_PORT_5
			Set Node16_PORT_5.guitag_remotenode = yes


		Bind Node16_MAC8023_PORT_5 Node16_Phy_PORT_5
		Bind Node16_Phy_PORT_5 Node16_PORT_5
	EndDefine

	Define port 6
		Module MAC8023 : Node16_MAC8023_PORT_6

			Set Node16_OFSwitch_0.port6 = Node16_MAC8023_PORT_6
			Set Node16_OFSwitch_0.fixed_net6 = Node16_MAC8023_PORT_6.no
			Set Node16_MAC8023_PORT_6.recvtarget = Node16_OFSwitch_0

			Set Node16_MAC8023_PORT_6.mac = 0:1:0:0:0:83
			Set Node16_MAC8023_PORT_6.lock_mac = off
			Set Node16_MAC8023_PORT_6.PromisOpt = on
			Set Node16_MAC8023_PORT_6.mode = full
			Set Node16_MAC8023_PORT_6.log = off
			Set Node16_MAC8023_PORT_6.logInterval = 1
			Set Node16_MAC8023_PORT_6.NumCollision = off
			Set Node16_MAC8023_PORT_6.NumUniInPkt = off
			Set Node16_MAC8023_PORT_6.NumUniOutPkt = off
			Set Node16_MAC8023_PORT_6.NumUniInOutPkt = off
			Set Node16_MAC8023_PORT_6.NumBroInPkt = off
			Set Node16_MAC8023_PORT_6.NumBroOutPkt = off
			Set Node16_MAC8023_PORT_6.NumBroInOutPkt = off
			Set Node16_MAC8023_PORT_6.NumDrop = off
			Set Node16_MAC8023_PORT_6.InThrput = off
			Set Node16_MAC8023_PORT_6.OutThrput = off
			Set Node16_MAC8023_PORT_6.InOutThrput = off
			Set Node16_MAC8023_PORT_6.UniInLogFile = topo1.8023_N16_P6_UniIn.log
			Set Node16_MAC8023_PORT_6.UniOutLogFile = topo1.8023_N16_P6_UniOut.log
			Set Node16_MAC8023_PORT_6.UniInOutLogFile = topo1.8023_N16_P6_UniInOut.log
			Set Node16_MAC8023_PORT_6.BroInLogFile = topo1.8023_N16_P6_BroIn.log
			Set Node16_MAC8023_PORT_6.BroOutLogFile = topo1.8023_N16_P6_BroOut.log
			Set Node16_MAC8023_PORT_6.BroInOutLogFile = topo1.8023_N16_P6_BroInOut.log
			Set Node16_MAC8023_PORT_6.CollLogFile = topo1.8023_N16_P6_Coll.log
			Set Node16_MAC8023_PORT_6.DropLogFile = topo1.8023_N16_P6_Drop.log
			Set Node16_MAC8023_PORT_6.InThrputLogFile = topo1.8023_N16_P6_InThrput.log
			Set Node16_MAC8023_PORT_6.OutThrputLogFile = topo1.8023_N16_P6_OutThrput.log
			Set Node16_MAC8023_PORT_6.InOutThrputLogFile = topo1.8023_N16_P6_InOutThrput.log
			Set Node16_MAC8023_PORT_6.LinktoHub = 0

		Module Phy : Node16_Phy_PORT_6
			Set Node16_Phy_PORT_6.Bw = 10
			Set Node16_Phy_PORT_6.BER = 0.0
			Set Node16_Phy_PORT_6.PropDelay = 1
			Set Node16_Phy_PORT_6.linkfail = off
			Set Node16_Phy_PORT_6.linkfailFileName = topo1.phy_N16_P6.linkfail

		Module Link : Node16_PORT_6
			Set Node16_PORT_6.guitag_remotenode = yes


		Bind Node16_MAC8023_PORT_6 Node16_Phy_PORT_6
		Bind Node16_Phy_PORT_6 Node16_PORT_6
	EndDefine

	Define port 7
		Module MAC8023 : Node16_MAC8023_PORT_7

			Set Node16_OFSwitch_0.port7 = Node16_MAC8023_PORT_7
			Set Node16_OFSwitch_0.fixed_net7 = Node16_MAC8023_PORT_7.no
			Set Node16_MAC8023_PORT_7.recvtarget = Node16_OFSwitch_0

			Set Node16_MAC8023_PORT_7.mac = 0:1:0:0:0:84
			Set Node16_MAC8023_PORT_7.lock_mac = off
			Set Node16_MAC8023_PORT_7.PromisOpt = on
			Set Node16_MAC8023_PORT_7.mode = full
			Set Node16_MAC8023_PORT_7.log = off
			Set Node16_MAC8023_PORT_7.logInterval = 1
			Set Node16_MAC8023_PORT_7.NumCollision = off
			Set Node16_MAC8023_PORT_7.NumUniInPkt = off
			Set Node16_MAC8023_PORT_7.NumUniOutPkt = off
			Set Node16_MAC8023_PORT_7.NumUniInOutPkt = off
			Set Node16_MAC8023_PORT_7.NumBroInPkt = off
			Set Node16_MAC8023_PORT_7.NumBroOutPkt = off
			Set Node16_MAC8023_PORT_7.NumBroInOutPkt = off
			Set Node16_MAC8023_PORT_7.NumDrop = off
			Set Node16_MAC8023_PORT_7.InThrput = off
			Set Node16_MAC8023_PORT_7.OutThrput = off
			Set Node16_MAC8023_PORT_7.InOutThrput = off
			Set Node16_MAC8023_PORT_7.UniInLogFile = topo1.8023_N16_P7_UniIn.log
			Set Node16_MAC8023_PORT_7.UniOutLogFile = topo1.8023_N16_P7_UniOut.log
			Set Node16_MAC8023_PORT_7.UniInOutLogFile = topo1.8023_N16_P7_UniInOut.log
			Set Node16_MAC8023_PORT_7.BroInLogFile = topo1.8023_N16_P7_BroIn.log
			Set Node16_MAC8023_PORT_7.BroOutLogFile = topo1.8023_N16_P7_BroOut.log
			Set Node16_MAC8023_PORT_7.BroInOutLogFile = topo1.8023_N16_P7_BroInOut.log
			Set Node16_MAC8023_PORT_7.CollLogFile = topo1.8023_N16_P7_Coll.log
			Set Node16_MAC8023_PORT_7.DropLogFile = topo1.8023_N16_P7_Drop.log
			Set Node16_MAC8023_PORT_7.InThrputLogFile = topo1.8023_N16_P7_InThrput.log
			Set Node16_MAC8023_PORT_7.OutThrputLogFile = topo1.8023_N16_P7_OutThrput.log
			Set Node16_MAC8023_PORT_7.InOutThrputLogFile = topo1.8023_N16_P7_InOutThrput.log
			Set Node16_MAC8023_PORT_7.LinktoHub = 0

		Module Phy : Node16_Phy_PORT_7
			Set Node16_Phy_PORT_7.Bw = 10
			Set Node16_Phy_PORT_7.BER = 0.0
			Set Node16_Phy_PORT_7.PropDelay = 1
			Set Node16_Phy_PORT_7.linkfail = off
			Set Node16_Phy_PORT_7.linkfailFileName = topo1.phy_N16_P7.linkfail

		Module Link : Node16_PORT_7
			Set Node16_PORT_7.guitag_remotenode = yes


		Bind Node16_MAC8023_PORT_7 Node16_Phy_PORT_7
		Bind Node16_Phy_PORT_7 Node16_PORT_7
	EndDefine

	Define port 8
		Module MAC8023 : Node16_MAC8023_PORT_8

			Set Node16_OFSwitch_0.port8 = Node16_MAC8023_PORT_8
			Set Node16_OFSwitch_0.fixed_net8 = Node16_MAC8023_PORT_8.no
			Set Node16_MAC8023_PORT_8.recvtarget = Node16_OFSwitch_0

			Set Node16_MAC8023_PORT_8.mac = 0:1:0:0:0:85
			Set Node16_MAC8023_PORT_8.lock_mac = off
			Set Node16_MAC8023_PORT_8.PromisOpt = on
			Set Node16_MAC8023_PORT_8.mode = full
			Set Node16_MAC8023_PORT_8.log = off
			Set Node16_MAC8023_PORT_8.logInterval = 1
			Set Node16_MAC8023_PORT_8.NumCollision = off
			Set Node16_MAC8023_PORT_8.NumUniInPkt = off
			Set Node16_MAC8023_PORT_8.NumUniOutPkt = off
			Set Node16_MAC8023_PORT_8.NumUniInOutPkt = off
			Set Node16_MAC8023_PORT_8.NumBroInPkt = off
			Set Node16_MAC8023_PORT_8.NumBroOutPkt = off
			Set Node16_MAC8023_PORT_8.NumBroInOutPkt = off
			Set Node16_MAC8023_PORT_8.NumDrop = off
			Set Node16_MAC8023_PORT_8.InThrput = off
			Set Node16_MAC8023_PORT_8.OutThrput = off
			Set Node16_MAC8023_PORT_8.InOutThrput = off
			Set Node16_MAC8023_PORT_8.UniInLogFile = topo1.8023_N16_P8_UniIn.log
			Set Node16_MAC8023_PORT_8.UniOutLogFile = topo1.8023_N16_P8_UniOut.log
			Set Node16_MAC8023_PORT_8.UniInOutLogFile = topo1.8023_N16_P8_UniInOut.log
			Set Node16_MAC8023_PORT_8.BroInLogFile = topo1.8023_N16_P8_BroIn.log
			Set Node16_MAC8023_PORT_8.BroOutLogFile = topo1.8023_N16_P8_BroOut.log
			Set Node16_MAC8023_PORT_8.BroInOutLogFile = topo1.8023_N16_P8_BroInOut.log
			Set Node16_MAC8023_PORT_8.CollLogFile = topo1.8023_N16_P8_Coll.log
			Set Node16_MAC8023_PORT_8.DropLogFile = topo1.8023_N16_P8_Drop.log
			Set Node16_MAC8023_PORT_8.InThrputLogFile = topo1.8023_N16_P8_InThrput.log
			Set Node16_MAC8023_PORT_8.OutThrputLogFile = topo1.8023_N16_P8_OutThrput.log
			Set Node16_MAC8023_PORT_8.InOutThrputLogFile = topo1.8023_N16_P8_InOutThrput.log
			Set Node16_MAC8023_PORT_8.LinktoHub = 0

		Module Phy : Node16_Phy_PORT_8
			Set Node16_Phy_PORT_8.Bw = 10
			Set Node16_Phy_PORT_8.BER = 0.0
			Set Node16_Phy_PORT_8.PropDelay = 1
			Set Node16_Phy_PORT_8.linkfail = off
			Set Node16_Phy_PORT_8.linkfailFileName = topo1.phy_N16_P8.linkfail

		Module Link : Node16_PORT_8
			Set Node16_PORT_8.guitag_remotenode = yes


		Bind Node16_MAC8023_PORT_8 Node16_Phy_PORT_8
		Bind Node16_Phy_PORT_8 Node16_PORT_8
	EndDefine

	Define port 9
		Module MAC8023 : Node16_MAC8023_PORT_9

			Set Node16_OFSwitch_0.port9 = Node16_MAC8023_PORT_9
			Set Node16_OFSwitch_0.fixed_net9 = Node16_MAC8023_PORT_9.no
			Set Node16_MAC8023_PORT_9.recvtarget = Node16_OFSwitch_0

			Set Node16_MAC8023_PORT_9.mac = 0:1:0:0:0:86
			Set Node16_MAC8023_PORT_9.lock_mac = off
			Set Node16_MAC8023_PORT_9.PromisOpt = on
			Set Node16_MAC8023_PORT_9.mode = full
			Set Node16_MAC8023_PORT_9.log = off
			Set Node16_MAC8023_PORT_9.logInterval = 1
			Set Node16_MAC8023_PORT_9.NumCollision = off
			Set Node16_MAC8023_PORT_9.NumUniInPkt = off
			Set Node16_MAC8023_PORT_9.NumUniOutPkt = off
			Set Node16_MAC8023_PORT_9.NumUniInOutPkt = off
			Set Node16_MAC8023_PORT_9.NumBroInPkt = off
			Set Node16_MAC8023_PORT_9.NumBroOutPkt = off
			Set Node16_MAC8023_PORT_9.NumBroInOutPkt = off
			Set Node16_MAC8023_PORT_9.NumDrop = off
			Set Node16_MAC8023_PORT_9.InThrput = off
			Set Node16_MAC8023_PORT_9.OutThrput = off
			Set Node16_MAC8023_PORT_9.InOutThrput = off
			Set Node16_MAC8023_PORT_9.UniInLogFile = topo1.8023_N16_P9_UniIn.log
			Set Node16_MAC8023_PORT_9.UniOutLogFile = topo1.8023_N16_P9_UniOut.log
			Set Node16_MAC8023_PORT_9.UniInOutLogFile = topo1.8023_N16_P9_UniInOut.log
			Set Node16_MAC8023_PORT_9.BroInLogFile = topo1.8023_N16_P9_BroIn.log
			Set Node16_MAC8023_PORT_9.BroOutLogFile = topo1.8023_N16_P9_BroOut.log
			Set Node16_MAC8023_PORT_9.BroInOutLogFile = topo1.8023_N16_P9_BroInOut.log
			Set Node16_MAC8023_PORT_9.CollLogFile = topo1.8023_N16_P9_Coll.log
			Set Node16_MAC8023_PORT_9.DropLogFile = topo1.8023_N16_P9_Drop.log
			Set Node16_MAC8023_PORT_9.InThrputLogFile = topo1.8023_N16_P9_InThrput.log
			Set Node16_MAC8023_PORT_9.OutThrputLogFile = topo1.8023_N16_P9_OutThrput.log
			Set Node16_MAC8023_PORT_9.InOutThrputLogFile = topo1.8023_N16_P9_InOutThrput.log
			Set Node16_MAC8023_PORT_9.LinktoHub = 0

		Module Phy : Node16_Phy_PORT_9
			Set Node16_Phy_PORT_9.Bw = 10
			Set Node16_Phy_PORT_9.BER = 0.0
			Set Node16_Phy_PORT_9.PropDelay = 1
			Set Node16_Phy_PORT_9.linkfail = off
			Set Node16_Phy_PORT_9.linkfailFileName = topo1.phy_N16_P9.linkfail

		Module Link : Node16_PORT_9
			Set Node16_PORT_9.guitag_remotenode = yes


		Bind Node16_MAC8023_PORT_9 Node16_Phy_PORT_9
		Bind Node16_Phy_PORT_9 Node16_PORT_9
	EndDefine

	Define port 10
		Module MAC8023 : Node16_MAC8023_PORT_10

			Set Node16_OFSwitch_0.port10 = Node16_MAC8023_PORT_10
			Set Node16_OFSwitch_0.fixed_net10 = Node16_MAC8023_PORT_10.no
			Set Node16_MAC8023_PORT_10.recvtarget = Node16_OFSwitch_0

			Set Node16_MAC8023_PORT_10.mac = 0:1:0:0:0:87
			Set Node16_MAC8023_PORT_10.lock_mac = off
			Set Node16_MAC8023_PORT_10.PromisOpt = on
			Set Node16_MAC8023_PORT_10.mode = full
			Set Node16_MAC8023_PORT_10.log = off
			Set Node16_MAC8023_PORT_10.logInterval = 1
			Set Node16_MAC8023_PORT_10.NumCollision = off
			Set Node16_MAC8023_PORT_10.NumUniInPkt = off
			Set Node16_MAC8023_PORT_10.NumUniOutPkt = off
			Set Node16_MAC8023_PORT_10.NumUniInOutPkt = off
			Set Node16_MAC8023_PORT_10.NumBroInPkt = off
			Set Node16_MAC8023_PORT_10.NumBroOutPkt = off
			Set Node16_MAC8023_PORT_10.NumBroInOutPkt = off
			Set Node16_MAC8023_PORT_10.NumDrop = off
			Set Node16_MAC8023_PORT_10.InThrput = off
			Set Node16_MAC8023_PORT_10.OutThrput = off
			Set Node16_MAC8023_PORT_10.InOutThrput = off
			Set Node16_MAC8023_PORT_10.UniInLogFile = topo1.8023_N16_P10_UniIn.log
			Set Node16_MAC8023_PORT_10.UniOutLogFile = topo1.8023_N16_P10_UniOut.log
			Set Node16_MAC8023_PORT_10.UniInOutLogFile = topo1.8023_N16_P10_UniInOut.log
			Set Node16_MAC8023_PORT_10.BroInLogFile = topo1.8023_N16_P10_BroIn.log
			Set Node16_MAC8023_PORT_10.BroOutLogFile = topo1.8023_N16_P10_BroOut.log
			Set Node16_MAC8023_PORT_10.BroInOutLogFile = topo1.8023_N16_P10_BroInOut.log
			Set Node16_MAC8023_PORT_10.CollLogFile = topo1.8023_N16_P10_Coll.log
			Set Node16_MAC8023_PORT_10.DropLogFile = topo1.8023_N16_P10_Drop.log
			Set Node16_MAC8023_PORT_10.InThrputLogFile = topo1.8023_N16_P10_InThrput.log
			Set Node16_MAC8023_PORT_10.OutThrputLogFile = topo1.8023_N16_P10_OutThrput.log
			Set Node16_MAC8023_PORT_10.InOutThrputLogFile = topo1.8023_N16_P10_InOutThrput.log
			Set Node16_MAC8023_PORT_10.LinktoHub = 0

		Module Phy : Node16_Phy_PORT_10
			Set Node16_Phy_PORT_10.Bw = 10
			Set Node16_Phy_PORT_10.BER = 0.0
			Set Node16_Phy_PORT_10.PropDelay = 1
			Set Node16_Phy_PORT_10.linkfail = off
			Set Node16_Phy_PORT_10.linkfailFileName = topo1.phy_N16_P10.linkfail

		Module Link : Node16_PORT_10
			Set Node16_PORT_10.guitag_remotenode = yes


		Bind Node16_MAC8023_PORT_10 Node16_Phy_PORT_10
		Bind Node16_Phy_PORT_10 Node16_PORT_10
	EndDefine

	Define port 11
		Module MAC8023 : Node16_MAC8023_PORT_11

			Set Node16_OFSwitch_0.port11 = Node16_MAC8023_PORT_11
			Set Node16_OFSwitch_0.fixed_net11 = Node16_MAC8023_PORT_11.no
			Set Node16_MAC8023_PORT_11.recvtarget = Node16_OFSwitch_0

			Set Node16_MAC8023_PORT_11.mac = 0:1:0:0:0:88
			Set Node16_MAC8023_PORT_11.lock_mac = off
			Set Node16_MAC8023_PORT_11.PromisOpt = on
			Set Node16_MAC8023_PORT_11.mode = full
			Set Node16_MAC8023_PORT_11.log = off
			Set Node16_MAC8023_PORT_11.logInterval = 1
			Set Node16_MAC8023_PORT_11.NumCollision = off
			Set Node16_MAC8023_PORT_11.NumUniInPkt = off
			Set Node16_MAC8023_PORT_11.NumUniOutPkt = off
			Set Node16_MAC8023_PORT_11.NumUniInOutPkt = off
			Set Node16_MAC8023_PORT_11.NumBroInPkt = off
			Set Node16_MAC8023_PORT_11.NumBroOutPkt = off
			Set Node16_MAC8023_PORT_11.NumBroInOutPkt = off
			Set Node16_MAC8023_PORT_11.NumDrop = off
			Set Node16_MAC8023_PORT_11.InThrput = off
			Set Node16_MAC8023_PORT_11.OutThrput = off
			Set Node16_MAC8023_PORT_11.InOutThrput = off
			Set Node16_MAC8023_PORT_11.UniInLogFile = topo1.8023_N16_P11_UniIn.log
			Set Node16_MAC8023_PORT_11.UniOutLogFile = topo1.8023_N16_P11_UniOut.log
			Set Node16_MAC8023_PORT_11.UniInOutLogFile = topo1.8023_N16_P11_UniInOut.log
			Set Node16_MAC8023_PORT_11.BroInLogFile = topo1.8023_N16_P11_BroIn.log
			Set Node16_MAC8023_PORT_11.BroOutLogFile = topo1.8023_N16_P11_BroOut.log
			Set Node16_MAC8023_PORT_11.BroInOutLogFile = topo1.8023_N16_P11_BroInOut.log
			Set Node16_MAC8023_PORT_11.CollLogFile = topo1.8023_N16_P11_Coll.log
			Set Node16_MAC8023_PORT_11.DropLogFile = topo1.8023_N16_P11_Drop.log
			Set Node16_MAC8023_PORT_11.InThrputLogFile = topo1.8023_N16_P11_InThrput.log
			Set Node16_MAC8023_PORT_11.OutThrputLogFile = topo1.8023_N16_P11_OutThrput.log
			Set Node16_MAC8023_PORT_11.InOutThrputLogFile = topo1.8023_N16_P11_InOutThrput.log
			Set Node16_MAC8023_PORT_11.LinktoHub = 0

		Module Phy : Node16_Phy_PORT_11
			Set Node16_Phy_PORT_11.Bw = 10
			Set Node16_Phy_PORT_11.BER = 0.0
			Set Node16_Phy_PORT_11.PropDelay = 1
			Set Node16_Phy_PORT_11.linkfail = off
			Set Node16_Phy_PORT_11.linkfailFileName = topo1.phy_N16_P11.linkfail

		Module Link : Node16_PORT_11
			Set Node16_PORT_11.guitag_remotenode = yes


		Bind Node16_MAC8023_PORT_11 Node16_Phy_PORT_11
		Bind Node16_Phy_PORT_11 Node16_PORT_11
	EndDefine

	Define port 12
		Module MAC8023 : Node16_MAC8023_PORT_12

			Set Node16_OFSwitch_0.port12 = Node16_MAC8023_PORT_12
			Set Node16_OFSwitch_0.fixed_net12 = Node16_MAC8023_PORT_12.no
			Set Node16_MAC8023_PORT_12.recvtarget = Node16_OFSwitch_0

			Set Node16_MAC8023_PORT_12.mac = 0:1:0:0:0:89
			Set Node16_MAC8023_PORT_12.lock_mac = off
			Set Node16_MAC8023_PORT_12.PromisOpt = on
			Set Node16_MAC8023_PORT_12.mode = full
			Set Node16_MAC8023_PORT_12.log = off
			Set Node16_MAC8023_PORT_12.logInterval = 1
			Set Node16_MAC8023_PORT_12.NumCollision = off
			Set Node16_MAC8023_PORT_12.NumUniInPkt = off
			Set Node16_MAC8023_PORT_12.NumUniOutPkt = off
			Set Node16_MAC8023_PORT_12.NumUniInOutPkt = off
			Set Node16_MAC8023_PORT_12.NumBroInPkt = off
			Set Node16_MAC8023_PORT_12.NumBroOutPkt = off
			Set Node16_MAC8023_PORT_12.NumBroInOutPkt = off
			Set Node16_MAC8023_PORT_12.NumDrop = off
			Set Node16_MAC8023_PORT_12.InThrput = off
			Set Node16_MAC8023_PORT_12.OutThrput = off
			Set Node16_MAC8023_PORT_12.InOutThrput = off
			Set Node16_MAC8023_PORT_12.UniInLogFile = topo1.8023_N16_P12_UniIn.log
			Set Node16_MAC8023_PORT_12.UniOutLogFile = topo1.8023_N16_P12_UniOut.log
			Set Node16_MAC8023_PORT_12.UniInOutLogFile = topo1.8023_N16_P12_UniInOut.log
			Set Node16_MAC8023_PORT_12.BroInLogFile = topo1.8023_N16_P12_BroIn.log
			Set Node16_MAC8023_PORT_12.BroOutLogFile = topo1.8023_N16_P12_BroOut.log
			Set Node16_MAC8023_PORT_12.BroInOutLogFile = topo1.8023_N16_P12_BroInOut.log
			Set Node16_MAC8023_PORT_12.CollLogFile = topo1.8023_N16_P12_Coll.log
			Set Node16_MAC8023_PORT_12.DropLogFile = topo1.8023_N16_P12_Drop.log
			Set Node16_MAC8023_PORT_12.InThrputLogFile = topo1.8023_N16_P12_InThrput.log
			Set Node16_MAC8023_PORT_12.OutThrputLogFile = topo1.8023_N16_P12_OutThrput.log
			Set Node16_MAC8023_PORT_12.InOutThrputLogFile = topo1.8023_N16_P12_InOutThrput.log
			Set Node16_MAC8023_PORT_12.LinktoHub = 0

		Module Phy : Node16_Phy_PORT_12
			Set Node16_Phy_PORT_12.Bw = 10
			Set Node16_Phy_PORT_12.BER = 0.0
			Set Node16_Phy_PORT_12.PropDelay = 1
			Set Node16_Phy_PORT_12.linkfail = off
			Set Node16_Phy_PORT_12.linkfailFileName = topo1.phy_N16_P12.linkfail

		Module Link : Node16_PORT_12
			Set Node16_PORT_12.guitag_remotenode = yes


		Bind Node16_MAC8023_PORT_12 Node16_Phy_PORT_12
		Bind Node16_Phy_PORT_12 Node16_PORT_12
	EndDefine

EndCreate

Create Node 17 as HOST with name = HOST17
	Define port 1
		Module Interface : Node17_Interface_PORT_1
			Set Node17_Interface_PORT_1.ip = 1.0.2.5
			Set Node17_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node17_ARP_PORT_1
			Set Node17_ARP_PORT_1.arpMode = RunARP
			Set Node17_ARP_PORT_1.flushInterval = 3000
			Set Node17_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node17_FIFO_PORT_1
			Set Node17_FIFO_PORT_1.max_qlen = 50
			Set Node17_FIFO_PORT_1.log_qlen = off
			Set Node17_FIFO_PORT_1.log_option = FullLog
			Set Node17_FIFO_PORT_1.samplerate = 1
			Set Node17_FIFO_PORT_1.logFileName = topo1.fifo_N17_P1_qlen.log
			Set Node17_FIFO_PORT_1.log_drop = off
			Set Node17_FIFO_PORT_1.drop_samplerate = 1
			Set Node17_FIFO_PORT_1.droplogFileName = topo1.fifo_N17_P1_drop.log

		Module TCPDUMP : Node17_TCPDUMP_PORT_1

		Module LO : Node17_LO_PORT_1

		Module MAC8023 : Node17_MAC8023_PORT_1
			Set Node17_MAC8023_PORT_1.mac = 0:1:0:0:0:8a
			Set Node17_MAC8023_PORT_1.lock_mac = off
			Set Node17_MAC8023_PORT_1.PromisOpt = off
			Set Node17_MAC8023_PORT_1.mode = full
			Set Node17_MAC8023_PORT_1.log = off
			Set Node17_MAC8023_PORT_1.logInterval = 1
			Set Node17_MAC8023_PORT_1.NumCollision = off
			Set Node17_MAC8023_PORT_1.NumUniInPkt = off
			Set Node17_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node17_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node17_MAC8023_PORT_1.NumBroInPkt = off
			Set Node17_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node17_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node17_MAC8023_PORT_1.NumDrop = off
			Set Node17_MAC8023_PORT_1.InThrput = off
			Set Node17_MAC8023_PORT_1.OutThrput = off
			Set Node17_MAC8023_PORT_1.InOutThrput = off
			Set Node17_MAC8023_PORT_1.UniInLogFile = topo1.8023_N17_P1_UniIn.log
			Set Node17_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N17_P1_UniOut.log
			Set Node17_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N17_P1_UniInOut.log
			Set Node17_MAC8023_PORT_1.BroInLogFile = topo1.8023_N17_P1_BroIn.log
			Set Node17_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N17_P1_BroOut.log
			Set Node17_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N17_P1_BroInOut.log
			Set Node17_MAC8023_PORT_1.CollLogFile = topo1.8023_N17_P1_Coll.log
			Set Node17_MAC8023_PORT_1.DropLogFile = topo1.8023_N17_P1_Drop.log
			Set Node17_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N17_P1_InThrput.log
			Set Node17_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N17_P1_OutThrput.log
			Set Node17_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N17_P1_InOutThrput.log
			Set Node17_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node17_Phy_PORT_1
			Set Node17_Phy_PORT_1.Bw = 10
			Set Node17_Phy_PORT_1.BER = 0.0
			Set Node17_Phy_PORT_1.PropDelay = 1
			Set Node17_Phy_PORT_1.linkfail = off
			Set Node17_Phy_PORT_1.linkfailFileName = topo1.phy_N17_P1.linkfail

		Module Link : Node17_PORT_1
			Set Node17_PORT_1.guitag_remotenode = yes


		Bind Node17_Interface_PORT_1 Node17_ARP_PORT_1
		Bind Node17_ARP_PORT_1 Node17_FIFO_PORT_1
		Bind Node17_FIFO_PORT_1 Node17_TCPDUMP_PORT_1
		Bind Node17_TCPDUMP_PORT_1 Node17_LO_PORT_1
		Bind Node17_LO_PORT_1 Node17_MAC8023_PORT_1
		Bind Node17_MAC8023_PORT_1 Node17_Phy_PORT_1
		Bind Node17_Phy_PORT_1 Node17_PORT_1
	EndDefine

EndCreate

Create Node 18 as HOST with name = HOST18
	Define port 1
		Module Interface : Node18_Interface_PORT_1
			Set Node18_Interface_PORT_1.ip = 1.0.2.6
			Set Node18_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node18_ARP_PORT_1
			Set Node18_ARP_PORT_1.arpMode = RunARP
			Set Node18_ARP_PORT_1.flushInterval = 3000
			Set Node18_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node18_FIFO_PORT_1
			Set Node18_FIFO_PORT_1.max_qlen = 50
			Set Node18_FIFO_PORT_1.log_qlen = off
			Set Node18_FIFO_PORT_1.log_option = FullLog
			Set Node18_FIFO_PORT_1.samplerate = 1
			Set Node18_FIFO_PORT_1.logFileName = topo1.fifo_N18_P1_qlen.log
			Set Node18_FIFO_PORT_1.log_drop = off
			Set Node18_FIFO_PORT_1.drop_samplerate = 1
			Set Node18_FIFO_PORT_1.droplogFileName = topo1.fifo_N18_P1_drop.log

		Module TCPDUMP : Node18_TCPDUMP_PORT_1

		Module LO : Node18_LO_PORT_1

		Module MAC8023 : Node18_MAC8023_PORT_1
			Set Node18_MAC8023_PORT_1.mac = 0:1:0:0:0:8b
			Set Node18_MAC8023_PORT_1.lock_mac = off
			Set Node18_MAC8023_PORT_1.PromisOpt = off
			Set Node18_MAC8023_PORT_1.mode = full
			Set Node18_MAC8023_PORT_1.log = off
			Set Node18_MAC8023_PORT_1.logInterval = 1
			Set Node18_MAC8023_PORT_1.NumCollision = off
			Set Node18_MAC8023_PORT_1.NumUniInPkt = off
			Set Node18_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node18_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node18_MAC8023_PORT_1.NumBroInPkt = off
			Set Node18_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node18_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node18_MAC8023_PORT_1.NumDrop = off
			Set Node18_MAC8023_PORT_1.InThrput = off
			Set Node18_MAC8023_PORT_1.OutThrput = off
			Set Node18_MAC8023_PORT_1.InOutThrput = off
			Set Node18_MAC8023_PORT_1.UniInLogFile = topo1.8023_N18_P1_UniIn.log
			Set Node18_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N18_P1_UniOut.log
			Set Node18_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N18_P1_UniInOut.log
			Set Node18_MAC8023_PORT_1.BroInLogFile = topo1.8023_N18_P1_BroIn.log
			Set Node18_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N18_P1_BroOut.log
			Set Node18_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N18_P1_BroInOut.log
			Set Node18_MAC8023_PORT_1.CollLogFile = topo1.8023_N18_P1_Coll.log
			Set Node18_MAC8023_PORT_1.DropLogFile = topo1.8023_N18_P1_Drop.log
			Set Node18_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N18_P1_InThrput.log
			Set Node18_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N18_P1_OutThrput.log
			Set Node18_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N18_P1_InOutThrput.log
			Set Node18_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node18_Phy_PORT_1
			Set Node18_Phy_PORT_1.Bw = 10
			Set Node18_Phy_PORT_1.BER = 0.0
			Set Node18_Phy_PORT_1.PropDelay = 1
			Set Node18_Phy_PORT_1.linkfail = off
			Set Node18_Phy_PORT_1.linkfailFileName = topo1.phy_N18_P1.linkfail

		Module Link : Node18_PORT_1
			Set Node18_PORT_1.guitag_remotenode = yes


		Bind Node18_Interface_PORT_1 Node18_ARP_PORT_1
		Bind Node18_ARP_PORT_1 Node18_FIFO_PORT_1
		Bind Node18_FIFO_PORT_1 Node18_TCPDUMP_PORT_1
		Bind Node18_TCPDUMP_PORT_1 Node18_LO_PORT_1
		Bind Node18_LO_PORT_1 Node18_MAC8023_PORT_1
		Bind Node18_MAC8023_PORT_1 Node18_Phy_PORT_1
		Bind Node18_Phy_PORT_1 Node18_PORT_1
	EndDefine

EndCreate

Create Node 19 as HOST with name = HOST19
	Define port 1
		Module Interface : Node19_Interface_PORT_1
			Set Node19_Interface_PORT_1.ip = 1.0.2.7
			Set Node19_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node19_ARP_PORT_1
			Set Node19_ARP_PORT_1.arpMode = RunARP
			Set Node19_ARP_PORT_1.flushInterval = 3000
			Set Node19_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node19_FIFO_PORT_1
			Set Node19_FIFO_PORT_1.max_qlen = 50
			Set Node19_FIFO_PORT_1.log_qlen = off
			Set Node19_FIFO_PORT_1.log_option = FullLog
			Set Node19_FIFO_PORT_1.samplerate = 1
			Set Node19_FIFO_PORT_1.logFileName = topo1.fifo_N19_P1_qlen.log
			Set Node19_FIFO_PORT_1.log_drop = off
			Set Node19_FIFO_PORT_1.drop_samplerate = 1
			Set Node19_FIFO_PORT_1.droplogFileName = topo1.fifo_N19_P1_drop.log

		Module TCPDUMP : Node19_TCPDUMP_PORT_1

		Module LO : Node19_LO_PORT_1

		Module MAC8023 : Node19_MAC8023_PORT_1
			Set Node19_MAC8023_PORT_1.mac = 0:1:0:0:0:8c
			Set Node19_MAC8023_PORT_1.lock_mac = off
			Set Node19_MAC8023_PORT_1.PromisOpt = off
			Set Node19_MAC8023_PORT_1.mode = full
			Set Node19_MAC8023_PORT_1.log = off
			Set Node19_MAC8023_PORT_1.logInterval = 1
			Set Node19_MAC8023_PORT_1.NumCollision = off
			Set Node19_MAC8023_PORT_1.NumUniInPkt = off
			Set Node19_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node19_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node19_MAC8023_PORT_1.NumBroInPkt = off
			Set Node19_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node19_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node19_MAC8023_PORT_1.NumDrop = off
			Set Node19_MAC8023_PORT_1.InThrput = off
			Set Node19_MAC8023_PORT_1.OutThrput = off
			Set Node19_MAC8023_PORT_1.InOutThrput = off
			Set Node19_MAC8023_PORT_1.UniInLogFile = topo1.8023_N19_P1_UniIn.log
			Set Node19_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N19_P1_UniOut.log
			Set Node19_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N19_P1_UniInOut.log
			Set Node19_MAC8023_PORT_1.BroInLogFile = topo1.8023_N19_P1_BroIn.log
			Set Node19_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N19_P1_BroOut.log
			Set Node19_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N19_P1_BroInOut.log
			Set Node19_MAC8023_PORT_1.CollLogFile = topo1.8023_N19_P1_Coll.log
			Set Node19_MAC8023_PORT_1.DropLogFile = topo1.8023_N19_P1_Drop.log
			Set Node19_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N19_P1_InThrput.log
			Set Node19_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N19_P1_OutThrput.log
			Set Node19_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N19_P1_InOutThrput.log
			Set Node19_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node19_Phy_PORT_1
			Set Node19_Phy_PORT_1.Bw = 10
			Set Node19_Phy_PORT_1.BER = 0.0
			Set Node19_Phy_PORT_1.PropDelay = 1
			Set Node19_Phy_PORT_1.linkfail = off
			Set Node19_Phy_PORT_1.linkfailFileName = topo1.phy_N19_P1.linkfail

		Module Link : Node19_PORT_1
			Set Node19_PORT_1.guitag_remotenode = yes


		Bind Node19_Interface_PORT_1 Node19_ARP_PORT_1
		Bind Node19_ARP_PORT_1 Node19_FIFO_PORT_1
		Bind Node19_FIFO_PORT_1 Node19_TCPDUMP_PORT_1
		Bind Node19_TCPDUMP_PORT_1 Node19_LO_PORT_1
		Bind Node19_LO_PORT_1 Node19_MAC8023_PORT_1
		Bind Node19_MAC8023_PORT_1 Node19_Phy_PORT_1
		Bind Node19_Phy_PORT_1 Node19_PORT_1
	EndDefine

EndCreate

Create Node 20 as HOST with name = HOST20
	Define port 1
		Module Interface : Node20_Interface_PORT_1
			Set Node20_Interface_PORT_1.ip = 1.0.2.8
			Set Node20_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node20_ARP_PORT_1
			Set Node20_ARP_PORT_1.arpMode = RunARP
			Set Node20_ARP_PORT_1.flushInterval = 3000
			Set Node20_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node20_FIFO_PORT_1
			Set Node20_FIFO_PORT_1.max_qlen = 50
			Set Node20_FIFO_PORT_1.log_qlen = off
			Set Node20_FIFO_PORT_1.log_option = FullLog
			Set Node20_FIFO_PORT_1.samplerate = 1
			Set Node20_FIFO_PORT_1.logFileName = topo1.fifo_N20_P1_qlen.log
			Set Node20_FIFO_PORT_1.log_drop = off
			Set Node20_FIFO_PORT_1.drop_samplerate = 1
			Set Node20_FIFO_PORT_1.droplogFileName = topo1.fifo_N20_P1_drop.log

		Module TCPDUMP : Node20_TCPDUMP_PORT_1

		Module LO : Node20_LO_PORT_1

		Module MAC8023 : Node20_MAC8023_PORT_1
			Set Node20_MAC8023_PORT_1.mac = 0:1:0:0:0:8d
			Set Node20_MAC8023_PORT_1.lock_mac = off
			Set Node20_MAC8023_PORT_1.PromisOpt = off
			Set Node20_MAC8023_PORT_1.mode = full
			Set Node20_MAC8023_PORT_1.log = off
			Set Node20_MAC8023_PORT_1.logInterval = 1
			Set Node20_MAC8023_PORT_1.NumCollision = off
			Set Node20_MAC8023_PORT_1.NumUniInPkt = off
			Set Node20_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node20_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node20_MAC8023_PORT_1.NumBroInPkt = off
			Set Node20_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node20_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node20_MAC8023_PORT_1.NumDrop = off
			Set Node20_MAC8023_PORT_1.InThrput = off
			Set Node20_MAC8023_PORT_1.OutThrput = off
			Set Node20_MAC8023_PORT_1.InOutThrput = off
			Set Node20_MAC8023_PORT_1.UniInLogFile = topo1.8023_N20_P1_UniIn.log
			Set Node20_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N20_P1_UniOut.log
			Set Node20_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N20_P1_UniInOut.log
			Set Node20_MAC8023_PORT_1.BroInLogFile = topo1.8023_N20_P1_BroIn.log
			Set Node20_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N20_P1_BroOut.log
			Set Node20_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N20_P1_BroInOut.log
			Set Node20_MAC8023_PORT_1.CollLogFile = topo1.8023_N20_P1_Coll.log
			Set Node20_MAC8023_PORT_1.DropLogFile = topo1.8023_N20_P1_Drop.log
			Set Node20_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N20_P1_InThrput.log
			Set Node20_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N20_P1_OutThrput.log
			Set Node20_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N20_P1_InOutThrput.log
			Set Node20_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node20_Phy_PORT_1
			Set Node20_Phy_PORT_1.Bw = 10
			Set Node20_Phy_PORT_1.BER = 0.0
			Set Node20_Phy_PORT_1.PropDelay = 1
			Set Node20_Phy_PORT_1.linkfail = off
			Set Node20_Phy_PORT_1.linkfailFileName = topo1.phy_N20_P1.linkfail

		Module Link : Node20_PORT_1
			Set Node20_PORT_1.guitag_remotenode = yes


		Bind Node20_Interface_PORT_1 Node20_ARP_PORT_1
		Bind Node20_ARP_PORT_1 Node20_FIFO_PORT_1
		Bind Node20_FIFO_PORT_1 Node20_TCPDUMP_PORT_1
		Bind Node20_TCPDUMP_PORT_1 Node20_LO_PORT_1
		Bind Node20_LO_PORT_1 Node20_MAC8023_PORT_1
		Bind Node20_MAC8023_PORT_1 Node20_Phy_PORT_1
		Bind Node20_Phy_PORT_1 Node20_PORT_1
	EndDefine

EndCreate

Create Node 21 as HOST with name = HOST21
	Define port 1
		Module Interface : Node21_Interface_PORT_1
			Set Node21_Interface_PORT_1.ip = 1.0.2.9
			Set Node21_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node21_ARP_PORT_1
			Set Node21_ARP_PORT_1.arpMode = RunARP
			Set Node21_ARP_PORT_1.flushInterval = 3000
			Set Node21_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node21_FIFO_PORT_1
			Set Node21_FIFO_PORT_1.max_qlen = 50
			Set Node21_FIFO_PORT_1.log_qlen = off
			Set Node21_FIFO_PORT_1.log_option = FullLog
			Set Node21_FIFO_PORT_1.samplerate = 1
			Set Node21_FIFO_PORT_1.logFileName = topo1.fifo_N21_P1_qlen.log
			Set Node21_FIFO_PORT_1.log_drop = off
			Set Node21_FIFO_PORT_1.drop_samplerate = 1
			Set Node21_FIFO_PORT_1.droplogFileName = topo1.fifo_N21_P1_drop.log

		Module TCPDUMP : Node21_TCPDUMP_PORT_1

		Module LO : Node21_LO_PORT_1

		Module MAC8023 : Node21_MAC8023_PORT_1
			Set Node21_MAC8023_PORT_1.mac = 0:1:0:0:0:8e
			Set Node21_MAC8023_PORT_1.lock_mac = off
			Set Node21_MAC8023_PORT_1.PromisOpt = off
			Set Node21_MAC8023_PORT_1.mode = full
			Set Node21_MAC8023_PORT_1.log = off
			Set Node21_MAC8023_PORT_1.logInterval = 1
			Set Node21_MAC8023_PORT_1.NumCollision = off
			Set Node21_MAC8023_PORT_1.NumUniInPkt = off
			Set Node21_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node21_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node21_MAC8023_PORT_1.NumBroInPkt = off
			Set Node21_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node21_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node21_MAC8023_PORT_1.NumDrop = off
			Set Node21_MAC8023_PORT_1.InThrput = off
			Set Node21_MAC8023_PORT_1.OutThrput = off
			Set Node21_MAC8023_PORT_1.InOutThrput = off
			Set Node21_MAC8023_PORT_1.UniInLogFile = topo1.8023_N21_P1_UniIn.log
			Set Node21_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N21_P1_UniOut.log
			Set Node21_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N21_P1_UniInOut.log
			Set Node21_MAC8023_PORT_1.BroInLogFile = topo1.8023_N21_P1_BroIn.log
			Set Node21_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N21_P1_BroOut.log
			Set Node21_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N21_P1_BroInOut.log
			Set Node21_MAC8023_PORT_1.CollLogFile = topo1.8023_N21_P1_Coll.log
			Set Node21_MAC8023_PORT_1.DropLogFile = topo1.8023_N21_P1_Drop.log
			Set Node21_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N21_P1_InThrput.log
			Set Node21_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N21_P1_OutThrput.log
			Set Node21_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N21_P1_InOutThrput.log
			Set Node21_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node21_Phy_PORT_1
			Set Node21_Phy_PORT_1.Bw = 10
			Set Node21_Phy_PORT_1.BER = 0.0
			Set Node21_Phy_PORT_1.PropDelay = 1
			Set Node21_Phy_PORT_1.linkfail = off
			Set Node21_Phy_PORT_1.linkfailFileName = topo1.phy_N21_P1.linkfail

		Module Link : Node21_PORT_1
			Set Node21_PORT_1.guitag_remotenode = yes


		Bind Node21_Interface_PORT_1 Node21_ARP_PORT_1
		Bind Node21_ARP_PORT_1 Node21_FIFO_PORT_1
		Bind Node21_FIFO_PORT_1 Node21_TCPDUMP_PORT_1
		Bind Node21_TCPDUMP_PORT_1 Node21_LO_PORT_1
		Bind Node21_LO_PORT_1 Node21_MAC8023_PORT_1
		Bind Node21_MAC8023_PORT_1 Node21_Phy_PORT_1
		Bind Node21_Phy_PORT_1 Node21_PORT_1
	EndDefine

EndCreate

Create Node 22 as HOST with name = HOST22
	Define port 1
		Module Interface : Node22_Interface_PORT_1
			Set Node22_Interface_PORT_1.ip = 1.0.2.10
			Set Node22_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node22_ARP_PORT_1
			Set Node22_ARP_PORT_1.arpMode = RunARP
			Set Node22_ARP_PORT_1.flushInterval = 3000
			Set Node22_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node22_FIFO_PORT_1
			Set Node22_FIFO_PORT_1.max_qlen = 50
			Set Node22_FIFO_PORT_1.log_qlen = off
			Set Node22_FIFO_PORT_1.log_option = FullLog
			Set Node22_FIFO_PORT_1.samplerate = 1
			Set Node22_FIFO_PORT_1.logFileName = topo1.fifo_N22_P1_qlen.log
			Set Node22_FIFO_PORT_1.log_drop = off
			Set Node22_FIFO_PORT_1.drop_samplerate = 1
			Set Node22_FIFO_PORT_1.droplogFileName = topo1.fifo_N22_P1_drop.log

		Module TCPDUMP : Node22_TCPDUMP_PORT_1

		Module LO : Node22_LO_PORT_1

		Module MAC8023 : Node22_MAC8023_PORT_1
			Set Node22_MAC8023_PORT_1.mac = 0:1:0:0:0:8f
			Set Node22_MAC8023_PORT_1.lock_mac = off
			Set Node22_MAC8023_PORT_1.PromisOpt = off
			Set Node22_MAC8023_PORT_1.mode = full
			Set Node22_MAC8023_PORT_1.log = off
			Set Node22_MAC8023_PORT_1.logInterval = 1
			Set Node22_MAC8023_PORT_1.NumCollision = off
			Set Node22_MAC8023_PORT_1.NumUniInPkt = off
			Set Node22_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node22_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node22_MAC8023_PORT_1.NumBroInPkt = off
			Set Node22_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node22_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node22_MAC8023_PORT_1.NumDrop = off
			Set Node22_MAC8023_PORT_1.InThrput = off
			Set Node22_MAC8023_PORT_1.OutThrput = off
			Set Node22_MAC8023_PORT_1.InOutThrput = off
			Set Node22_MAC8023_PORT_1.UniInLogFile = topo1.8023_N22_P1_UniIn.log
			Set Node22_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N22_P1_UniOut.log
			Set Node22_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N22_P1_UniInOut.log
			Set Node22_MAC8023_PORT_1.BroInLogFile = topo1.8023_N22_P1_BroIn.log
			Set Node22_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N22_P1_BroOut.log
			Set Node22_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N22_P1_BroInOut.log
			Set Node22_MAC8023_PORT_1.CollLogFile = topo1.8023_N22_P1_Coll.log
			Set Node22_MAC8023_PORT_1.DropLogFile = topo1.8023_N22_P1_Drop.log
			Set Node22_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N22_P1_InThrput.log
			Set Node22_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N22_P1_OutThrput.log
			Set Node22_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N22_P1_InOutThrput.log
			Set Node22_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node22_Phy_PORT_1
			Set Node22_Phy_PORT_1.Bw = 10
			Set Node22_Phy_PORT_1.BER = 0.0
			Set Node22_Phy_PORT_1.PropDelay = 1
			Set Node22_Phy_PORT_1.linkfail = off
			Set Node22_Phy_PORT_1.linkfailFileName = topo1.phy_N22_P1.linkfail

		Module Link : Node22_PORT_1
			Set Node22_PORT_1.guitag_remotenode = yes


		Bind Node22_Interface_PORT_1 Node22_ARP_PORT_1
		Bind Node22_ARP_PORT_1 Node22_FIFO_PORT_1
		Bind Node22_FIFO_PORT_1 Node22_TCPDUMP_PORT_1
		Bind Node22_TCPDUMP_PORT_1 Node22_LO_PORT_1
		Bind Node22_LO_PORT_1 Node22_MAC8023_PORT_1
		Bind Node22_MAC8023_PORT_1 Node22_Phy_PORT_1
		Bind Node22_Phy_PORT_1 Node22_PORT_1
	EndDefine

EndCreate

Create Node 23 as HOST with name = HOST23
	Define port 1
		Module Interface : Node23_Interface_PORT_1
			Set Node23_Interface_PORT_1.ip = 1.0.2.11
			Set Node23_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node23_ARP_PORT_1
			Set Node23_ARP_PORT_1.arpMode = RunARP
			Set Node23_ARP_PORT_1.flushInterval = 3000
			Set Node23_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node23_FIFO_PORT_1
			Set Node23_FIFO_PORT_1.max_qlen = 50
			Set Node23_FIFO_PORT_1.log_qlen = off
			Set Node23_FIFO_PORT_1.log_option = FullLog
			Set Node23_FIFO_PORT_1.samplerate = 1
			Set Node23_FIFO_PORT_1.logFileName = topo1.fifo_N23_P1_qlen.log
			Set Node23_FIFO_PORT_1.log_drop = off
			Set Node23_FIFO_PORT_1.drop_samplerate = 1
			Set Node23_FIFO_PORT_1.droplogFileName = topo1.fifo_N23_P1_drop.log

		Module TCPDUMP : Node23_TCPDUMP_PORT_1

		Module LO : Node23_LO_PORT_1

		Module MAC8023 : Node23_MAC8023_PORT_1
			Set Node23_MAC8023_PORT_1.mac = 0:1:0:0:0:90
			Set Node23_MAC8023_PORT_1.lock_mac = off
			Set Node23_MAC8023_PORT_1.PromisOpt = off
			Set Node23_MAC8023_PORT_1.mode = full
			Set Node23_MAC8023_PORT_1.log = off
			Set Node23_MAC8023_PORT_1.logInterval = 1
			Set Node23_MAC8023_PORT_1.NumCollision = off
			Set Node23_MAC8023_PORT_1.NumUniInPkt = off
			Set Node23_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node23_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node23_MAC8023_PORT_1.NumBroInPkt = off
			Set Node23_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node23_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node23_MAC8023_PORT_1.NumDrop = off
			Set Node23_MAC8023_PORT_1.InThrput = off
			Set Node23_MAC8023_PORT_1.OutThrput = off
			Set Node23_MAC8023_PORT_1.InOutThrput = off
			Set Node23_MAC8023_PORT_1.UniInLogFile = topo1.8023_N23_P1_UniIn.log
			Set Node23_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N23_P1_UniOut.log
			Set Node23_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N23_P1_UniInOut.log
			Set Node23_MAC8023_PORT_1.BroInLogFile = topo1.8023_N23_P1_BroIn.log
			Set Node23_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N23_P1_BroOut.log
			Set Node23_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N23_P1_BroInOut.log
			Set Node23_MAC8023_PORT_1.CollLogFile = topo1.8023_N23_P1_Coll.log
			Set Node23_MAC8023_PORT_1.DropLogFile = topo1.8023_N23_P1_Drop.log
			Set Node23_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N23_P1_InThrput.log
			Set Node23_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N23_P1_OutThrput.log
			Set Node23_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N23_P1_InOutThrput.log
			Set Node23_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node23_Phy_PORT_1
			Set Node23_Phy_PORT_1.Bw = 10
			Set Node23_Phy_PORT_1.BER = 0.0
			Set Node23_Phy_PORT_1.PropDelay = 1
			Set Node23_Phy_PORT_1.linkfail = off
			Set Node23_Phy_PORT_1.linkfailFileName = topo1.phy_N23_P1.linkfail

		Module Link : Node23_PORT_1
			Set Node23_PORT_1.guitag_remotenode = yes


		Bind Node23_Interface_PORT_1 Node23_ARP_PORT_1
		Bind Node23_ARP_PORT_1 Node23_FIFO_PORT_1
		Bind Node23_FIFO_PORT_1 Node23_TCPDUMP_PORT_1
		Bind Node23_TCPDUMP_PORT_1 Node23_LO_PORT_1
		Bind Node23_LO_PORT_1 Node23_MAC8023_PORT_1
		Bind Node23_MAC8023_PORT_1 Node23_Phy_PORT_1
		Bind Node23_Phy_PORT_1 Node23_PORT_1
	EndDefine

EndCreate

Create Node 24 as HOST with name = HOST24
	Define port 1
		Module Interface : Node24_Interface_PORT_1
			Set Node24_Interface_PORT_1.ip = 1.0.2.12
			Set Node24_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node24_ARP_PORT_1
			Set Node24_ARP_PORT_1.arpMode = RunARP
			Set Node24_ARP_PORT_1.flushInterval = 3000
			Set Node24_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node24_FIFO_PORT_1
			Set Node24_FIFO_PORT_1.max_qlen = 50
			Set Node24_FIFO_PORT_1.log_qlen = off
			Set Node24_FIFO_PORT_1.log_option = FullLog
			Set Node24_FIFO_PORT_1.samplerate = 1
			Set Node24_FIFO_PORT_1.logFileName = topo1.fifo_N24_P1_qlen.log
			Set Node24_FIFO_PORT_1.log_drop = off
			Set Node24_FIFO_PORT_1.drop_samplerate = 1
			Set Node24_FIFO_PORT_1.droplogFileName = topo1.fifo_N24_P1_drop.log

		Module TCPDUMP : Node24_TCPDUMP_PORT_1

		Module LO : Node24_LO_PORT_1

		Module MAC8023 : Node24_MAC8023_PORT_1
			Set Node24_MAC8023_PORT_1.mac = 0:1:0:0:0:91
			Set Node24_MAC8023_PORT_1.lock_mac = off
			Set Node24_MAC8023_PORT_1.PromisOpt = off
			Set Node24_MAC8023_PORT_1.mode = full
			Set Node24_MAC8023_PORT_1.log = off
			Set Node24_MAC8023_PORT_1.logInterval = 1
			Set Node24_MAC8023_PORT_1.NumCollision = off
			Set Node24_MAC8023_PORT_1.NumUniInPkt = off
			Set Node24_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node24_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node24_MAC8023_PORT_1.NumBroInPkt = off
			Set Node24_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node24_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node24_MAC8023_PORT_1.NumDrop = off
			Set Node24_MAC8023_PORT_1.InThrput = off
			Set Node24_MAC8023_PORT_1.OutThrput = off
			Set Node24_MAC8023_PORT_1.InOutThrput = off
			Set Node24_MAC8023_PORT_1.UniInLogFile = topo1.8023_N24_P1_UniIn.log
			Set Node24_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N24_P1_UniOut.log
			Set Node24_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N24_P1_UniInOut.log
			Set Node24_MAC8023_PORT_1.BroInLogFile = topo1.8023_N24_P1_BroIn.log
			Set Node24_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N24_P1_BroOut.log
			Set Node24_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N24_P1_BroInOut.log
			Set Node24_MAC8023_PORT_1.CollLogFile = topo1.8023_N24_P1_Coll.log
			Set Node24_MAC8023_PORT_1.DropLogFile = topo1.8023_N24_P1_Drop.log
			Set Node24_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N24_P1_InThrput.log
			Set Node24_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N24_P1_OutThrput.log
			Set Node24_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N24_P1_InOutThrput.log
			Set Node24_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node24_Phy_PORT_1
			Set Node24_Phy_PORT_1.Bw = 10
			Set Node24_Phy_PORT_1.BER = 0.0
			Set Node24_Phy_PORT_1.PropDelay = 1
			Set Node24_Phy_PORT_1.linkfail = off
			Set Node24_Phy_PORT_1.linkfailFileName = topo1.phy_N24_P1.linkfail

		Module Link : Node24_PORT_1
			Set Node24_PORT_1.guitag_remotenode = yes


		Bind Node24_Interface_PORT_1 Node24_ARP_PORT_1
		Bind Node24_ARP_PORT_1 Node24_FIFO_PORT_1
		Bind Node24_FIFO_PORT_1 Node24_TCPDUMP_PORT_1
		Bind Node24_TCPDUMP_PORT_1 Node24_LO_PORT_1
		Bind Node24_LO_PORT_1 Node24_MAC8023_PORT_1
		Bind Node24_MAC8023_PORT_1 Node24_Phy_PORT_1
		Bind Node24_Phy_PORT_1 Node24_PORT_1
	EndDefine

EndCreate

Create Node 25 as HOST with name = HOST25
	Define port 1
		Module Interface : Node25_Interface_PORT_1
			Set Node25_Interface_PORT_1.ip = 1.0.2.13
			Set Node25_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node25_ARP_PORT_1
			Set Node25_ARP_PORT_1.arpMode = RunARP
			Set Node25_ARP_PORT_1.flushInterval = 3000
			Set Node25_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node25_FIFO_PORT_1
			Set Node25_FIFO_PORT_1.max_qlen = 50
			Set Node25_FIFO_PORT_1.log_qlen = off
			Set Node25_FIFO_PORT_1.log_option = FullLog
			Set Node25_FIFO_PORT_1.samplerate = 1
			Set Node25_FIFO_PORT_1.logFileName = topo1.fifo_N25_P1_qlen.log
			Set Node25_FIFO_PORT_1.log_drop = off
			Set Node25_FIFO_PORT_1.drop_samplerate = 1
			Set Node25_FIFO_PORT_1.droplogFileName = topo1.fifo_N25_P1_drop.log

		Module TCPDUMP : Node25_TCPDUMP_PORT_1

		Module LO : Node25_LO_PORT_1

		Module MAC8023 : Node25_MAC8023_PORT_1
			Set Node25_MAC8023_PORT_1.mac = 0:1:0:0:0:92
			Set Node25_MAC8023_PORT_1.lock_mac = off
			Set Node25_MAC8023_PORT_1.PromisOpt = off
			Set Node25_MAC8023_PORT_1.mode = full
			Set Node25_MAC8023_PORT_1.log = off
			Set Node25_MAC8023_PORT_1.logInterval = 1
			Set Node25_MAC8023_PORT_1.NumCollision = off
			Set Node25_MAC8023_PORT_1.NumUniInPkt = off
			Set Node25_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node25_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node25_MAC8023_PORT_1.NumBroInPkt = off
			Set Node25_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node25_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node25_MAC8023_PORT_1.NumDrop = off
			Set Node25_MAC8023_PORT_1.InThrput = off
			Set Node25_MAC8023_PORT_1.OutThrput = off
			Set Node25_MAC8023_PORT_1.InOutThrput = off
			Set Node25_MAC8023_PORT_1.UniInLogFile = topo1.8023_N25_P1_UniIn.log
			Set Node25_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N25_P1_UniOut.log
			Set Node25_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N25_P1_UniInOut.log
			Set Node25_MAC8023_PORT_1.BroInLogFile = topo1.8023_N25_P1_BroIn.log
			Set Node25_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N25_P1_BroOut.log
			Set Node25_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N25_P1_BroInOut.log
			Set Node25_MAC8023_PORT_1.CollLogFile = topo1.8023_N25_P1_Coll.log
			Set Node25_MAC8023_PORT_1.DropLogFile = topo1.8023_N25_P1_Drop.log
			Set Node25_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N25_P1_InThrput.log
			Set Node25_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N25_P1_OutThrput.log
			Set Node25_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N25_P1_InOutThrput.log
			Set Node25_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node25_Phy_PORT_1
			Set Node25_Phy_PORT_1.Bw = 10
			Set Node25_Phy_PORT_1.BER = 0.0
			Set Node25_Phy_PORT_1.PropDelay = 1
			Set Node25_Phy_PORT_1.linkfail = off
			Set Node25_Phy_PORT_1.linkfailFileName = topo1.phy_N25_P1.linkfail

		Module Link : Node25_PORT_1
			Set Node25_PORT_1.guitag_remotenode = yes


		Bind Node25_Interface_PORT_1 Node25_ARP_PORT_1
		Bind Node25_ARP_PORT_1 Node25_FIFO_PORT_1
		Bind Node25_FIFO_PORT_1 Node25_TCPDUMP_PORT_1
		Bind Node25_TCPDUMP_PORT_1 Node25_LO_PORT_1
		Bind Node25_LO_PORT_1 Node25_MAC8023_PORT_1
		Bind Node25_MAC8023_PORT_1 Node25_Phy_PORT_1
		Bind Node25_Phy_PORT_1 Node25_PORT_1
	EndDefine

EndCreate

Create Node 26 as HOST with name = HOST26
	Define port 1
		Module Interface : Node26_Interface_PORT_1
			Set Node26_Interface_PORT_1.ip = 1.0.2.14
			Set Node26_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node26_ARP_PORT_1
			Set Node26_ARP_PORT_1.arpMode = RunARP
			Set Node26_ARP_PORT_1.flushInterval = 3000
			Set Node26_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node26_FIFO_PORT_1
			Set Node26_FIFO_PORT_1.max_qlen = 50
			Set Node26_FIFO_PORT_1.log_qlen = off
			Set Node26_FIFO_PORT_1.log_option = FullLog
			Set Node26_FIFO_PORT_1.samplerate = 1
			Set Node26_FIFO_PORT_1.logFileName = topo1.fifo_N26_P1_qlen.log
			Set Node26_FIFO_PORT_1.log_drop = off
			Set Node26_FIFO_PORT_1.drop_samplerate = 1
			Set Node26_FIFO_PORT_1.droplogFileName = topo1.fifo_N26_P1_drop.log

		Module TCPDUMP : Node26_TCPDUMP_PORT_1

		Module LO : Node26_LO_PORT_1

		Module MAC8023 : Node26_MAC8023_PORT_1
			Set Node26_MAC8023_PORT_1.mac = 0:1:0:0:0:93
			Set Node26_MAC8023_PORT_1.lock_mac = off
			Set Node26_MAC8023_PORT_1.PromisOpt = off
			Set Node26_MAC8023_PORT_1.mode = full
			Set Node26_MAC8023_PORT_1.log = off
			Set Node26_MAC8023_PORT_1.logInterval = 1
			Set Node26_MAC8023_PORT_1.NumCollision = off
			Set Node26_MAC8023_PORT_1.NumUniInPkt = off
			Set Node26_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node26_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node26_MAC8023_PORT_1.NumBroInPkt = off
			Set Node26_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node26_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node26_MAC8023_PORT_1.NumDrop = off
			Set Node26_MAC8023_PORT_1.InThrput = off
			Set Node26_MAC8023_PORT_1.OutThrput = off
			Set Node26_MAC8023_PORT_1.InOutThrput = off
			Set Node26_MAC8023_PORT_1.UniInLogFile = topo1.8023_N26_P1_UniIn.log
			Set Node26_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N26_P1_UniOut.log
			Set Node26_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N26_P1_UniInOut.log
			Set Node26_MAC8023_PORT_1.BroInLogFile = topo1.8023_N26_P1_BroIn.log
			Set Node26_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N26_P1_BroOut.log
			Set Node26_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N26_P1_BroInOut.log
			Set Node26_MAC8023_PORT_1.CollLogFile = topo1.8023_N26_P1_Coll.log
			Set Node26_MAC8023_PORT_1.DropLogFile = topo1.8023_N26_P1_Drop.log
			Set Node26_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N26_P1_InThrput.log
			Set Node26_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N26_P1_OutThrput.log
			Set Node26_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N26_P1_InOutThrput.log
			Set Node26_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node26_Phy_PORT_1
			Set Node26_Phy_PORT_1.Bw = 10
			Set Node26_Phy_PORT_1.BER = 0.0
			Set Node26_Phy_PORT_1.PropDelay = 1
			Set Node26_Phy_PORT_1.linkfail = off
			Set Node26_Phy_PORT_1.linkfailFileName = topo1.phy_N26_P1.linkfail

		Module Link : Node26_PORT_1
			Set Node26_PORT_1.guitag_remotenode = yes


		Bind Node26_Interface_PORT_1 Node26_ARP_PORT_1
		Bind Node26_ARP_PORT_1 Node26_FIFO_PORT_1
		Bind Node26_FIFO_PORT_1 Node26_TCPDUMP_PORT_1
		Bind Node26_TCPDUMP_PORT_1 Node26_LO_PORT_1
		Bind Node26_LO_PORT_1 Node26_MAC8023_PORT_1
		Bind Node26_MAC8023_PORT_1 Node26_Phy_PORT_1
		Bind Node26_Phy_PORT_1 Node26_PORT_1
	EndDefine

EndCreate

Create Node 27 as HOST with name = HOST27
	Define port 1
		Module Interface : Node27_Interface_PORT_1
			Set Node27_Interface_PORT_1.ip = 1.0.2.15
			Set Node27_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node27_ARP_PORT_1
			Set Node27_ARP_PORT_1.arpMode = RunARP
			Set Node27_ARP_PORT_1.flushInterval = 3000
			Set Node27_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node27_FIFO_PORT_1
			Set Node27_FIFO_PORT_1.max_qlen = 50
			Set Node27_FIFO_PORT_1.log_qlen = off
			Set Node27_FIFO_PORT_1.log_option = FullLog
			Set Node27_FIFO_PORT_1.samplerate = 1
			Set Node27_FIFO_PORT_1.logFileName = topo1.fifo_N27_P1_qlen.log
			Set Node27_FIFO_PORT_1.log_drop = off
			Set Node27_FIFO_PORT_1.drop_samplerate = 1
			Set Node27_FIFO_PORT_1.droplogFileName = topo1.fifo_N27_P1_drop.log

		Module TCPDUMP : Node27_TCPDUMP_PORT_1

		Module LO : Node27_LO_PORT_1

		Module MAC8023 : Node27_MAC8023_PORT_1
			Set Node27_MAC8023_PORT_1.mac = 0:1:0:0:0:94
			Set Node27_MAC8023_PORT_1.lock_mac = off
			Set Node27_MAC8023_PORT_1.PromisOpt = off
			Set Node27_MAC8023_PORT_1.mode = full
			Set Node27_MAC8023_PORT_1.log = off
			Set Node27_MAC8023_PORT_1.logInterval = 1
			Set Node27_MAC8023_PORT_1.NumCollision = off
			Set Node27_MAC8023_PORT_1.NumUniInPkt = off
			Set Node27_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node27_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node27_MAC8023_PORT_1.NumBroInPkt = off
			Set Node27_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node27_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node27_MAC8023_PORT_1.NumDrop = off
			Set Node27_MAC8023_PORT_1.InThrput = off
			Set Node27_MAC8023_PORT_1.OutThrput = off
			Set Node27_MAC8023_PORT_1.InOutThrput = off
			Set Node27_MAC8023_PORT_1.UniInLogFile = topo1.8023_N27_P1_UniIn.log
			Set Node27_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N27_P1_UniOut.log
			Set Node27_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N27_P1_UniInOut.log
			Set Node27_MAC8023_PORT_1.BroInLogFile = topo1.8023_N27_P1_BroIn.log
			Set Node27_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N27_P1_BroOut.log
			Set Node27_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N27_P1_BroInOut.log
			Set Node27_MAC8023_PORT_1.CollLogFile = topo1.8023_N27_P1_Coll.log
			Set Node27_MAC8023_PORT_1.DropLogFile = topo1.8023_N27_P1_Drop.log
			Set Node27_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N27_P1_InThrput.log
			Set Node27_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N27_P1_OutThrput.log
			Set Node27_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N27_P1_InOutThrput.log
			Set Node27_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node27_Phy_PORT_1
			Set Node27_Phy_PORT_1.Bw = 10
			Set Node27_Phy_PORT_1.BER = 0.0
			Set Node27_Phy_PORT_1.PropDelay = 1
			Set Node27_Phy_PORT_1.linkfail = off
			Set Node27_Phy_PORT_1.linkfailFileName = topo1.phy_N27_P1.linkfail

		Module Link : Node27_PORT_1
			Set Node27_PORT_1.guitag_remotenode = yes


		Bind Node27_Interface_PORT_1 Node27_ARP_PORT_1
		Bind Node27_ARP_PORT_1 Node27_FIFO_PORT_1
		Bind Node27_FIFO_PORT_1 Node27_TCPDUMP_PORT_1
		Bind Node27_TCPDUMP_PORT_1 Node27_LO_PORT_1
		Bind Node27_LO_PORT_1 Node27_MAC8023_PORT_1
		Bind Node27_MAC8023_PORT_1 Node27_Phy_PORT_1
		Bind Node27_Phy_PORT_1 Node27_PORT_1
	EndDefine

EndCreate

Create Node 28 as HOST with name = HOST28
	Define port 1
		Module Interface : Node28_Interface_PORT_1
			Set Node28_Interface_PORT_1.ip = 1.0.2.16
			Set Node28_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node28_ARP_PORT_1
			Set Node28_ARP_PORT_1.arpMode = RunARP
			Set Node28_ARP_PORT_1.flushInterval = 3000
			Set Node28_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node28_FIFO_PORT_1
			Set Node28_FIFO_PORT_1.max_qlen = 50
			Set Node28_FIFO_PORT_1.log_qlen = off
			Set Node28_FIFO_PORT_1.log_option = FullLog
			Set Node28_FIFO_PORT_1.samplerate = 1
			Set Node28_FIFO_PORT_1.logFileName = topo1.fifo_N28_P1_qlen.log
			Set Node28_FIFO_PORT_1.log_drop = off
			Set Node28_FIFO_PORT_1.drop_samplerate = 1
			Set Node28_FIFO_PORT_1.droplogFileName = topo1.fifo_N28_P1_drop.log

		Module TCPDUMP : Node28_TCPDUMP_PORT_1

		Module LO : Node28_LO_PORT_1

		Module MAC8023 : Node28_MAC8023_PORT_1
			Set Node28_MAC8023_PORT_1.mac = 0:1:0:0:0:95
			Set Node28_MAC8023_PORT_1.lock_mac = off
			Set Node28_MAC8023_PORT_1.PromisOpt = off
			Set Node28_MAC8023_PORT_1.mode = full
			Set Node28_MAC8023_PORT_1.log = off
			Set Node28_MAC8023_PORT_1.logInterval = 1
			Set Node28_MAC8023_PORT_1.NumCollision = off
			Set Node28_MAC8023_PORT_1.NumUniInPkt = off
			Set Node28_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node28_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node28_MAC8023_PORT_1.NumBroInPkt = off
			Set Node28_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node28_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node28_MAC8023_PORT_1.NumDrop = off
			Set Node28_MAC8023_PORT_1.InThrput = off
			Set Node28_MAC8023_PORT_1.OutThrput = off
			Set Node28_MAC8023_PORT_1.InOutThrput = off
			Set Node28_MAC8023_PORT_1.UniInLogFile = topo1.8023_N28_P1_UniIn.log
			Set Node28_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N28_P1_UniOut.log
			Set Node28_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N28_P1_UniInOut.log
			Set Node28_MAC8023_PORT_1.BroInLogFile = topo1.8023_N28_P1_BroIn.log
			Set Node28_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N28_P1_BroOut.log
			Set Node28_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N28_P1_BroInOut.log
			Set Node28_MAC8023_PORT_1.CollLogFile = topo1.8023_N28_P1_Coll.log
			Set Node28_MAC8023_PORT_1.DropLogFile = topo1.8023_N28_P1_Drop.log
			Set Node28_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N28_P1_InThrput.log
			Set Node28_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N28_P1_OutThrput.log
			Set Node28_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N28_P1_InOutThrput.log
			Set Node28_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node28_Phy_PORT_1
			Set Node28_Phy_PORT_1.Bw = 10
			Set Node28_Phy_PORT_1.BER = 0.0
			Set Node28_Phy_PORT_1.PropDelay = 1
			Set Node28_Phy_PORT_1.linkfail = off
			Set Node28_Phy_PORT_1.linkfailFileName = topo1.phy_N28_P1.linkfail

		Module Link : Node28_PORT_1
			Set Node28_PORT_1.guitag_remotenode = yes


		Bind Node28_Interface_PORT_1 Node28_ARP_PORT_1
		Bind Node28_ARP_PORT_1 Node28_FIFO_PORT_1
		Bind Node28_FIFO_PORT_1 Node28_TCPDUMP_PORT_1
		Bind Node28_TCPDUMP_PORT_1 Node28_LO_PORT_1
		Bind Node28_LO_PORT_1 Node28_MAC8023_PORT_1
		Bind Node28_MAC8023_PORT_1 Node28_Phy_PORT_1
		Bind Node28_Phy_PORT_1 Node28_PORT_1
	EndDefine

EndCreate

Create Node 29 as HOST with name = HOST29
	Define port 1
		Module Interface : Node29_Interface_PORT_1
			Set Node29_Interface_PORT_1.ip = 1.0.2.17
			Set Node29_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node29_ARP_PORT_1
			Set Node29_ARP_PORT_1.arpMode = RunARP
			Set Node29_ARP_PORT_1.flushInterval = 3000
			Set Node29_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node29_FIFO_PORT_1
			Set Node29_FIFO_PORT_1.max_qlen = 50
			Set Node29_FIFO_PORT_1.log_qlen = off
			Set Node29_FIFO_PORT_1.log_option = FullLog
			Set Node29_FIFO_PORT_1.samplerate = 1
			Set Node29_FIFO_PORT_1.logFileName = topo1.fifo_N29_P1_qlen.log
			Set Node29_FIFO_PORT_1.log_drop = off
			Set Node29_FIFO_PORT_1.drop_samplerate = 1
			Set Node29_FIFO_PORT_1.droplogFileName = topo1.fifo_N29_P1_drop.log

		Module TCPDUMP : Node29_TCPDUMP_PORT_1

		Module LO : Node29_LO_PORT_1

		Module MAC8023 : Node29_MAC8023_PORT_1
			Set Node29_MAC8023_PORT_1.mac = 0:1:0:0:0:96
			Set Node29_MAC8023_PORT_1.lock_mac = off
			Set Node29_MAC8023_PORT_1.PromisOpt = off
			Set Node29_MAC8023_PORT_1.mode = full
			Set Node29_MAC8023_PORT_1.log = off
			Set Node29_MAC8023_PORT_1.logInterval = 1
			Set Node29_MAC8023_PORT_1.NumCollision = off
			Set Node29_MAC8023_PORT_1.NumUniInPkt = off
			Set Node29_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node29_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node29_MAC8023_PORT_1.NumBroInPkt = off
			Set Node29_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node29_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node29_MAC8023_PORT_1.NumDrop = off
			Set Node29_MAC8023_PORT_1.InThrput = off
			Set Node29_MAC8023_PORT_1.OutThrput = off
			Set Node29_MAC8023_PORT_1.InOutThrput = off
			Set Node29_MAC8023_PORT_1.UniInLogFile = topo1.8023_N29_P1_UniIn.log
			Set Node29_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N29_P1_UniOut.log
			Set Node29_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N29_P1_UniInOut.log
			Set Node29_MAC8023_PORT_1.BroInLogFile = topo1.8023_N29_P1_BroIn.log
			Set Node29_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N29_P1_BroOut.log
			Set Node29_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N29_P1_BroInOut.log
			Set Node29_MAC8023_PORT_1.CollLogFile = topo1.8023_N29_P1_Coll.log
			Set Node29_MAC8023_PORT_1.DropLogFile = topo1.8023_N29_P1_Drop.log
			Set Node29_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N29_P1_InThrput.log
			Set Node29_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N29_P1_OutThrput.log
			Set Node29_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N29_P1_InOutThrput.log
			Set Node29_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node29_Phy_PORT_1
			Set Node29_Phy_PORT_1.Bw = 10
			Set Node29_Phy_PORT_1.BER = 0.0
			Set Node29_Phy_PORT_1.PropDelay = 1
			Set Node29_Phy_PORT_1.linkfail = off
			Set Node29_Phy_PORT_1.linkfailFileName = topo1.phy_N29_P1.linkfail

		Module Link : Node29_PORT_1
			Set Node29_PORT_1.guitag_remotenode = yes


		Bind Node29_Interface_PORT_1 Node29_ARP_PORT_1
		Bind Node29_ARP_PORT_1 Node29_FIFO_PORT_1
		Bind Node29_FIFO_PORT_1 Node29_TCPDUMP_PORT_1
		Bind Node29_TCPDUMP_PORT_1 Node29_LO_PORT_1
		Bind Node29_LO_PORT_1 Node29_MAC8023_PORT_1
		Bind Node29_MAC8023_PORT_1 Node29_Phy_PORT_1
		Bind Node29_Phy_PORT_1 Node29_PORT_1
	EndDefine

EndCreate

Create Node 30 as HOST with name = HOST30
	Define port 1
		Module Interface : Node30_Interface_PORT_1
			Set Node30_Interface_PORT_1.ip = 1.0.2.18
			Set Node30_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node30_ARP_PORT_1
			Set Node30_ARP_PORT_1.arpMode = RunARP
			Set Node30_ARP_PORT_1.flushInterval = 3000
			Set Node30_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node30_FIFO_PORT_1
			Set Node30_FIFO_PORT_1.max_qlen = 50
			Set Node30_FIFO_PORT_1.log_qlen = off
			Set Node30_FIFO_PORT_1.log_option = FullLog
			Set Node30_FIFO_PORT_1.samplerate = 1
			Set Node30_FIFO_PORT_1.logFileName = topo1.fifo_N30_P1_qlen.log
			Set Node30_FIFO_PORT_1.log_drop = off
			Set Node30_FIFO_PORT_1.drop_samplerate = 1
			Set Node30_FIFO_PORT_1.droplogFileName = topo1.fifo_N30_P1_drop.log

		Module TCPDUMP : Node30_TCPDUMP_PORT_1

		Module LO : Node30_LO_PORT_1

		Module MAC8023 : Node30_MAC8023_PORT_1
			Set Node30_MAC8023_PORT_1.mac = 0:1:0:0:0:97
			Set Node30_MAC8023_PORT_1.lock_mac = off
			Set Node30_MAC8023_PORT_1.PromisOpt = off
			Set Node30_MAC8023_PORT_1.mode = full
			Set Node30_MAC8023_PORT_1.log = off
			Set Node30_MAC8023_PORT_1.logInterval = 1
			Set Node30_MAC8023_PORT_1.NumCollision = off
			Set Node30_MAC8023_PORT_1.NumUniInPkt = off
			Set Node30_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node30_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node30_MAC8023_PORT_1.NumBroInPkt = off
			Set Node30_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node30_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node30_MAC8023_PORT_1.NumDrop = off
			Set Node30_MAC8023_PORT_1.InThrput = off
			Set Node30_MAC8023_PORT_1.OutThrput = off
			Set Node30_MAC8023_PORT_1.InOutThrput = off
			Set Node30_MAC8023_PORT_1.UniInLogFile = topo1.8023_N30_P1_UniIn.log
			Set Node30_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N30_P1_UniOut.log
			Set Node30_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N30_P1_UniInOut.log
			Set Node30_MAC8023_PORT_1.BroInLogFile = topo1.8023_N30_P1_BroIn.log
			Set Node30_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N30_P1_BroOut.log
			Set Node30_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N30_P1_BroInOut.log
			Set Node30_MAC8023_PORT_1.CollLogFile = topo1.8023_N30_P1_Coll.log
			Set Node30_MAC8023_PORT_1.DropLogFile = topo1.8023_N30_P1_Drop.log
			Set Node30_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N30_P1_InThrput.log
			Set Node30_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N30_P1_OutThrput.log
			Set Node30_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N30_P1_InOutThrput.log
			Set Node30_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node30_Phy_PORT_1
			Set Node30_Phy_PORT_1.Bw = 10
			Set Node30_Phy_PORT_1.BER = 0.0
			Set Node30_Phy_PORT_1.PropDelay = 1
			Set Node30_Phy_PORT_1.linkfail = off
			Set Node30_Phy_PORT_1.linkfailFileName = topo1.phy_N30_P1.linkfail

		Module Link : Node30_PORT_1
			Set Node30_PORT_1.guitag_remotenode = yes


		Bind Node30_Interface_PORT_1 Node30_ARP_PORT_1
		Bind Node30_ARP_PORT_1 Node30_FIFO_PORT_1
		Bind Node30_FIFO_PORT_1 Node30_TCPDUMP_PORT_1
		Bind Node30_TCPDUMP_PORT_1 Node30_LO_PORT_1
		Bind Node30_LO_PORT_1 Node30_MAC8023_PORT_1
		Bind Node30_MAC8023_PORT_1 Node30_Phy_PORT_1
		Bind Node30_Phy_PORT_1 Node30_PORT_1
	EndDefine

EndCreate

Create Node 31 as HOST with name = HOST31
	Define port 1
		Module Interface : Node31_Interface_PORT_1
			Set Node31_Interface_PORT_1.ip = 1.0.2.19
			Set Node31_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node31_ARP_PORT_1
			Set Node31_ARP_PORT_1.arpMode = RunARP
			Set Node31_ARP_PORT_1.flushInterval = 3000
			Set Node31_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node31_FIFO_PORT_1
			Set Node31_FIFO_PORT_1.max_qlen = 50
			Set Node31_FIFO_PORT_1.log_qlen = off
			Set Node31_FIFO_PORT_1.log_option = FullLog
			Set Node31_FIFO_PORT_1.samplerate = 1
			Set Node31_FIFO_PORT_1.logFileName = topo1.fifo_N31_P1_qlen.log
			Set Node31_FIFO_PORT_1.log_drop = off
			Set Node31_FIFO_PORT_1.drop_samplerate = 1
			Set Node31_FIFO_PORT_1.droplogFileName = topo1.fifo_N31_P1_drop.log

		Module TCPDUMP : Node31_TCPDUMP_PORT_1

		Module LO : Node31_LO_PORT_1

		Module MAC8023 : Node31_MAC8023_PORT_1
			Set Node31_MAC8023_PORT_1.mac = 0:1:0:0:0:98
			Set Node31_MAC8023_PORT_1.lock_mac = off
			Set Node31_MAC8023_PORT_1.PromisOpt = off
			Set Node31_MAC8023_PORT_1.mode = full
			Set Node31_MAC8023_PORT_1.log = off
			Set Node31_MAC8023_PORT_1.logInterval = 1
			Set Node31_MAC8023_PORT_1.NumCollision = off
			Set Node31_MAC8023_PORT_1.NumUniInPkt = off
			Set Node31_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node31_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node31_MAC8023_PORT_1.NumBroInPkt = off
			Set Node31_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node31_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node31_MAC8023_PORT_1.NumDrop = off
			Set Node31_MAC8023_PORT_1.InThrput = off
			Set Node31_MAC8023_PORT_1.OutThrput = off
			Set Node31_MAC8023_PORT_1.InOutThrput = off
			Set Node31_MAC8023_PORT_1.UniInLogFile = topo1.8023_N31_P1_UniIn.log
			Set Node31_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N31_P1_UniOut.log
			Set Node31_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N31_P1_UniInOut.log
			Set Node31_MAC8023_PORT_1.BroInLogFile = topo1.8023_N31_P1_BroIn.log
			Set Node31_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N31_P1_BroOut.log
			Set Node31_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N31_P1_BroInOut.log
			Set Node31_MAC8023_PORT_1.CollLogFile = topo1.8023_N31_P1_Coll.log
			Set Node31_MAC8023_PORT_1.DropLogFile = topo1.8023_N31_P1_Drop.log
			Set Node31_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N31_P1_InThrput.log
			Set Node31_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N31_P1_OutThrput.log
			Set Node31_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N31_P1_InOutThrput.log
			Set Node31_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node31_Phy_PORT_1
			Set Node31_Phy_PORT_1.Bw = 10
			Set Node31_Phy_PORT_1.BER = 0.0
			Set Node31_Phy_PORT_1.PropDelay = 1
			Set Node31_Phy_PORT_1.linkfail = off
			Set Node31_Phy_PORT_1.linkfailFileName = topo1.phy_N31_P1.linkfail

		Module Link : Node31_PORT_1
			Set Node31_PORT_1.guitag_remotenode = yes


		Bind Node31_Interface_PORT_1 Node31_ARP_PORT_1
		Bind Node31_ARP_PORT_1 Node31_FIFO_PORT_1
		Bind Node31_FIFO_PORT_1 Node31_TCPDUMP_PORT_1
		Bind Node31_TCPDUMP_PORT_1 Node31_LO_PORT_1
		Bind Node31_LO_PORT_1 Node31_MAC8023_PORT_1
		Bind Node31_MAC8023_PORT_1 Node31_Phy_PORT_1
		Bind Node31_Phy_PORT_1 Node31_PORT_1
	EndDefine

EndCreate

Create Node 32 as HOST with name = HOST32
	Define port 1
		Module Interface : Node32_Interface_PORT_1
			Set Node32_Interface_PORT_1.ip = 1.0.2.20
			Set Node32_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node32_ARP_PORT_1
			Set Node32_ARP_PORT_1.arpMode = RunARP
			Set Node32_ARP_PORT_1.flushInterval = 3000
			Set Node32_ARP_PORT_1.ArpTableFileName = topo1.arp

		Module FIFO : Node32_FIFO_PORT_1
			Set Node32_FIFO_PORT_1.max_qlen = 50
			Set Node32_FIFO_PORT_1.log_qlen = off
			Set Node32_FIFO_PORT_1.log_option = FullLog
			Set Node32_FIFO_PORT_1.samplerate = 1
			Set Node32_FIFO_PORT_1.logFileName = topo1.fifo_N32_P1_qlen.log
			Set Node32_FIFO_PORT_1.log_drop = off
			Set Node32_FIFO_PORT_1.drop_samplerate = 1
			Set Node32_FIFO_PORT_1.droplogFileName = topo1.fifo_N32_P1_drop.log

		Module TCPDUMP : Node32_TCPDUMP_PORT_1

		Module LO : Node32_LO_PORT_1

		Module MAC8023 : Node32_MAC8023_PORT_1
			Set Node32_MAC8023_PORT_1.mac = 0:1:0:0:0:99
			Set Node32_MAC8023_PORT_1.lock_mac = off
			Set Node32_MAC8023_PORT_1.PromisOpt = off
			Set Node32_MAC8023_PORT_1.mode = full
			Set Node32_MAC8023_PORT_1.log = off
			Set Node32_MAC8023_PORT_1.logInterval = 1
			Set Node32_MAC8023_PORT_1.NumCollision = off
			Set Node32_MAC8023_PORT_1.NumUniInPkt = off
			Set Node32_MAC8023_PORT_1.NumUniOutPkt = off
			Set Node32_MAC8023_PORT_1.NumUniInOutPkt = off
			Set Node32_MAC8023_PORT_1.NumBroInPkt = off
			Set Node32_MAC8023_PORT_1.NumBroOutPkt = off
			Set Node32_MAC8023_PORT_1.NumBroInOutPkt = off
			Set Node32_MAC8023_PORT_1.NumDrop = off
			Set Node32_MAC8023_PORT_1.InThrput = off
			Set Node32_MAC8023_PORT_1.OutThrput = off
			Set Node32_MAC8023_PORT_1.InOutThrput = off
			Set Node32_MAC8023_PORT_1.UniInLogFile = topo1.8023_N32_P1_UniIn.log
			Set Node32_MAC8023_PORT_1.UniOutLogFile = topo1.8023_N32_P1_UniOut.log
			Set Node32_MAC8023_PORT_1.UniInOutLogFile = topo1.8023_N32_P1_UniInOut.log
			Set Node32_MAC8023_PORT_1.BroInLogFile = topo1.8023_N32_P1_BroIn.log
			Set Node32_MAC8023_PORT_1.BroOutLogFile = topo1.8023_N32_P1_BroOut.log
			Set Node32_MAC8023_PORT_1.BroInOutLogFile = topo1.8023_N32_P1_BroInOut.log
			Set Node32_MAC8023_PORT_1.CollLogFile = topo1.8023_N32_P1_Coll.log
			Set Node32_MAC8023_PORT_1.DropLogFile = topo1.8023_N32_P1_Drop.log
			Set Node32_MAC8023_PORT_1.InThrputLogFile = topo1.8023_N32_P1_InThrput.log
			Set Node32_MAC8023_PORT_1.OutThrputLogFile = topo1.8023_N32_P1_OutThrput.log
			Set Node32_MAC8023_PORT_1.InOutThrputLogFile = topo1.8023_N32_P1_InOutThrput.log
			Set Node32_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node32_Phy_PORT_1
			Set Node32_Phy_PORT_1.Bw = 10
			Set Node32_Phy_PORT_1.BER = 0.0
			Set Node32_Phy_PORT_1.PropDelay = 1
			Set Node32_Phy_PORT_1.linkfail = off
			Set Node32_Phy_PORT_1.linkfailFileName = topo1.phy_N32_P1.linkfail

		Module Link : Node32_PORT_1
			Set Node32_PORT_1.guitag_remotenode = yes


		Bind Node32_Interface_PORT_1 Node32_ARP_PORT_1
		Bind Node32_ARP_PORT_1 Node32_FIFO_PORT_1
		Bind Node32_FIFO_PORT_1 Node32_TCPDUMP_PORT_1
		Bind Node32_TCPDUMP_PORT_1 Node32_LO_PORT_1
		Bind Node32_LO_PORT_1 Node32_MAC8023_PORT_1
		Bind Node32_MAC8023_PORT_1 Node32_Phy_PORT_1
		Bind Node32_Phy_PORT_1 Node32_PORT_1
	EndDefine

EndCreate

Connect WIRE 1.Node1_PORT_1 4.Node4_PORT_2


Connect WIRE 2.Node2_PORT_1 3.Node3_PORT_2


Connect WIRE 2.Node2_PORT_2 4.Node4_PORT_3


Connect WIRE 2.Node2_PORT_3 7.Node7_PORT_1


Connect WIRE 2.Node2_PORT_4 8.Node8_PORT_1


Connect WIRE 2.Node2_PORT_5 9.Node9_PORT_3


Connect WIRE 2.Node2_PORT_6 10.Node10_PORT_3


Connect WIRE 2.Node2_PORT_7 11.Node11_PORT_3


Connect WIRE 2.Node2_PORT_8 12.Node12_PORT_3


Connect WIRE 2.Node2_PORT_9 13.Node13_PORT_3


Connect WIRE 2.Node2_PORT_10 14.Node14_PORT_3


Connect WIRE 2.Node2_PORT_11 15.Node15_PORT_3


Connect WIRE 2.Node2_PORT_12 16.Node16_PORT_3


Connect WIRE 3.Node3_PORT_1 4.Node4_PORT_1


Connect WIRE 3.Node3_PORT_3 5.Node5_PORT_1


Connect WIRE 3.Node3_PORT_4 6.Node6_PORT_1


Connect WIRE 3.Node3_PORT_5 9.Node9_PORT_1


Connect WIRE 3.Node3_PORT_6 10.Node10_PORT_1


Connect WIRE 3.Node3_PORT_7 11.Node11_PORT_2


Connect WIRE 3.Node3_PORT_8 12.Node12_PORT_2


Connect WIRE 3.Node3_PORT_9 13.Node13_PORT_2


Connect WIRE 3.Node3_PORT_10 14.Node14_PORT_2


Connect WIRE 3.Node3_PORT_11 15.Node15_PORT_2


Connect WIRE 3.Node3_PORT_12 16.Node16_PORT_2


Connect WIRE 4.Node4_PORT_4 11.Node11_PORT_1


Connect WIRE 4.Node4_PORT_5 9.Node9_PORT_2


Connect WIRE 4.Node4_PORT_6 10.Node10_PORT_2


Connect WIRE 4.Node4_PORT_7 12.Node12_PORT_1


Connect WIRE 4.Node4_PORT_8 13.Node13_PORT_1


Connect WIRE 4.Node4_PORT_9 14.Node14_PORT_1


Connect WIRE 4.Node4_PORT_10 15.Node15_PORT_1


Connect WIRE 4.Node4_PORT_11 16.Node16_PORT_1


Connect WIRE 9.Node9_PORT_4 10.Node10_PORT_4


Connect WIRE 9.Node9_PORT_5 11.Node11_PORT_4


Connect WIRE 9.Node9_PORT_6 12.Node12_PORT_4


Connect WIRE 9.Node9_PORT_7 13.Node13_PORT_4


Connect WIRE 9.Node9_PORT_8 14.Node14_PORT_4


Connect WIRE 9.Node9_PORT_9 15.Node15_PORT_4


Connect WIRE 9.Node9_PORT_10 16.Node16_PORT_4


Connect WIRE 9.Node9_PORT_11 17.Node17_PORT_1


Connect WIRE 9.Node9_PORT_12 18.Node18_PORT_1


Connect WIRE 10.Node10_PORT_5 11.Node11_PORT_5


Connect WIRE 10.Node10_PORT_6 12.Node12_PORT_5


Connect WIRE 10.Node10_PORT_7 13.Node13_PORT_5


Connect WIRE 10.Node10_PORT_8 14.Node14_PORT_5


Connect WIRE 10.Node10_PORT_9 15.Node15_PORT_5


Connect WIRE 10.Node10_PORT_10 16.Node16_PORT_5


Connect WIRE 10.Node10_PORT_11 19.Node19_PORT_1


Connect WIRE 10.Node10_PORT_12 20.Node20_PORT_1


Connect WIRE 11.Node11_PORT_6 12.Node12_PORT_6


Connect WIRE 11.Node11_PORT_7 13.Node13_PORT_6


Connect WIRE 11.Node11_PORT_8 14.Node14_PORT_6


Connect WIRE 11.Node11_PORT_9 15.Node15_PORT_6


Connect WIRE 11.Node11_PORT_10 16.Node16_PORT_6


Connect WIRE 11.Node11_PORT_11 21.Node21_PORT_1


Connect WIRE 11.Node11_PORT_12 22.Node22_PORT_1


Connect WIRE 12.Node12_PORT_7 13.Node13_PORT_7


Connect WIRE 12.Node12_PORT_8 14.Node14_PORT_7


Connect WIRE 12.Node12_PORT_9 15.Node15_PORT_7


Connect WIRE 12.Node12_PORT_10 16.Node16_PORT_7


Connect WIRE 12.Node12_PORT_11 23.Node23_PORT_1


Connect WIRE 12.Node12_PORT_12 24.Node24_PORT_1


Connect WIRE 13.Node13_PORT_8 14.Node14_PORT_8


Connect WIRE 13.Node13_PORT_9 15.Node15_PORT_8


Connect WIRE 13.Node13_PORT_10 16.Node16_PORT_8


Connect WIRE 13.Node13_PORT_11 25.Node25_PORT_1


Connect WIRE 13.Node13_PORT_12 26.Node26_PORT_1


Connect WIRE 14.Node14_PORT_9 15.Node15_PORT_9


Connect WIRE 14.Node14_PORT_10 16.Node16_PORT_9


Connect WIRE 14.Node14_PORT_11 27.Node27_PORT_1


Connect WIRE 14.Node14_PORT_12 28.Node28_PORT_1


Connect WIRE 15.Node15_PORT_10 16.Node16_PORT_10


Connect WIRE 15.Node15_PORT_11 29.Node29_PORT_1


Connect WIRE 15.Node15_PORT_12 30.Node30_PORT_1


Connect WIRE 16.Node16_PORT_11 31.Node31_PORT_1


Connect WIRE 16.Node16_PORT_12 32.Node32_PORT_1




Run 30
