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


Create Node 1 as OF_SW with name = OF_SW1
	Module OFSwitch : Node1_OFSwitch_0
		Set Node1_OFSwitch_0.guitag_addport = yes
		Set Node1_OFSwitch_0.guitag_addport = yes
		Set Node1_OFSwitch_0.guitag_addport = yes
		Set Node1_OFSwitch_0.flow_table_amount = 15
		Set Node1_OFSwitch_0.flow_table_entry_amount = 256
		Set Node1_OFSwitch_0.group_table_entry_amount = 256
		Set Node1_OFSwitch_0.table_miss_buffer_size = 1000
		Set Node1_OFSwitch_0.fifo_queue_size = 50
		Set Node1_OFSwitch_0.controller_ip = 1.0.1.2
	Define port 1
		Module MAC8023 : Node1_MAC8023_PORT_1

			Set Node1_OFSwitch_0.port1 = Node1_MAC8023_PORT_1
			Set Node1_OFSwitch_0.fixed_net1 = Node1_MAC8023_PORT_1.no
			Set Node1_MAC8023_PORT_1.recvtarget = Node1_OFSwitch_0

			Set Node1_MAC8023_PORT_1.mac = 0:1:0:0:0:2
			Set Node1_MAC8023_PORT_1.lock_mac = off
			Set Node1_MAC8023_PORT_1.PromisOpt = on
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
			Set Node1_MAC8023_PORT_1.UniInLogFile = linear5.8023_N1_P1_UniIn.log
			Set Node1_MAC8023_PORT_1.UniOutLogFile = linear5.8023_N1_P1_UniOut.log
			Set Node1_MAC8023_PORT_1.UniInOutLogFile = linear5.8023_N1_P1_UniInOut.log
			Set Node1_MAC8023_PORT_1.BroInLogFile = linear5.8023_N1_P1_BroIn.log
			Set Node1_MAC8023_PORT_1.BroOutLogFile = linear5.8023_N1_P1_BroOut.log
			Set Node1_MAC8023_PORT_1.BroInOutLogFile = linear5.8023_N1_P1_BroInOut.log
			Set Node1_MAC8023_PORT_1.CollLogFile = linear5.8023_N1_P1_Coll.log
			Set Node1_MAC8023_PORT_1.DropLogFile = linear5.8023_N1_P1_Drop.log
			Set Node1_MAC8023_PORT_1.InThrputLogFile = linear5.8023_N1_P1_InThrput.log
			Set Node1_MAC8023_PORT_1.OutThrputLogFile = linear5.8023_N1_P1_OutThrput.log
			Set Node1_MAC8023_PORT_1.InOutThrputLogFile = linear5.8023_N1_P1_InOutThrput.log
			Set Node1_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node1_Phy_PORT_1
			Set Node1_Phy_PORT_1.Bw = 10
			Set Node1_Phy_PORT_1.BER = 0.0
			Set Node1_Phy_PORT_1.PropDelay = 1
			Set Node1_Phy_PORT_1.linkfail = off
			Set Node1_Phy_PORT_1.linkfailFileName = linear5.phy_N1_P1.linkfail

		Module Link : Node1_PORT_1
			Set Node1_PORT_1.guitag_remotenode = yes


		Bind Node1_MAC8023_PORT_1 Node1_Phy_PORT_1
		Bind Node1_Phy_PORT_1 Node1_PORT_1
	EndDefine

	Define port 2
		Module MAC8023 : Node1_MAC8023_PORT_2

			Set Node1_OFSwitch_0.port2 = Node1_MAC8023_PORT_2
			Set Node1_OFSwitch_0.fixed_net2 = Node1_MAC8023_PORT_2.no
			Set Node1_MAC8023_PORT_2.recvtarget = Node1_OFSwitch_0

			Set Node1_MAC8023_PORT_2.mac = 0:1:0:0:0:3
			Set Node1_MAC8023_PORT_2.lock_mac = off
			Set Node1_MAC8023_PORT_2.PromisOpt = on
			Set Node1_MAC8023_PORT_2.mode = full
			Set Node1_MAC8023_PORT_2.log = off
			Set Node1_MAC8023_PORT_2.logInterval = 1
			Set Node1_MAC8023_PORT_2.NumCollision = off
			Set Node1_MAC8023_PORT_2.NumUniInPkt = off
			Set Node1_MAC8023_PORT_2.NumUniOutPkt = off
			Set Node1_MAC8023_PORT_2.NumUniInOutPkt = off
			Set Node1_MAC8023_PORT_2.NumBroInPkt = off
			Set Node1_MAC8023_PORT_2.NumBroOutPkt = off
			Set Node1_MAC8023_PORT_2.NumBroInOutPkt = off
			Set Node1_MAC8023_PORT_2.NumDrop = off
			Set Node1_MAC8023_PORT_2.InThrput = off
			Set Node1_MAC8023_PORT_2.OutThrput = off
			Set Node1_MAC8023_PORT_2.InOutThrput = off
			Set Node1_MAC8023_PORT_2.UniInLogFile = linear5.8023_N1_P2_UniIn.log
			Set Node1_MAC8023_PORT_2.UniOutLogFile = linear5.8023_N1_P2_UniOut.log
			Set Node1_MAC8023_PORT_2.UniInOutLogFile = linear5.8023_N1_P2_UniInOut.log
			Set Node1_MAC8023_PORT_2.BroInLogFile = linear5.8023_N1_P2_BroIn.log
			Set Node1_MAC8023_PORT_2.BroOutLogFile = linear5.8023_N1_P2_BroOut.log
			Set Node1_MAC8023_PORT_2.BroInOutLogFile = linear5.8023_N1_P2_BroInOut.log
			Set Node1_MAC8023_PORT_2.CollLogFile = linear5.8023_N1_P2_Coll.log
			Set Node1_MAC8023_PORT_2.DropLogFile = linear5.8023_N1_P2_Drop.log
			Set Node1_MAC8023_PORT_2.InThrputLogFile = linear5.8023_N1_P2_InThrput.log
			Set Node1_MAC8023_PORT_2.OutThrputLogFile = linear5.8023_N1_P2_OutThrput.log
			Set Node1_MAC8023_PORT_2.InOutThrputLogFile = linear5.8023_N1_P2_InOutThrput.log
			Set Node1_MAC8023_PORT_2.LinktoHub = 0

		Module Phy : Node1_Phy_PORT_2
			Set Node1_Phy_PORT_2.Bw = 10
			Set Node1_Phy_PORT_2.BER = 0.0
			Set Node1_Phy_PORT_2.PropDelay = 1
			Set Node1_Phy_PORT_2.linkfail = off
			Set Node1_Phy_PORT_2.linkfailFileName = linear5.phy_N1_P2.linkfail

		Module Link : Node1_PORT_2
			Set Node1_PORT_2.guitag_remotenode = yes


		Bind Node1_MAC8023_PORT_2 Node1_Phy_PORT_2
		Bind Node1_Phy_PORT_2 Node1_PORT_2
	EndDefine

	Define port 3
		Module MAC8023 : Node1_MAC8023_PORT_3

			Set Node1_OFSwitch_0.port3 = Node1_MAC8023_PORT_3
			Set Node1_OFSwitch_0.fixed_net3 = Node1_MAC8023_PORT_3.no
			Set Node1_MAC8023_PORT_3.recvtarget = Node1_OFSwitch_0

			Set Node1_MAC8023_PORT_3.mac = 0:1:0:0:0:4
			Set Node1_MAC8023_PORT_3.lock_mac = off
			Set Node1_MAC8023_PORT_3.PromisOpt = on
			Set Node1_MAC8023_PORT_3.mode = full
			Set Node1_MAC8023_PORT_3.log = off
			Set Node1_MAC8023_PORT_3.logInterval = 1
			Set Node1_MAC8023_PORT_3.NumCollision = off
			Set Node1_MAC8023_PORT_3.NumUniInPkt = off
			Set Node1_MAC8023_PORT_3.NumUniOutPkt = off
			Set Node1_MAC8023_PORT_3.NumUniInOutPkt = off
			Set Node1_MAC8023_PORT_3.NumBroInPkt = off
			Set Node1_MAC8023_PORT_3.NumBroOutPkt = off
			Set Node1_MAC8023_PORT_3.NumBroInOutPkt = off
			Set Node1_MAC8023_PORT_3.NumDrop = off
			Set Node1_MAC8023_PORT_3.InThrput = off
			Set Node1_MAC8023_PORT_3.OutThrput = off
			Set Node1_MAC8023_PORT_3.InOutThrput = off
			Set Node1_MAC8023_PORT_3.UniInLogFile = linear5.8023_N1_P3_UniIn.log
			Set Node1_MAC8023_PORT_3.UniOutLogFile = linear5.8023_N1_P3_UniOut.log
			Set Node1_MAC8023_PORT_3.UniInOutLogFile = linear5.8023_N1_P3_UniInOut.log
			Set Node1_MAC8023_PORT_3.BroInLogFile = linear5.8023_N1_P3_BroIn.log
			Set Node1_MAC8023_PORT_3.BroOutLogFile = linear5.8023_N1_P3_BroOut.log
			Set Node1_MAC8023_PORT_3.BroInOutLogFile = linear5.8023_N1_P3_BroInOut.log
			Set Node1_MAC8023_PORT_3.CollLogFile = linear5.8023_N1_P3_Coll.log
			Set Node1_MAC8023_PORT_3.DropLogFile = linear5.8023_N1_P3_Drop.log
			Set Node1_MAC8023_PORT_3.InThrputLogFile = linear5.8023_N1_P3_InThrput.log
			Set Node1_MAC8023_PORT_3.OutThrputLogFile = linear5.8023_N1_P3_OutThrput.log
			Set Node1_MAC8023_PORT_3.InOutThrputLogFile = linear5.8023_N1_P3_InOutThrput.log
			Set Node1_MAC8023_PORT_3.LinktoHub = 0

		Module Phy : Node1_Phy_PORT_3
			Set Node1_Phy_PORT_3.Bw = 10
			Set Node1_Phy_PORT_3.BER = 0.0
			Set Node1_Phy_PORT_3.PropDelay = 1
			Set Node1_Phy_PORT_3.linkfail = off
			Set Node1_Phy_PORT_3.linkfailFileName = linear5.phy_N1_P3.linkfail

		Module Link : Node1_PORT_3
			Set Node1_PORT_3.guitag_remotenode = yes


		Bind Node1_MAC8023_PORT_3 Node1_Phy_PORT_3
		Bind Node1_Phy_PORT_3 Node1_PORT_3
	EndDefine

	Define port 4
		Module MAC8023 : Node1_MAC8023_PORT_4

			Set Node1_OFSwitch_0.port4 = Node1_MAC8023_PORT_4
			Set Node1_OFSwitch_0.fixed_net4 = Node1_MAC8023_PORT_4.no
			Set Node1_MAC8023_PORT_4.recvtarget = Node1_OFSwitch_0

			Set Node1_MAC8023_PORT_4.mac = 0:1:0:0:0:5
			Set Node1_MAC8023_PORT_4.lock_mac = off
			Set Node1_MAC8023_PORT_4.PromisOpt = on
			Set Node1_MAC8023_PORT_4.mode = full
			Set Node1_MAC8023_PORT_4.log = off
			Set Node1_MAC8023_PORT_4.logInterval = 1
			Set Node1_MAC8023_PORT_4.NumCollision = off
			Set Node1_MAC8023_PORT_4.NumUniInPkt = off
			Set Node1_MAC8023_PORT_4.NumUniOutPkt = off
			Set Node1_MAC8023_PORT_4.NumUniInOutPkt = off
			Set Node1_MAC8023_PORT_4.NumBroInPkt = off
			Set Node1_MAC8023_PORT_4.NumBroOutPkt = off
			Set Node1_MAC8023_PORT_4.NumBroInOutPkt = off
			Set Node1_MAC8023_PORT_4.NumDrop = off
			Set Node1_MAC8023_PORT_4.InThrput = off
			Set Node1_MAC8023_PORT_4.OutThrput = off
			Set Node1_MAC8023_PORT_4.InOutThrput = off
			Set Node1_MAC8023_PORT_4.UniInLogFile = linear5.8023_N1_P4_UniIn.log
			Set Node1_MAC8023_PORT_4.UniOutLogFile = linear5.8023_N1_P4_UniOut.log
			Set Node1_MAC8023_PORT_4.UniInOutLogFile = linear5.8023_N1_P4_UniInOut.log
			Set Node1_MAC8023_PORT_4.BroInLogFile = linear5.8023_N1_P4_BroIn.log
			Set Node1_MAC8023_PORT_4.BroOutLogFile = linear5.8023_N1_P4_BroOut.log
			Set Node1_MAC8023_PORT_4.BroInOutLogFile = linear5.8023_N1_P4_BroInOut.log
			Set Node1_MAC8023_PORT_4.CollLogFile = linear5.8023_N1_P4_Coll.log
			Set Node1_MAC8023_PORT_4.DropLogFile = linear5.8023_N1_P4_Drop.log
			Set Node1_MAC8023_PORT_4.InThrputLogFile = linear5.8023_N1_P4_InThrput.log
			Set Node1_MAC8023_PORT_4.OutThrputLogFile = linear5.8023_N1_P4_OutThrput.log
			Set Node1_MAC8023_PORT_4.InOutThrputLogFile = linear5.8023_N1_P4_InOutThrput.log
			Set Node1_MAC8023_PORT_4.LinktoHub = 0

		Module Phy : Node1_Phy_PORT_4
			Set Node1_Phy_PORT_4.Bw = 10
			Set Node1_Phy_PORT_4.BER = 0.0
			Set Node1_Phy_PORT_4.PropDelay = 1
			Set Node1_Phy_PORT_4.linkfail = off
			Set Node1_Phy_PORT_4.linkfailFileName = linear5.phy_N1_P4.linkfail

		Module Link : Node1_PORT_4
			Set Node1_PORT_4.guitag_remotenode = yes


		Bind Node1_MAC8023_PORT_4 Node1_Phy_PORT_4
		Bind Node1_Phy_PORT_4 Node1_PORT_4
	EndDefine

	Define port 5
		Module MAC8023 : Node1_MAC8023_PORT_5

			Set Node1_OFSwitch_0.port5 = Node1_MAC8023_PORT_5
			Set Node1_OFSwitch_0.fixed_net5 = Node1_MAC8023_PORT_5.no
			Set Node1_MAC8023_PORT_5.recvtarget = Node1_OFSwitch_0

			Set Node1_MAC8023_PORT_5.mac = 0:1:0:0:0:6
			Set Node1_MAC8023_PORT_5.lock_mac = off
			Set Node1_MAC8023_PORT_5.PromisOpt = on
			Set Node1_MAC8023_PORT_5.mode = full
			Set Node1_MAC8023_PORT_5.log = off
			Set Node1_MAC8023_PORT_5.logInterval = 1
			Set Node1_MAC8023_PORT_5.NumCollision = off
			Set Node1_MAC8023_PORT_5.NumUniInPkt = off
			Set Node1_MAC8023_PORT_5.NumUniOutPkt = off
			Set Node1_MAC8023_PORT_5.NumUniInOutPkt = off
			Set Node1_MAC8023_PORT_5.NumBroInPkt = off
			Set Node1_MAC8023_PORT_5.NumBroOutPkt = off
			Set Node1_MAC8023_PORT_5.NumBroInOutPkt = off
			Set Node1_MAC8023_PORT_5.NumDrop = off
			Set Node1_MAC8023_PORT_5.InThrput = off
			Set Node1_MAC8023_PORT_5.OutThrput = off
			Set Node1_MAC8023_PORT_5.InOutThrput = off
			Set Node1_MAC8023_PORT_5.UniInLogFile = linear5.8023_N1_P5_UniIn.log
			Set Node1_MAC8023_PORT_5.UniOutLogFile = linear5.8023_N1_P5_UniOut.log
			Set Node1_MAC8023_PORT_5.UniInOutLogFile = linear5.8023_N1_P5_UniInOut.log
			Set Node1_MAC8023_PORT_5.BroInLogFile = linear5.8023_N1_P5_BroIn.log
			Set Node1_MAC8023_PORT_5.BroOutLogFile = linear5.8023_N1_P5_BroOut.log
			Set Node1_MAC8023_PORT_5.BroInOutLogFile = linear5.8023_N1_P5_BroInOut.log
			Set Node1_MAC8023_PORT_5.CollLogFile = linear5.8023_N1_P5_Coll.log
			Set Node1_MAC8023_PORT_5.DropLogFile = linear5.8023_N1_P5_Drop.log
			Set Node1_MAC8023_PORT_5.InThrputLogFile = linear5.8023_N1_P5_InThrput.log
			Set Node1_MAC8023_PORT_5.OutThrputLogFile = linear5.8023_N1_P5_OutThrput.log
			Set Node1_MAC8023_PORT_5.InOutThrputLogFile = linear5.8023_N1_P5_InOutThrput.log
			Set Node1_MAC8023_PORT_5.LinktoHub = 0

		Module Phy : Node1_Phy_PORT_5
			Set Node1_Phy_PORT_5.Bw = 10
			Set Node1_Phy_PORT_5.BER = 0.0
			Set Node1_Phy_PORT_5.PropDelay = 1
			Set Node1_Phy_PORT_5.linkfail = off
			Set Node1_Phy_PORT_5.linkfailFileName = linear5.phy_N1_P5.linkfail

		Module Link : Node1_PORT_5
			Set Node1_PORT_5.guitag_remotenode = yes


		Bind Node1_MAC8023_PORT_5 Node1_Phy_PORT_5
		Bind Node1_Phy_PORT_5 Node1_PORT_5
	EndDefine

	Define port 6
		Module Interface : Node1_Interface_PORT_6

			Set Node1_OFSwitch_0.port6 = Node1_Interface_PORT_6
			Set Node1_OFSwitch_0.fixed_net6 = Node1_Interface_PORT_6.no
			Set Node1_Interface_PORT_6.recvtarget = Node1_OFSwitch_0

			Set Node1_Interface_PORT_6.ip = 1.0.1.1
			Set Node1_Interface_PORT_6.netmask = 255.255.255.0

		Module ARP : Node1_ARP_PORT_6
			Set Node1_ARP_PORT_6.arpMode = RunARP
			Set Node1_ARP_PORT_6.flushInterval = 3000
			Set Node1_ARP_PORT_6.ArpTableFileName = linear5.arp

		Module FIFO : Node1_FIFO_PORT_6
			Set Node1_FIFO_PORT_6.max_qlen = 50
			Set Node1_FIFO_PORT_6.log_qlen = off
			Set Node1_FIFO_PORT_6.log_option = FullLog
			Set Node1_FIFO_PORT_6.samplerate = 1
			Set Node1_FIFO_PORT_6.logFileName = linear5.fifo_N1_P6_qlen.log
			Set Node1_FIFO_PORT_6.log_drop = off
			Set Node1_FIFO_PORT_6.drop_samplerate = 1
			Set Node1_FIFO_PORT_6.droplogFileName = linear5.fifo_N1_P6_drop.log

		Module TCPDUMP : Node1_TCPDUMP_PORT_6

		Module MAC8023 : Node1_MAC8023_PORT_6
			Set Node1_MAC8023_PORT_6.mac = 0:1:0:0:0:7
			Set Node1_MAC8023_PORT_6.lock_mac = off
			Set Node1_MAC8023_PORT_6.PromisOpt = on
			Set Node1_MAC8023_PORT_6.mode = full
			Set Node1_MAC8023_PORT_6.log = off
			Set Node1_MAC8023_PORT_6.logInterval = 1
			Set Node1_MAC8023_PORT_6.NumCollision = off
			Set Node1_MAC8023_PORT_6.NumUniInPkt = off
			Set Node1_MAC8023_PORT_6.NumUniOutPkt = off
			Set Node1_MAC8023_PORT_6.NumUniInOutPkt = off
			Set Node1_MAC8023_PORT_6.NumBroInPkt = off
			Set Node1_MAC8023_PORT_6.NumBroOutPkt = off
			Set Node1_MAC8023_PORT_6.NumBroInOutPkt = off
			Set Node1_MAC8023_PORT_6.NumDrop = off
			Set Node1_MAC8023_PORT_6.InThrput = off
			Set Node1_MAC8023_PORT_6.OutThrput = off
			Set Node1_MAC8023_PORT_6.InOutThrput = off
			Set Node1_MAC8023_PORT_6.UniInLogFile = linear5.8023_N1_P6_UniIn.log
			Set Node1_MAC8023_PORT_6.UniOutLogFile = linear5.8023_N1_P6_UniOut.log
			Set Node1_MAC8023_PORT_6.UniInOutLogFile = linear5.8023_N1_P6_UniInOut.log
			Set Node1_MAC8023_PORT_6.BroInLogFile = linear5.8023_N1_P6_BroIn.log
			Set Node1_MAC8023_PORT_6.BroOutLogFile = linear5.8023_N1_P6_BroOut.log
			Set Node1_MAC8023_PORT_6.BroInOutLogFile = linear5.8023_N1_P6_BroInOut.log
			Set Node1_MAC8023_PORT_6.CollLogFile = linear5.8023_N1_P6_Coll.log
			Set Node1_MAC8023_PORT_6.DropLogFile = linear5.8023_N1_P6_Drop.log
			Set Node1_MAC8023_PORT_6.InThrputLogFile = linear5.8023_N1_P6_InThrput.log
			Set Node1_MAC8023_PORT_6.OutThrputLogFile = linear5.8023_N1_P6_OutThrput.log
			Set Node1_MAC8023_PORT_6.InOutThrputLogFile = linear5.8023_N1_P6_InOutThrput.log
			Set Node1_MAC8023_PORT_6.LinktoHub = 0

		Module Phy : Node1_Phy_PORT_6
			Set Node1_Phy_PORT_6.Bw = 10
			Set Node1_Phy_PORT_6.BER = 0.0
			Set Node1_Phy_PORT_6.PropDelay = 1
			Set Node1_Phy_PORT_6.linkfail = off
			Set Node1_Phy_PORT_6.linkfailFileName = linear5.phy_N1_P6.linkfail

		Module Link : Node1_PORT_6
			Set Node1_PORT_6.guitag_remotenode = yes


		Bind Node1_Interface_PORT_6 Node1_ARP_PORT_6
		Bind Node1_ARP_PORT_6 Node1_FIFO_PORT_6
		Bind Node1_FIFO_PORT_6 Node1_TCPDUMP_PORT_6
		Bind Node1_TCPDUMP_PORT_6 Node1_MAC8023_PORT_6
		Bind Node1_MAC8023_PORT_6 Node1_Phy_PORT_6
		Bind Node1_Phy_PORT_6 Node1_PORT_6
	EndDefine

