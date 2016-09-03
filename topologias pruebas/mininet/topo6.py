from mininet.topo import Topo

class Topo6( Topo ):

    def __init__( self ):
        "Create custom topo."

        # Initialize topology
        Topo.__init__( self )
		
		# Hosts
		hosts = [None]*121
		for i in range(1,121):
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
			for j in range(i*4-3,i*4+1):
				self.addLink( switchs[i], hosts[j] )
  

topos = { 'Topo6': ( lambda: Topo6() ) }