class ganeti::ganeti::install {
    require ganeti::params

    $ganeti_version = "${ganeti::params::ganeti_version}"

    file {
        "/etc/init.d/ganeti":
            ensure  => present,
            require => Exec["install-ganeti"],
            source  => "/root/src/ganeti-${ganeti_version}/doc/examples/ganeti.initd",
            mode    => 755,
    }

#    ganeti::unpack {
#        "ganeti":
#            source      => "/root/src/ganeti-${ganeti_version}.tar.gz",
#            cwd         => "/root/src/",
#            creates     => "/root/src/ganeti-${ganeti_version}",
#            require     => File["/root/src"];
#    }

#    exec {
#        "install-ganeti":
#            command => "/root/puppet/files/scripts/install-ganeti",
#            cwd     => "/root/src/ganeti-${ganeti_version}",
#            creates => "/usr/local/sbin/gnt-cluster",
#            require => ganeti::Unpack["ganeti"];
#    }

    service {
        "ganeti":
            enable      => true,
            require     => File["/etc/init.d/ganeti"],
    }
}

class ganeti::ganeti::initialize inherits ganeti::ganeti::install {
    exec {
        "initialize-ganeti":
            command => "/root/puppet/files/scripts/initialize-ganeti",
            creates => "/var/lib/ganeti/config.data",
            require => Exec["install-ganeti"],
    }
}