EndCreate

Create Node 2 as OF_CTRL_SW with name = OF_CTRL_SW2
	Module Switch : Node2_Switch_0
		Set Node2_Switch_0.guitag_addport = yes
		Set Node2_Switch_0.SWITCH_MODE = KnowInAdvance
		Set Node2_Switch_0.flushInterval = 3000
		Set Node2_Switch_0.SpanningTreeProtocol = off
		Set Node2_Switch_0.HelloTime = 2
		Set Node2_Switch_0.MaxAge = 20
		Set Node2_Switch_0.ForwardDelay = 15
		Set Node2_Switch_0.SwitchTableFileName = linear5.sw_N2.smt
	Define port 1
		Module FIFO : Node2_FIFO_PORT_1

			Set Node2_Switch_0.port1 = Node2_FIFO_PORT_1
			Set Node2_Switch_0.fixed_net1 = Node2_FIFO_PORT_1.no
			Set Node2_FIFO_PORT_1.recvtarget = Node2_Switch_0

			Set Node2_FIFO_PORT_1.max_qlen = 50
			Set Node2_FIFO_PORT_1.log_qlen = off
			Set Node2_FIFO_PORT_1.log_option = FullLog
			Set Node2_FIFO_PORT_1.samplerate = 1
			Set Node2_FIFO_PORT_1.logFileName = linear5.fifo_N2_P1_qlen.log
			Set Node2_FIFO_PORT_1.log_drop = off
			Set Node2_FIFO_PORT_1.drop_samplerate = 1
			Set Node2_FIFO_PORT_1.droplogFileName = linear5.fifo_N2_P1_drop.log

		Module MAC8023 : Node2_MAC8023_PORT_1
			Set Node2_MAC8023_PORT_1.mac = 0:1:0:0:0:8
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
			Set Node2_MAC8023_PORT_1.UniInLogFile = linear5.8023_N2_P1_UniIn.log
			Set Node2_MAC8023_PORT_1.UniOutLogFile = linear5.8023_N2_P1_UniOut.log
			Set Node2_MAC8023_PORT_1.UniInOutLogFile = linear5.8023_N2_P1_UniInOut.log
			Set Node2_MAC8023_PORT_1.BroInLogFile = linear5.8023_N2_P1_BroIn.log
			Set Node2_MAC8023_PORT_1.BroOutLogFile = linear5.8023_N2_P1_BroOut.log
			Set Node2_MAC8023_PORT_1.BroInOutLogFile = linear5.8023_N2_P1_BroInOut.log
			Set Node2_MAC8023_PORT_1.CollLogFile = linear5.8023_N2_P1_Coll.log
			Set Node2_MAC8023_PORT_1.DropLogFile = linear5.8023_N2_P1_Drop.log
			Set Node2_MAC8023_PORT_1.InThrputLogFile = linear5.8023_N2_P1_InThrput.log
			Set Node2_MAC8023_PORT_1.OutThrputLogFile = linear5.8023_N2_P1_OutThrput.log
			Set Node2_MAC8023_PORT_1.InOutThrputLogFile = linear5.8023_N2_P1_InOutThrput.log
			Set Node2_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node2_Phy_PORT_1
			Set Node2_Phy_PORT_1.Bw = 10
			Set Node2_Phy_PORT_1.BER = 0.0
			Set Node2_Phy_PORT_1.PropDelay = 1
			Set Node2_Phy_PORT_1.linkfail = off
			Set Node2_Phy_PORT_1.linkfailFileName = linear5.phy_N2_P1.linkfail

		Module Link : Node2_PORT_1
			Set Node2_PORT_1.guitag_remotenode = yes


		Bind Node2_FIFO_PORT_1 Node2_MAC8023_PORT_1
		Bind Node2_MAC8023_PORT_1 Node2_Phy_PORT_1
		Bind Node2_Phy_PORT_1 Node2_PORT_1
	EndDefine

	Define port 2
		Module FIFO : Node2_FIFO_PORT_2

			Set Node2_Switch_0.port2 = Node2_FIFO_PORT_2
			Set Node2_Switch_0.fixed_net2 = Node2_FIFO_PORT_2.no
			Set Node2_FIFO_PORT_2.recvtarget = Node2_Switch_0

			Set Node2_FIFO_PORT_2.max_qlen = 50
			Set Node2_FIFO_PORT_2.log_qlen = off
			Set Node2_FIFO_PORT_2.log_option = FullLog
			Set Node2_FIFO_PORT_2.samplerate = 1
			Set Node2_FIFO_PORT_2.logFileName = linear5.fifo_N2_P2_qlen.log
			Set Node2_FIFO_PORT_2.log_drop = off
			Set Node2_FIFO_PORT_2.drop_samplerate = 1
			Set Node2_FIFO_PORT_2.droplogFileName = linear5.fifo_N2_P2_drop.log

		Module MAC8023 : Node2_MAC8023_PORT_2
			Set Node2_MAC8023_PORT_2.mac = 0:1:0:0:0:9
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
			Set Node2_MAC8023_PORT_2.UniInLogFile = linear5.8023_N2_P2_UniIn.log
			Set Node2_MAC8023_PORT_2.UniOutLogFile = linear5.8023_N2_P2_UniOut.log
			Set Node2_MAC8023_PORT_2.UniInOutLogFile = linear5.8023_N2_P2_UniInOut.log
			Set Node2_MAC8023_PORT_2.BroInLogFile = linear5.8023_N2_P2_BroIn.log
			Set Node2_MAC8023_PORT_2.BroOutLogFile = linear5.8023_N2_P2_BroOut.log
			Set Node2_MAC8023_PORT_2.BroInOutLogFile = linear5.8023_N2_P2_BroInOut.log
			Set Node2_MAC8023_PORT_2.CollLogFile = linear5.8023_N2_P2_Coll.log
			Set Node2_MAC8023_PORT_2.DropLogFile = linear5.8023_N2_P2_Drop.log
			Set Node2_MAC8023_PORT_2.InThrputLogFile = linear5.8023_N2_P2_InThrput.log
			Set Node2_MAC8023_PORT_2.OutThrputLogFile = linear5.8023_N2_P2_OutThrput.log
			Set Node2_MAC8023_PORT_2.InOutThrputLogFile = linear5.8023_N2_P2_InOutThrput.log
			Set Node2_MAC8023_PORT_2.LinktoHub = 0

		Module Phy : Node2_Phy_PORT_2
			Set Node2_Phy_PORT_2.Bw = 10
			Set Node2_Phy_PORT_2.BER = 0.0
			Set Node2_Phy_PORT_2.PropDelay = 1
			Set Node2_Phy_PORT_2.linkfail = off
			Set Node2_Phy_PORT_2.linkfailFileName = linear5.phy_N2_P2.linkfail

		Module Link : Node2_PORT_2
			Set Node2_PORT_2.guitag_remotenode = yes


		Bind Node2_FIFO_PORT_2 Node2_MAC8023_PORT_2
		Bind Node2_MAC8023_PORT_2 Node2_Phy_PORT_2
		Bind Node2_Phy_PORT_2 Node2_PORT_2
	EndDefine

