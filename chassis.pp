$redis_config = sz_load_config()

class { 'redis':
	path        => '/vagrant/extensions/redis',
	php_version => $redis_config[php]
}
