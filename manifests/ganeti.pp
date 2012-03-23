class ganeti::install {
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
