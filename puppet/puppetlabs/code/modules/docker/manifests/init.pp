class docker {
	case $::osfamily{
		"debian":{
			exec{'Atualização_Repositorios':
				command => "/usr/bin/apt update"
			}
			
			$distro_name = $facts['os']['distro']['codename']
			$pacotes = ['apt-transport-https','ca-certificate','curl','software-properties-common']
			$repositorio = "/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | /usr/bin/apt-key add - ; /usr/bin/add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu $distro_name stable' ; /usr/bin/apt update"
		}

		"redhat":{
			$pacotes = ['yum-utils','device-mapper-persistent-dat','lvm2']
			$repositorio = "/bin/yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo" 
		}
	}

	package{$pacotes:
		ensure => present
	}

	exec{"Adicionando_Repositorios":
		command => $repositorio
	}


	package{'docker-ce':
		ensure => present
	}

	service{'docker':
		ensure => running,
		enable => true,
		require => Package['docker-ce']
	}
	
}
