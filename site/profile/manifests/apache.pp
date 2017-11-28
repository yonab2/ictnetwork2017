class profile::web {
class { 'apache':
    serverroot                  => '"/etc/httpd"',
    listen                      => [ '70' ],
    user                        => 'apache',
    group                       => 'apache',
    serveradmin                 => 'root@localhost',
    servername                  => 'www.example.com',
}
