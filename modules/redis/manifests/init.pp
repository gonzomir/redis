# A class to install Redis inside your Chassis box.
class redis (
	$config
) {
	if ( ! empty( $config[disabled_extensions] ) and 'chassis/redis' in $config[disabled_extensions] ) {
		$package = absent
	} else {
		$package = latest
	}
	package { 'redis-server':
		ensure => $package
	}

    if versioncmp( $config[php], '5.6' ) < 0 {
        package { 'php5-redis':
            ensure  => $package,
            require => Package['php5-fpm'],
            notify  => Service['php5-fpm'],
        }
    } else {
        package { "php${config[php]}-redis":
          ensure  => $package,
          require => Package["php${config[php]}-fpm"],
          notify  => Service["php${config[php]}-fpm"],
        }
    }
}
