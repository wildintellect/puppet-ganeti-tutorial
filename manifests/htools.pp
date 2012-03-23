class ganeti::htools {
    #require ganeti::params

    #$htools_version  = "${ganeti::params::htools_version}"

    package {
        "ghc6":                 ensure  => installed;
        "libghc6-json-dev":     ensure  => installed;
        "libghc6-network-dev":  ensure  => installed;
        "libghc6-parallel-dev": ensure  => installed;
        "libghc6-curl-dev":     ensure  => installed;
	  "ganeti-htools":	  ensure  => installed;
    }

}
