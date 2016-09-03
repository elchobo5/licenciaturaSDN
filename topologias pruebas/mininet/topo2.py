from mininet.topo import Topo

class Topo2( Topo ):

    def __init__( self ):
        "Create custom topo."

        # Initialize topology
        Topo.__init__( self )
		
		# Hosts
		hosts = [None]*41
		for i in range(1,101):
			hosts[i] = self.addHost( 'h' + str(i) )

		# Switchs
		switchs = [None]*21
		for i in range(1,51):
			switchs[i] = self.addSwitch( 's' + str(i) )
		

		# Add links
		for i in range(1,20):
			for j in range(i+1,20+1):
				self.addLink( switchs[i], switchs[j] )
				
		for i in range(1,21):
			for j in range(i*2-1,i*2+1):
				self.addLink( switchs[i], hosts[j] )
  

topos = { 'Topo2': ( lambda: Topo2() ) }