class ganeti::networking {
    file { "/etc/network/interfaces":
        ensure  => present,
        content => template("ganeti/interfaces.erb"),
    }
}
