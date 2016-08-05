class redis (
	$path = "/vagrant/extensions/redis"
) {
	package { 'redis-server':
		ensure => latest
	}
	
	package { 'php5-redis':
		ensure  => latest,
		require => Package['redis-server'],
		notify  => Service['php5-fpm']
	}
}
