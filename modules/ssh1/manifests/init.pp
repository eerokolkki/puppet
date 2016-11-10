class ssh1 {
package { ssh:
ensure => "installed",
}
exec { "sudo ufw enable":
path => "/bin/:/usr/bin/:/sbin/:/usr/sbin/",
unless => 'sudo ufw status verbose|grep "Status: active"',
}
exec { "sudo ufw allow 2222/tcp":
path => "/bin/:/usr/bin/:/sbin/:/usr/sbin/",
unless => "ufw status verbose|grep 2222/tcp",
}
file { "/etc/ssh/sshd_config":
content => template("ssh1/sshd_config"),
notify => Service["ssh"],
}
service { "ssh":
ensure => "running",
enable => "true",
provider => "systemd",
}
}
