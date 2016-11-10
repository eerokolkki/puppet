class lampstack {
	package { "apache2": }
	package { "libapache2-mod-php7.0": }
	package { "php7.0": }
	package { "mysql-client": }
	package { "php-mysql": }
	package { "phpmyadmin":}

Package { ensure => "installed",
allowcdrom => true,
}
file { "/var/www/html/index.php":
content => template("lampstack/index.php"),
}
service { "apache2":
ensure => "running",
enable => "true",
provider => "systemd",
}
exec { "userdir":
        notify => Service["apache2"],
        command => "/usr/sbin/a2enmod userdir",
        require => Package["apache2"],
}
file { "/etc/apache2/mods-available/php7.0.conf":
	content =>template("lampstack/php7.0.conf"),
        notify => Service["apache2"],
}
file { "/etc/apache2/apache2.conf":
	content => template("lampstack/apache2.conf"),
        notify => Service["apache2"],
}
}
