node "default" {
	include teste
}

node /(devops|automation)/ {
	include base
}




node docker {

	include mr_miracle
	include docker
}
