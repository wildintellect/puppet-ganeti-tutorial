class ganeti::installganeti {
 #   require ganeti::params

 #   $ganeti_version = "${ganeti::params::ganeti_version}"

    package {["ganeti2","ganeti-htools"]:
            ensure  => installed,
    }
    service {
        "ganeti":
            enable      => true,
            require     => Package["ganeti2"],
    }
}

#class ganeti::ganeti::initialize inherits ganeti::ganeti::install {
#    exec {
#        "initialize-ganeti":
#            command => "/root/puppet/files/scripts/initialize-ganeti",
#            creates => "/var/lib/ganeti/config.data",
#            require => Exec["install-ganeti"],
#    }
#}
