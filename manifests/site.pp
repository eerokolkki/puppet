class { "lampstack":}
Lampstack::Vhost {
notify => Service["apache2"],
}
lampstack::vhost {"eerokolkki":}
lampstack::vhost {"pulla":}

class { "mysql::server":
 root_password => "K4l4kukk0",
}
class { "ssh1":}
class { "tausta":}
