class ganeti::install_deps {
    package {
        # Ganeti deps
        "lvm2":             ensure => installed;
        "bridge-utils":     ensure => installed;
        "iproute":          ensure => installed;
        "iputils-arping":   ensure => installed;
        "ndisc6":           ensure => installed;
        "python-openssl":   ensure => installed;
        "openssl":          ensure => installed;
        "python-pyparsing": ensure => installed;
        "python-simplejson": ensure => installed;
        "python-pyinotify": ensure => installed;
        "python-pycurl":    ensure => installed;
        "socat":            ensure => installed;
        "python-paramiko":  ensure => installed;
        # Misc
        "git":              ensure => installed;
    }

    file {
        "/root/src":
            ensure  => present,
            source  => "/etc/puppet/modules/ganeti/files/src/",
            recurse => true;
    }
}
