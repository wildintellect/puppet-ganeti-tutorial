class ganeti::instance_image {
    require ganeti::params

    $image_version  = "${ganeti::params::image_version}"
    $debian_version = "${ganeti::params::debian_version}"

    package {
        #"qemu-utils":       ensure => installed;
        "dump":             ensure => installed;
        "kpartx":           ensure => installed;
    }

    file {
        "/etc/default/ganeti-instance-image":
            ensure  => present,
            require => Exec["install-instance-image"],
            content => template("ganeti/instance-image/defaults.erb");
        "/etc/ganeti/instance-image/variants.list":
            ensure  => present,
            require => Exec["install-instance-image"],
            source  => "${ganeti::params::files}/instance-image/variants.list";
        "/etc/ganeti/instance-image/variants/debian-lenny.conf":
            ensure  => present,
            require => Exec["install-instance-image"],
            source  => "${ganeti::params::files}/instance-image/debian-lenny.conf";
        "/etc/ganeti/instance-image/hooks/interfaces":
            mode    => 755,
            require => Exec["install-instance-image"];
        "/etc/ganeti/instance-image/hooks/zz_no-net":
            ensure  => present,
            mode    => 755,
            require => Exec["install-instance-image"],
            source  => "${ganeti::params::files}/instance-image/hooks/zz_no-net";
    }

    ganeti::wget {
        "debian-boot":
            require     => Exec["install-instance-image"],
            source      => "http://staff.osuosl.org/~ramereth/ganeti-tutorial/debian-${debian_version}-${hardwaremodel}-boot.dump",
            destination => "/var/cache/ganeti-instance-image/debian-${debian_version}-${hardwaremodel}-boot.dump";
        "debian-root":
            require     => Exec["install-instance-image"],
            source      => "http://staff.osuosl.org/~ramereth/ganeti-tutorial/debian-${debian_version}-${hardwaremodel}-root.dump",
            destination => "/var/cache/ganeti-instance-image/debian-${debian_version}-${hardwaremodel}-root.dump";
    }

    ganeti::unpack {
        "instance-image":
            source      => "/root/src/ganeti-instance-image-${image_version}.tar.gz",
            cwd         => "/root/src/",
            creates     => "/root/src/ganeti-instance-image-${image_version}",
            require     => File["/root/src"];
    }

    exec {
        "install-instance-image":
            command => "/root/puppet/files/scripts/install-instance-image",
            cwd     => "/root/src/ganeti-instance-image-${image_version}",
            creates => "/srv/ganeti/os/image/",
            require => [ Ganeti_tutorial::Unpack["instance-image"], 
                Package["dump"], Package["kpartx"], File["/root/puppet"], ];
    }
}