EndCreate

Create Node 3 as HOST with name = HOST3
	Define port 1
		Module Interface : Node3_Interface_PORT_1
			Set Node3_Interface_PORT_1.ip = 1.0.2.1
			Set Node3_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node3_ARP_PORT_1
			Set Node3_ARP_PORT_1.arpMode = RunARP
			Set Node3_ARP_PORT_1.flushInterval = 3000
			Set Node3_ARP_PORT_1.ArpTableFileName = linear5.arp

		Module FIFO : Node3_FIFO_PORT_1
			Set Node3_FIFO_PORT_1.max_qlen = 50
			Set Node3_FIFO_PORT_1.log_qlen = off
			Set Node3_FIFO_PORT_1.log_option = FullLog
			Set Node3_FIFO_PORT_1.samplerate = 1
			Set Node3_FIFO_PORT_1.logFileName = linear5.fifo_N3_P1_qlen.log
			Set Node3_FIFO_PORT_1.log_drop = off
			Set Node3_FIFO_PORT_1.drop_samplerate = 1
			Set Node3_FIFO_PORT_1.droplogFileName = linear5.fifo_N3_P1_drop.log

		Module TCPDUMP : Node3_TCPDUMP_PORT_1

		Module LO : Node3_LO_PORT_1

		Module MAC8023 : Node3_MAC8023_PORT_1
			Set Node3_MAC8023_PORT_1.mac = 0:1:0:0:0:a
			Set Node3_MAC8023_PORT_1.lock_mac = off
			Set Node3_MAC8023_PORT_1.PromisOpt = off
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
			Set Node3_MAC8023_PORT_1.UniInLogFile = linear5.8023_N3_P1_UniIn.log
			Set Node3_MAC8023_PORT_1.UniOutLogFile = linear5.8023_N3_P1_UniOut.log
			Set Node3_MAC8023_PORT_1.UniInOutLogFile = linear5.8023_N3_P1_UniInOut.log
			Set Node3_MAC8023_PORT_1.BroInLogFile = linear5.8023_N3_P1_BroIn.log
			Set Node3_MAC8023_PORT_1.BroOutLogFile = linear5.8023_N3_P1_BroOut.log
			Set Node3_MAC8023_PORT_1.BroInOutLogFile = linear5.8023_N3_P1_BroInOut.log
			Set Node3_MAC8023_PORT_1.CollLogFile = linear5.8023_N3_P1_Coll.log
			Set Node3_MAC8023_PORT_1.DropLogFile = linear5.8023_N3_P1_Drop.log
			Set Node3_MAC8023_PORT_1.InThrputLogFile = linear5.8023_N3_P1_InThrput.log
			Set Node3_MAC8023_PORT_1.OutThrputLogFile = linear5.8023_N3_P1_OutThrput.log
			Set Node3_MAC8023_PORT_1.InOutThrputLogFile = linear5.8023_N3_P1_InOutThrput.log
			Set Node3_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node3_Phy_PORT_1
			Set Node3_Phy_PORT_1.Bw = 10
			Set Node3_Phy_PORT_1.BER = 0.0
			Set Node3_Phy_PORT_1.PropDelay = 1
			Set Node3_Phy_PORT_1.linkfail = off
			Set Node3_Phy_PORT_1.linkfailFileName = linear5.phy_N3_P1.linkfail

		Module Link : Node3_PORT_1
			Set Node3_PORT_1.guitag_remotenode = yes


		Bind Node3_Interface_PORT_1 Node3_ARP_PORT_1
		Bind Node3_ARP_PORT_1 Node3_FIFO_PORT_1
		Bind Node3_FIFO_PORT_1 Node3_TCPDUMP_PORT_1
		Bind Node3_TCPDUMP_PORT_1 Node3_LO_PORT_1
		Bind Node3_LO_PORT_1 Node3_MAC8023_PORT_1
		Bind Node3_MAC8023_PORT_1 Node3_Phy_PORT_1
		Bind Node3_Phy_PORT_1 Node3_PORT_1
	EndDefine

