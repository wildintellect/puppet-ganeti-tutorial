# Ganeti Installation

class ganeti {
    #require ganeti::params
    include ganeti::install_deps
    include ganeti::hosts
    include ganeti::drbd
    include ganeti::kvm
    inlcude ganeti::ganeti

    file {
        "/var/lib/ganeti":
            ensure  => directory;
        "/var/lib/ganeti/rapi/":
            require => File["/var/lib/ganeti"],
            ensure  => directory;
#        "/var/lib/ganeti/rapi/users":
#            ensure  => "present",
#            mode    => 640,
#            require => File["/var/lib/ganeti/rapi/"],
#            source  => "${ganeti::params::files}/rapi-users";
    }
}
