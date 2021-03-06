# == Class: scala::params
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 2013 smarchive GmbH
#
class scala::params {
  $os_package_format = $::osfamily ? {
    'RedHat' => 'rpm',
    'Debian' => 'deb',
    default  => fail('Unsupported OS family'),
  }

  $package_format = $::scala_package_format ? {
    undef   => $os_package_format,
    default => $::scala_package_format,
  }

  $version = $::scala_version ? {
    undef   => '2.10.1',
    default => $::scala_version,
  }

  $url = $::scala_url ? {
    undef   => "http://www.scala-lang.org/downloads/distrib/files/scala-${version}.${package_format}",
    default => $::scala_url,
  }
}
