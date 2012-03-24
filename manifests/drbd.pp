class ganeti::drbd {
    package {
        "drbd8-utils":
            ensure  => installed,
    }

    file {
        "/etc/modules":
            ensure  => present,
            source  => "puppet:///modules/ganeti/files/modules",
    }

    service {
        "drbd":
           enable   => false,
           require  => Package["drbd8-utils"],
    }
}
