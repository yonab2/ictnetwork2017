# APACHE Module

## Overview

This module install and configure apache web server.

## Usage

Default configuration:

```puppet
include apache
```

Change configuration file settings:

```puppet
class { 'apache':
    serverroot                  => '"/etc/httpd"',
    listen                      => [ '80' ],
    user                        => 'apache',
    group                       => 'apache',
    serveradmin                 => 'root@localhost',
    servername                  => 'www.example.com',
    directory                   => {
      '/' => [
        'AllowOverride none',
        'Require all denied'
      ],
      '"/var/www"' => [
        'AllowOverride None',
        'Require all granted'
      ],
      '"/var/www/html"' => [
        'Options Indexes FollowSymLinks',
        'AllowOverride None',
        'Require all granted'
      ],
      '"/var/www/cgi-bin"' => [
        'AllowOverride None',
        'Options None',
        'Require all granted'
      ],
      '"/usr/share/httpd/icons"' => [
        'Options Indexes MultiViews FollowSymlinks',
        'AllowOverride None',
        'Require all granted'
      ],
      '"/home/*/public_html"' => [
        'AllowOverride FileInfo AuthConfig Limit Indexes',
        'Options MultiViews Indexes SymLinksIfOwnerMatch IncludesNoExec',
        'Require method GET POST OPTIONS'
      ]
    },
    documentroot                => '"/var/www/html"',
    directoryindex              => 'index.html',
    files                       => {
      '".ht*"' => [
        'Require all denied'
      ]
    },
    errorlog                    => '"logs/error_log"',
    log_level                   => 'warn',
    logformat                   => [ '"%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined', '"%h %l %u %t \"%r\" %>s %b" common', '"%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio' ],
    customlog                   => '"logs/access_log" combined',
    alias                       => '/icons/ "/usr/share/httpd/icons/"',
    scriptalias                 => '/cgi-bin/ "/var/www/cgi-bin/"',
    typesconfig                 => '/etc/mime.types',
    addtype                     => [ 'application/x-compress .Z', 'application/x-gzip .gz .tgz', 'text/html .shtml' ],
    addoutputfilter             => 'INCLUDES .shtml',
    adddefaultcharset           => 'UTF-8',
    mimemagicfile               => 'conf/magic',
    enablesendfile              => 'on',
    servertokens                => 'Prod',
    timeout                     => '60',
    keepalivetimeout            => '15',
    userdir                     => 'disabled',
    serversignature             => 'Off',
    addiconbyencoding           => '(CMP,/icons/compressed.gif) x-compress x-gzip',
    addiconbytype               => [ '(TXT,/icons/text.gif) text/*', '(IMG,/icons/image2.gif) image/*', '(SND,/icons/sound2.gif) audio/*', '(VID,/icons/movie.gif) video/*' ],
    addicon                     => [ '/icons/binary.gif .bin .exe', '/icons/binhex.gif .hqx', '/icons/tar.gif .tar', '/icons/world2.gif .wrl .wrl.gz .vrml .vrm .iv', '/icons/compressed.gif .Z .z .tgz .gz .zip', '/icons/a.gif .ps .ai .eps', '/icons/layout.gif .html .shtml .htm .pdf', '/icons/text.gif .txt', '/icons/c.gif .c', '/icons/p.gif .pl .py', '/icons/f.gif .for', '/icons/dvi.gif .dvi', '/icons/uuencoded.gif .uu', '/icons/script.gif .conf .sh .shar .csh .ksh .tcl', '/icons/tex.gif .tex', '/icons/bomb.gif /core', '/icons/bomb.gif */core.*', '/icons/back.gif ..', '/icons/hand.right.gif README', '/icons/folder.gif ^^DIRECTORY^^', '/icons/blank.gif ^^BLANKICON^^' ],
    defaulticon                 => '/icons/unknown.gif',
    readmename                  => 'README.html',
    headername                  => 'HEADER.html',
    indexignore                 => '.??* *~ *# HEADER* README* RCS CVS *,v *,t',
    fileetag                    => 'None',
    include                     => [ 'conf.modules.d/*.conf' ],
    includeoptional             => [ 'conf.d/*.conf', 'sites-enabled/*.conf' ],
}
```

Create virtualhost:

```puppet
apache::virtualhost { 'example.com.conf':
    filename              => 'example.com.conf',
    listen                => '*:80',
    serveradmin           => 'admin@example.com',
    documentroot          => '/var/www/example.com/public_html/',
    servername            => 'example.com',
    serveralias           => 'www.example.com',
    errorlog              => 'logs/example.com-error.log',
    customlog             => 'logs/example.com-access.log combined',
}
```

Modsecurity customisation:

```puppet
class { 'apache::modsecurity':
    includeoptional             => [ 'modsecurity.d/*.conf', 'modsecurity.d/activated_rules/*.conf' ],
    secruleengine               => 'On',
    secrequestbodyaccess        => 'On',
    secrequestbodylimit         => '13107200',
    secrequestbodynofileslimit  => '131072',
    secrequestbodyinmemorylimit => '131072',
    secrequestbodylimitaction   => 'Reject',
    secpcrematchlimit           => '1000',
    secpcrematchlimitrecursion  => '1000',
    secresponsebodyaccess       => 'On',
    secdebuglog                 => '/var/log/httpd/modsec_debug.log',
    secdebugloglevel            => '0',
    secauditengine              => 'RelevantOnly',
    secauditlogrelevantstatus   => '"^(?:5|4(?!04))"',
    secauditlogparts            => 'ABIJDEFHZ',
    secauditlogtype             => 'Serial',
    secauditlog                 => '/var/log/httpd/modsec_audit.log',
    secargumentseparator        => '&',
    seccookieformat             => '0',
    sectmpdir                   => '/var/lib/mod_security',
    secdatadir                  => '/tmp',
    secresponsebodymimetype     => 'text/plain text/html text/xml application/octet-stream',
}
```

Modevasive customisation:

```puppet
class { 'apache::modevasive':
    dosemailnotify         => 'admin@example.com',
    dospagecount           => '2',
    dossitecount           => '50',
    dosblockingperiod      => '10',
    doslogdir              => '/var/log/mod_evasive',
    doswhitelist           => [ '127.0.0.1', '192.168.0.*' ],
}
```

