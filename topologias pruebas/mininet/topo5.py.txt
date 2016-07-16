from mininet.topo import Topo

class Topo5( Topo ):

    def __init__( self ):
        "Create custom topo."

        # Initialize topology
        Topo.__init__( self )
		
		# Hosts
		hosts = [None]*61
		for i in range(1,61):
			hosts[i] = self.addHost( 'h' + str(i) )

		# Switchs
		switchs = [None]*31
		for i in range(1,31):
			switchs[i] = self.addSwitch( 's' + str(i) )
		

		# Add links
		for i in range(1,30):
			self.addLink( switchs[i], switchs[i+1] )
		
		self.addLink( switchs[1], switchs[30] )		
		for i in range(1,31):
			for j in range(i*2-1,i*2+1):
				self.addLink( switchs[i], hosts[j] )
  

topos = { 'Topo5': ( lambda: Topo5() ) }