EndCreate

Create Node 4 as HOST with name = HOST4
	Define port 1
		Module Interface : Node4_Interface_PORT_1
			Set Node4_Interface_PORT_1.ip = 1.0.2.3
			Set Node4_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node4_ARP_PORT_1
			Set Node4_ARP_PORT_1.arpMode = RunARP
			Set Node4_ARP_PORT_1.flushInterval = 3000
			Set Node4_ARP_PORT_1.ArpTableFileName = linear5.arp

		Module FIFO : Node4_FIFO_PORT_1
			Set Node4_FIFO_PORT_1.max_qlen = 50
			Set Node4_FIFO_PORT_1.log_qlen = off
			Set Node4_FIFO_PORT_1.log_option = FullLog
			Set Node4_FIFO_PORT_1.samplerate = 1
			Set Node4_FIFO_PORT_1.logFileName = linear5.fifo_N4_P1_qlen.log
			Set Node4_FIFO_PORT_1.log_drop = off
			Set Node4_FIFO_PORT_1.drop_samplerate = 1
			Set Node4_FIFO_PORT_1.droplogFileName = linear5.fifo_N4_P1_drop.log

		Module TCPDUMP : Node4_TCPDUMP_PORT_1

		Module LO : Node4_LO_PORT_1

		Module MAC8023 : Node4_MAC8023_PORT_1
			Set Node4_MAC8023_PORT_1.mac = 0:1:0:0:0:b
			Set Node4_MAC8023_PORT_1.lock_mac = off
			Set Node4_MAC8023_PORT_1.PromisOpt = off
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
			Set Node4_MAC8023_PORT_1.UniInLogFile = linear5.8023_N4_P1_UniIn.log
			Set Node4_MAC8023_PORT_1.UniOutLogFile = linear5.8023_N4_P1_UniOut.log
			Set Node4_MAC8023_PORT_1.UniInOutLogFile = linear5.8023_N4_P1_UniInOut.log
			Set Node4_MAC8023_PORT_1.BroInLogFile = linear5.8023_N4_P1_BroIn.log
			Set Node4_MAC8023_PORT_1.BroOutLogFile = linear5.8023_N4_P1_BroOut.log
			Set Node4_MAC8023_PORT_1.BroInOutLogFile = linear5.8023_N4_P1_BroInOut.log
			Set Node4_MAC8023_PORT_1.CollLogFile = linear5.8023_N4_P1_Coll.log
			Set Node4_MAC8023_PORT_1.DropLogFile = linear5.8023_N4_P1_Drop.log
			Set Node4_MAC8023_PORT_1.InThrputLogFile = linear5.8023_N4_P1_InThrput.log
			Set Node4_MAC8023_PORT_1.OutThrputLogFile = linear5.8023_N4_P1_OutThrput.log
			Set Node4_MAC8023_PORT_1.InOutThrputLogFile = linear5.8023_N4_P1_InOutThrput.log
			Set Node4_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node4_Phy_PORT_1
			Set Node4_Phy_PORT_1.Bw = 10
			Set Node4_Phy_PORT_1.BER = 0.0
			Set Node4_Phy_PORT_1.PropDelay = 1
			Set Node4_Phy_PORT_1.linkfail = off
			Set Node4_Phy_PORT_1.linkfailFileName = linear5.phy_N4_P1.linkfail

		Module Link : Node4_PORT_1
			Set Node4_PORT_1.guitag_remotenode = yes


		Bind Node4_Interface_PORT_1 Node4_ARP_PORT_1
		Bind Node4_ARP_PORT_1 Node4_FIFO_PORT_1
		Bind Node4_FIFO_PORT_1 Node4_TCPDUMP_PORT_1
		Bind Node4_TCPDUMP_PORT_1 Node4_LO_PORT_1
		Bind Node4_LO_PORT_1 Node4_MAC8023_PORT_1
		Bind Node4_MAC8023_PORT_1 Node4_Phy_PORT_1
		Bind Node4_Phy_PORT_1 Node4_PORT_1
	EndDefine

