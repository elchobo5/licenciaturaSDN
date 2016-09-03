from mininet.topo import Topo

class Topo7( Topo ):

    def __init__( self ):
        "Create custom topo."

        # Initialize topology
        Topo.__init__( self )
		
		# Hosts
		hosts = [None]*301
		for i in range(1,301):
			hosts[i] = self.addHost( 'h' + str(i) )

		# Switchs
		switchs = [None]*51
		for i in range(1,51):
			switchs[i] = self.addSwitch( 's' + str(i) )
		

		# Add links
		for i in range(1,50):
			self.addLink( switchs[i], switchs[i+1] )
		
		self.addLink( switchs[1], switchs[50] )		
		for i in range(1,51):
			for j in range(i*6-5,i*6+1):
				self.addLink( switchs[i], hosts[j] )
  

topos = { 'Topo7': ( lambda: Topo7() ) }