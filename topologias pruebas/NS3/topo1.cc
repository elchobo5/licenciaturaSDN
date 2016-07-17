#include <iostream>
#include <fstream>
#include <time.h>

#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/csma-module.h"
#include "ns3/internet-module.h"
#include "ns3/applications-module.h"
#include "ns3/openflow-module.h"
#include "ns3/log.h"

using namespace ns3;

NS_LOG_COMPONENT_DEFINE ("OpenFlowCsmaSwitchExample");

bool verbose = false;
bool use_drop = false;
ns3::Time timeout = ns3::Seconds (0);

bool
SetVerbose (std::string value)
{
  verbose = true;
  return true;
}

bool
SetDrop (std::string value)
{
  use_drop = true;
  return true;
}

bool
SetTimeout (std::string value)
{
  try {
      timeout = ns3::Seconds (atof (value.c_str ()));
      return true;
    }
  catch (...) { return false; }
  return false;
}

int
main (int argc, char *argv[])
{
  #ifdef NS3_OPENFLOW
  //
  // Allow the user to override any of the defaults and the above Bind() at
  // run-time, via command-line arguments
  //
  clock_t tStart = clock();
  CommandLine cmd;
  cmd.AddValue ("v", "Verbose (turns on logging).", MakeCallback (&SetVerbose));
  cmd.AddValue ("verbose", "Verbose (turns on logging).", MakeCallback (&SetVerbose));
  cmd.AddValue ("d", "Use Drop Controller (Learning if not specified).", MakeCallback (&SetDrop));
  cmd.AddValue ("drop", "Use Drop Controller (Learning if not specified).", MakeCallback (&SetDrop));
  cmd.AddValue ("t", "Learning Controller Timeout (has no effect if drop controller is specified).", MakeCallback ( &SetTimeout));
  cmd.AddValue ("timeout", "Learning Controller Timeout (has no effect if drop controller is specified).", MakeCallback ( &SetTimeout));

  cmd.Parse (argc, argv);

  if (verbose)
    {
      LogComponentEnable ("OpenFlowCsmaSwitchExample", LOG_LEVEL_INFO);
      LogComponentEnable ("OpenFlowInterface", LOG_LEVEL_INFO);
      LogComponentEnable ("OpenFlowSwitchNetDevice", LOG_LEVEL_INFO);
    }

  //
  // Explicitly create the nodes required by the topology (shown above).
  //
  NS_LOG_INFO ("Create nodes.");
  NodeContainer terminals;
  terminals.Create (20);

  NodeContainer csmaSwitch;
  csmaSwitch.Create (10);

  NS_LOG_INFO ("Build Topology");
  CsmaHelper csma;
  csma.SetChannelAttribute ("DataRate", DataRateValue (5000000));
  csma.SetChannelAttribute ("Delay", TimeValue (MilliSeconds (2)));
  
  //crear links entre switchs
  NetDeviceContainer switchDevices[10];
  for (int i = 0; i < 10; i++)
  {
      for (int j = i+1; j < 10; j++)
	  {
		NetDeviceContainer link = csma.Install (NodeContainer (csmaSwitch.Get (i), csmaSwitch.Get (j)));
		switchDevices[i].Add (link.Get (0));
		switchDevices[j].Add (link.Get (1));
	  }
  }
  
  // Create the csma links, from each terminal to the switch
  NetDeviceContainer terminalDevices;
  
  for (int i = 0; i < 10; i++)
  {
      NetDeviceContainer link = csma.Install (NodeContainer (terminals.Get (i*2), csmaSwitch.Get (i)));
      terminalDevices.Add (link.Get (0));
      switchDevices[i].Add (link.Get (1));
	  
	  NetDeviceContainer link2 = csma.Install (NodeContainer (terminals.Get ((i*2)+1), csmaSwitch.Get (i)));
      terminalDevices.Add (link2.Get (0));
      switchDevices[i].Add (link2.Get (1));
  }

  // Create the switch netdevice, which will do the packet switching
  //Ptr<ns3::ofi::DropController> controller = NULL;
  Ptr<ns3::ofi::LearningController> controller = CreateObject<ns3::ofi::LearningController> ();
  if (!timeout.IsZero ()) controller->SetAttribute ("ExpirationTime", TimeValue (timeout));
  OpenFlowSwitchHelper swtch;
  for (int i = 0; i < 10; i++)
  {
	  Ptr<Node> switchNode = csmaSwitch.Get (i);
	  swtch.Install (switchNode, switchDevices[i], controller);
  }
   
  // Add internet stack to the terminals
  InternetStackHelper internet;
  internet.Install (terminals);

  // We've got the "hardware" in place.  Now we need to add IP addresses.
  NS_LOG_INFO ("Assign IP Addresses.");
  Ipv4AddressHelper ipv4;
  ipv4.SetBase ("10.1.1.0", "255.255.255.0");
  ipv4.Assign (terminalDevices);


  //
  // Now, do the actual simulation.
  //
  NS_LOG_INFO ("Run Simulation.");
  Simulator::Run ();
  printf("Time create: %.2fs\n", (double)(clock() - tStart)/CLOCKS_PER_SEC);
  tStart = clock();
  Simulator::Destroy ();
  printf("Time destroy: %.2fs\n", (double)(clock() - tStart)/CLOCKS_PER_SEC);
  NS_LOG_INFO ("Done.");
  #else
  NS_LOG_INFO ("NS-3 OpenFlow is not enabled. Cannot run simulation.");
  #endif // NS3_OPENFLOW
}
