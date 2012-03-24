class ganeti::hosts {
    host {
        "ganeti.des.ucdavis.edu":
            ensure          => present,
            host_aliases    => "ganeti",
            ip              => "169.237.167.49";
        "ice1.des.ucdavis.edu":
            ensure          => present,
            host_aliases    => "ice1",
            ip              => "169.237.167.49";
        "ice2.des.ucdavis.edu":
            ensure          => present,
            host_aliases    => "ice2",
            ip              => "169.237.167.50";
	  "ice1drbd.des.ucdavis.edu":
            ensure          => present,
            host_aliases    => "ice1drbd",
            ip              => "192.168.167.49";
        "ice2drbd.des.ucdavis.edu":
            ensure          => present,
            host_aliases    => "ice2drbd",
            ip              => "192.168.167.50";
            }

}