EndCreate

Create Node 5 as HOST with name = HOST5
	Define port 1
		Module Interface : Node5_Interface_PORT_1
			Set Node5_Interface_PORT_1.ip = 1.0.2.4
			Set Node5_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node5_ARP_PORT_1
			Set Node5_ARP_PORT_1.arpMode = RunARP
			Set Node5_ARP_PORT_1.flushInterval = 3000
			Set Node5_ARP_PORT_1.ArpTableFileName = linear5.arp

		Module FIFO : Node5_FIFO_PORT_1
			Set Node5_FIFO_PORT_1.max_qlen = 50
			Set Node5_FIFO_PORT_1.log_qlen = off
			Set Node5_FIFO_PORT_1.log_option = FullLog
			Set Node5_FIFO_PORT_1.samplerate = 1
			Set Node5_FIFO_PORT_1.logFileName = linear5.fifo_N5_P1_qlen.log
			Set Node5_FIFO_PORT_1.log_drop = off
			Set Node5_FIFO_PORT_1.drop_samplerate = 1
			Set Node5_FIFO_PORT_1.droplogFileName = linear5.fifo_N5_P1_drop.log

		Module TCPDUMP : Node5_TCPDUMP_PORT_1

		Module LO : Node5_LO_PORT_1

		Module MAC8023 : Node5_MAC8023_PORT_1
			Set Node5_MAC8023_PORT_1.mac = 0:1:0:0:0:c
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
			Set Node5_MAC8023_PORT_1.UniInLogFile = linear5.8023_N5_P1_UniIn.log
			Set Node5_MAC8023_PORT_1.UniOutLogFile = linear5.8023_N5_P1_UniOut.log
			Set Node5_MAC8023_PORT_1.UniInOutLogFile = linear5.8023_N5_P1_UniInOut.log
			Set Node5_MAC8023_PORT_1.BroInLogFile = linear5.8023_N5_P1_BroIn.log
			Set Node5_MAC8023_PORT_1.BroOutLogFile = linear5.8023_N5_P1_BroOut.log
			Set Node5_MAC8023_PORT_1.BroInOutLogFile = linear5.8023_N5_P1_BroInOut.log
			Set Node5_MAC8023_PORT_1.CollLogFile = linear5.8023_N5_P1_Coll.log
			Set Node5_MAC8023_PORT_1.DropLogFile = linear5.8023_N5_P1_Drop.log
			Set Node5_MAC8023_PORT_1.InThrputLogFile = linear5.8023_N5_P1_InThrput.log
			Set Node5_MAC8023_PORT_1.OutThrputLogFile = linear5.8023_N5_P1_OutThrput.log
			Set Node5_MAC8023_PORT_1.InOutThrputLogFile = linear5.8023_N5_P1_InOutThrput.log
			Set Node5_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node5_Phy_PORT_1
			Set Node5_Phy_PORT_1.Bw = 10
			Set Node5_Phy_PORT_1.BER = 0.0
			Set Node5_Phy_PORT_1.PropDelay = 1
			Set Node5_Phy_PORT_1.linkfail = off
			Set Node5_Phy_PORT_1.linkfailFileName = linear5.phy_N5_P1.linkfail

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
			Set Node6_Interface_PORT_1.ip = 1.0.2.5
			Set Node6_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node6_ARP_PORT_1
			Set Node6_ARP_PORT_1.arpMode = RunARP
			Set Node6_ARP_PORT_1.flushInterval = 3000
			Set Node6_ARP_PORT_1.ArpTableFileName = linear5.arp

		Module FIFO : Node6_FIFO_PORT_1
			Set Node6_FIFO_PORT_1.max_qlen = 50
			Set Node6_FIFO_PORT_1.log_qlen = off
			Set Node6_FIFO_PORT_1.log_option = FullLog
			Set Node6_FIFO_PORT_1.samplerate = 1
			Set Node6_FIFO_PORT_1.logFileName = linear5.fifo_N6_P1_qlen.log
			Set Node6_FIFO_PORT_1.log_drop = off
			Set Node6_FIFO_PORT_1.drop_samplerate = 1
			Set Node6_FIFO_PORT_1.droplogFileName = linear5.fifo_N6_P1_drop.log

		Module TCPDUMP : Node6_TCPDUMP_PORT_1

		Module LO : Node6_LO_PORT_1

		Module MAC8023 : Node6_MAC8023_PORT_1
			Set Node6_MAC8023_PORT_1.mac = 0:1:0:0:0:d
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
			Set Node6_MAC8023_PORT_1.UniInLogFile = linear5.8023_N6_P1_UniIn.log
			Set Node6_MAC8023_PORT_1.UniOutLogFile = linear5.8023_N6_P1_UniOut.log
			Set Node6_MAC8023_PORT_1.UniInOutLogFile = linear5.8023_N6_P1_UniInOut.log
			Set Node6_MAC8023_PORT_1.BroInLogFile = linear5.8023_N6_P1_BroIn.log
			Set Node6_MAC8023_PORT_1.BroOutLogFile = linear5.8023_N6_P1_BroOut.log
			Set Node6_MAC8023_PORT_1.BroInOutLogFile = linear5.8023_N6_P1_BroInOut.log
			Set Node6_MAC8023_PORT_1.CollLogFile = linear5.8023_N6_P1_Coll.log
			Set Node6_MAC8023_PORT_1.DropLogFile = linear5.8023_N6_P1_Drop.log
			Set Node6_MAC8023_PORT_1.InThrputLogFile = linear5.8023_N6_P1_InThrput.log
			Set Node6_MAC8023_PORT_1.OutThrputLogFile = linear5.8023_N6_P1_OutThrput.log
			Set Node6_MAC8023_PORT_1.InOutThrputLogFile = linear5.8023_N6_P1_InOutThrput.log
			Set Node6_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node6_Phy_PORT_1
			Set Node6_Phy_PORT_1.Bw = 10
			Set Node6_Phy_PORT_1.BER = 0.0
			Set Node6_Phy_PORT_1.PropDelay = 1
			Set Node6_Phy_PORT_1.linkfail = off
			Set Node6_Phy_PORT_1.linkfailFileName = linear5.phy_N6_P1.linkfail

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
			Set Node7_Interface_PORT_1.ip = 1.0.2.2
			Set Node7_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node7_ARP_PORT_1
			Set Node7_ARP_PORT_1.arpMode = RunARP
			Set Node7_ARP_PORT_1.flushInterval = 3000
			Set Node7_ARP_PORT_1.ArpTableFileName = linear5.arp

		Module FIFO : Node7_FIFO_PORT_1
			Set Node7_FIFO_PORT_1.max_qlen = 50
			Set Node7_FIFO_PORT_1.log_qlen = off
			Set Node7_FIFO_PORT_1.log_option = FullLog
			Set Node7_FIFO_PORT_1.samplerate = 1
			Set Node7_FIFO_PORT_1.logFileName = linear5.fifo_N7_P1_qlen.log
			Set Node7_FIFO_PORT_1.log_drop = off
			Set Node7_FIFO_PORT_1.drop_samplerate = 1
			Set Node7_FIFO_PORT_1.droplogFileName = linear5.fifo_N7_P1_drop.log

		Module TCPDUMP : Node7_TCPDUMP_PORT_1

		Module LO : Node7_LO_PORT_1

		Module MAC8023 : Node7_MAC8023_PORT_1
			Set Node7_MAC8023_PORT_1.mac = 0:1:0:0:0:e
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
			Set Node7_MAC8023_PORT_1.UniInLogFile = linear5.8023_N7_P1_UniIn.log
			Set Node7_MAC8023_PORT_1.UniOutLogFile = linear5.8023_N7_P1_UniOut.log
			Set Node7_MAC8023_PORT_1.UniInOutLogFile = linear5.8023_N7_P1_UniInOut.log
			Set Node7_MAC8023_PORT_1.BroInLogFile = linear5.8023_N7_P1_BroIn.log
			Set Node7_MAC8023_PORT_1.BroOutLogFile = linear5.8023_N7_P1_BroOut.log
			Set Node7_MAC8023_PORT_1.BroInOutLogFile = linear5.8023_N7_P1_BroInOut.log
			Set Node7_MAC8023_PORT_1.CollLogFile = linear5.8023_N7_P1_Coll.log
			Set Node7_MAC8023_PORT_1.DropLogFile = linear5.8023_N7_P1_Drop.log
			Set Node7_MAC8023_PORT_1.InThrputLogFile = linear5.8023_N7_P1_InThrput.log
			Set Node7_MAC8023_PORT_1.OutThrputLogFile = linear5.8023_N7_P1_OutThrput.log
			Set Node7_MAC8023_PORT_1.InOutThrputLogFile = linear5.8023_N7_P1_InOutThrput.log
			Set Node7_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node7_Phy_PORT_1
			Set Node7_Phy_PORT_1.Bw = 10
			Set Node7_Phy_PORT_1.BER = 0.0
			Set Node7_Phy_PORT_1.PropDelay = 1
			Set Node7_Phy_PORT_1.linkfail = off
			Set Node7_Phy_PORT_1.linkfailFileName = linear5.phy_N7_P1.linkfail

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

