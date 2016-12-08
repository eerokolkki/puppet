class tausta {
        file {"/usr/share/xfce4/backdrops/eero.jpg":
              source =>"puppet:///modules/tausta/eero.jpg",
        }
        file {"/usr/share/xfce4/backdrops/xubuntu-wallpaper.png":
              ensure => "link",
              target => "/usr/share/xfce4/backdrops/eero.jpg",
              notify => Service ["lightdm"],
        }
        service {"lightdm":
        ensure => "running",
        enable => "true",
        provider => "systemd",
    }
}
