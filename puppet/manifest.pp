
$instalar = ["fliget","vim"]
$remover = ["ccze","htop"]



package { $instalar:
	ensure => absent,
}


package { $remover:
        ensure => absent,
}


exec { "memoria_free":
        command => "/usr/bin/free -h > /root/memfree",
}

file { "/tmp/memfree":
	source => "/root/memfree",
        ensure => "present",
}

