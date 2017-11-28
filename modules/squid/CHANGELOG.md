# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v0.6.1](https://github.com/voxpupuli/puppet-squid/tree/v0.6.1) (2017-11-15)

[Full Changelog](https://github.com/voxpupuli/puppet-squid/compare/v0.6.0...v0.6.1)

**Merged pull requests:**

- add missing secret to travis config [\#71](https://github.com/voxpupuli/puppet-squid/pull/71) ([bastelfreak](https://github.com/bastelfreak))
- release 0.6.0 [\#70](https://github.com/voxpupuli/puppet-squid/pull/70) ([bastelfreak](https://github.com/bastelfreak))

## [v0.6.0](https://github.com/voxpupuli/puppet-squid/tree/v0.6.0) (2017-11-15)

[Full Changelog](https://github.com/voxpupuli/puppet-squid/compare/v0.5.0...v0.6.0)

**Breaking changes:**

- Convert to puppet 4/5 data types [\#58](https://github.com/voxpupuli/puppet-squid/pull/58) ([matonb](https://github.com/matonb))

**Implemented enhancements:**

- added debian 9 param defaults [\#60](https://github.com/voxpupuli/puppet-squid/pull/60) ([ssanden](https://github.com/ssanden))
- When specifying the extra\_config\_sections as an array [\#45](https://github.com/voxpupuli/puppet-squid/pull/45) ([ralfbosz](https://github.com/ralfbosz))

**Merged pull requests:**

- Fix the tests [\#67](https://github.com/voxpupuli/puppet-squid/pull/67) ([ekohl](https://github.com/ekohl))
- Clean up docs [\#62](https://github.com/voxpupuli/puppet-squid/pull/62) ([alexharv074](https://github.com/alexharv074))
- Add refresh\_pattern defined type [\#57](https://github.com/voxpupuli/puppet-squid/pull/57) ([matonb](https://github.com/matonb))
- Use ruby 2.4.1 for beaker tests [\#56](https://github.com/voxpupuli/puppet-squid/pull/56) ([traylenator](https://github.com/traylenator))
- Modulesync 0.21.3 [\#55](https://github.com/voxpupuli/puppet-squid/pull/55) ([traylenator](https://github.com/traylenator))

## [v0.5.0](https://github.com/voxpupuli/puppet-squid/tree/v0.5.0) (2017-03-30)

* Add beaker acceptance tests
* An optional $comment param for http_access and acl (#47)
* Add support for freebsd

## 2017-01-12 - Release 0.4.0

Last release with Puppet 3 support!
* Fix minor syntax issue in README example code
* rubocop: fix RSpec/ImplicitExpect
* adds logformat directive to squid.conf header
* adds test for ::logformat parameter
* Added ssl_bump and sslproxy_cert_error support
* Added support for icp_access Squid conf setting
* Fix ordering issue with missing squid user for cache_dir

## 2016-09-19 - Release 0.3.0
* Add `https_port` defined type.
* Add `extra_config_section` permits extra random configuration.
* The `auth_params` defintions now appear before ACLs as it should.
* New parameters to specify owner of configuration,  daemon name
  and  executer to control cache directory.
* Addition of debian and ubuntu support.

## 2016-06-01 - Release 0.2.2
* Correct documentation examples.

## 2016-06-01 - Release 0.2.1

* All defined types can now be loaded as a hash to *init* and
  so can be loaded easily from hiera.
  e.g
```
class{'squid:
   http_ports => {'10000' =>  { options => 'accel vhost'},
                  '3000'  => {},
                 }
```

## 2016-04-18 - Release 0.1.1

* Add tags to module metadata.

## 2016-04-13 - Release 0.1.0


\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*