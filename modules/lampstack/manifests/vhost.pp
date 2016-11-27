define lampstack::vhost () {
	
	file { "/etc/apache2/sites-available/${title}.com.conf":
		content => template("apache/vhost.conf.erb"),
        }

	file { "/etc/apache2/sites-enabled/${title}.com.conf":
		ensure => "link",
		target => "../sites-available/${title}.com.conf",
	}
}
