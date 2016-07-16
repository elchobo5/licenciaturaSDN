from mininet.topo import Topo

class Topo1( Topo ):

    def __init__( self ):
        "Create custom topo."

        # Initialize topology
        Topo.__init__( self )
		
		# Hosts
		hosts = [None]*21
		for i in range(1,21):
			hosts[i] = self.addHost( 'h' + str(i) )

		# Switchs
		switchs = [None]*11
		for i in range(1,11):
			switchs[i] = self.addSwitch( 's' + str(i) )
		

		# Add links
		for i in range(1,10):
			for j in range(i+1,10+1):
				self.addLink( switchs[i], switchs[j] )
				
		for i in range(1,11):
			for j in range(i*2-1,i*2+1):
				self.addLink( switchs[i], hosts[j] )
  

topos = { 'Topo1': ( lambda: Topo1() ) }