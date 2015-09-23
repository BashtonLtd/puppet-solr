# == Class: solr::params
# This class sets up some required parameters
#
# === Actions
# - Specifies jetty and solr home directories
# - Specifies the default core
#
class solr::params {

  case $::operatingsystem {
    'Debian': {
      case $::operatingsystemmajrelease {
        '8': {
          $jetty = 'jetty8'
        }
        default: {
          $jetty = undef
        }
      }
    }
    'Ubuntu': {
      $jetty = 'jetty'
    }
    default: {
      $jetty = undef
    }
  }

  $jetty_home    = "/usr/share/${jetty}"
  $jetty_port    = '8983'
  $solr_home     = '/usr/share/solr'
  $solr_version  = '4.7.2'
  $mirror_site   = 'https://www.apache.org/dist/lucene/solr'
  $data_dir      = '/var/lib/solr'
  $cores         = ['default']
  $dist_root     = '/tmp'
}
