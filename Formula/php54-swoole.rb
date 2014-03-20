require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php54Swoole < AbstractPhp54Extension
  init
  homepage 'https://github.com/matyhtf/swoole'
  url 'http://pecl.php.net/get/swoole-1.6.11.tgz'
  sha1 '67ab2c3d8d1657183c0d796956b2a7927aa72843'
  head 'https://github.com/matyhtf/swoole.git'

  def install
    Dir.chdir "swoole-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/swoole.so"
    write_config_file unless build.include? "without-config-file"
  end
end
