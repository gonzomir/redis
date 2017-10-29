class redis (
	$path         = "/vagrant/extensions/redis",
	$php_version  = $::redis_config[php]
) {
	package { 'redis-server':
		ensure => latest
	}
	
    if versioncmp( "${php_version}", '5.6' ) < 0 {
        package { 'php5-redis':
            ensure  => latest,
            require => Package['php5-redis'],
            notify  => Service["php5-fpm"],
        }
    } else {
        package { 'php-redis':
          ensure  => latest,
          require => Package["php${php_version}-fpm"],
          notify  => Service["php${php_version}-fpm"],
        }
    }
}