Create Node 8 as EXT_OF_CTRL with name = EXT_OF_CTRL8
	Define port 1
		Module Interface : Node8_Interface_PORT_1
			Set Node8_Interface_PORT_1.ip = 1.0.1.2
			Set Node8_Interface_PORT_1.netmask = 255.255.255.0

		Module ARP : Node8_ARP_PORT_1
			Set Node8_ARP_PORT_1.arpMode = RunARP
			Set Node8_ARP_PORT_1.flushInterval = 3000
			Set Node8_ARP_PORT_1.ArpTableFileName = linear5.arp

		Module FIFO : Node8_FIFO_PORT_1
			Set Node8_FIFO_PORT_1.max_qlen = 50
			Set Node8_FIFO_PORT_1.log_qlen = off
			Set Node8_FIFO_PORT_1.log_option = FullLog
			Set Node8_FIFO_PORT_1.samplerate = 1
			Set Node8_FIFO_PORT_1.logFileName = linear5.fifo_N8_P1_qlen.log
			Set Node8_FIFO_PORT_1.log_drop = off
			Set Node8_FIFO_PORT_1.drop_samplerate = 1
			Set Node8_FIFO_PORT_1.droplogFileName = linear5.fifo_N8_P1_drop.log

		Module TCPDUMP : Node8_TCPDUMP_PORT_1

		Module LO : Node8_LO_PORT_1

		Module MAC8023 : Node8_MAC8023_PORT_1
			Set Node8_MAC8023_PORT_1.mac = 0:1:0:0:0:f
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
			Set Node8_MAC8023_PORT_1.UniInLogFile = linear5.8023_N8_P1_UniIn.log
			Set Node8_MAC8023_PORT_1.UniOutLogFile = linear5.8023_N8_P1_UniOut.log
			Set Node8_MAC8023_PORT_1.UniInOutLogFile = linear5.8023_N8_P1_UniInOut.log
			Set Node8_MAC8023_PORT_1.BroInLogFile = linear5.8023_N8_P1_BroIn.log
			Set Node8_MAC8023_PORT_1.BroOutLogFile = linear5.8023_N8_P1_BroOut.log
			Set Node8_MAC8023_PORT_1.BroInOutLogFile = linear5.8023_N8_P1_BroInOut.log
			Set Node8_MAC8023_PORT_1.CollLogFile = linear5.8023_N8_P1_Coll.log
			Set Node8_MAC8023_PORT_1.DropLogFile = linear5.8023_N8_P1_Drop.log
			Set Node8_MAC8023_PORT_1.InThrputLogFile = linear5.8023_N8_P1_InThrput.log
			Set Node8_MAC8023_PORT_1.OutThrputLogFile = linear5.8023_N8_P1_OutThrput.log
			Set Node8_MAC8023_PORT_1.InOutThrputLogFile = linear5.8023_N8_P1_InOutThrput.log
			Set Node8_MAC8023_PORT_1.LinktoHub = 0

		Module Phy : Node8_Phy_PORT_1
			Set Node8_Phy_PORT_1.Bw = 10
			Set Node8_Phy_PORT_1.BER = 0.0
			Set Node8_Phy_PORT_1.PropDelay = 1
			Set Node8_Phy_PORT_1.linkfail = off
			Set Node8_Phy_PORT_1.linkfailFileName = linear5.phy_N8_P1.linkfail

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

Connect WIRE 1.Node1_PORT_1 3.Node3_PORT_1


Connect WIRE 1.Node1_PORT_2 7.Node7_PORT_1


Connect WIRE 1.Node1_PORT_3 4.Node4_PORT_1


Connect WIRE 1.Node1_PORT_4 5.Node5_PORT_1


Connect WIRE 1.Node1_PORT_5 6.Node6_PORT_1


Connect WIRE 1.Node1_PORT_6 2.Node2_PORT_1


Connect WIRE 2.Node2_PORT_2 8.Node8_PORT_1




Run 30
