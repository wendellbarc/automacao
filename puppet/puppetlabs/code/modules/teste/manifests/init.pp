class teste {
	file{"/etc/puppetlabs/puppet/puppet.conf":
		source => "puppet:///modules/teste/puppet.conf",
		ensure => present,
	}

	service {'puppet':
		ensure => running,
		enable => true,
		subscribe => File['/etc/puppetlabs/puppet/puppet.conf']
	}
}
