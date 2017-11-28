# eyplib

![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What eyplib affects](#what-eyplib-affects)
    * [Setup requirements](#setup-requirements)
4. [Usage](#usage)
5. [Reference](#reference)
6. [Development](#development)
    * [Contributing](#contributing)

## Overview

Standard library of resources for Puppet modules.

## Module Description

Contains common functions for eyp modules

## Setup

Installing the eyplib module adds the functions, facts, and resources of this standard library to Puppet.

### What eyplib affects

After you've installed eyplib, all of its functions, facts, and resources are already available.

### Setup Requirements

Requires pluginsync enabled

## Usage

Just add a dependency on your metadata.json file, for example:

```json
"dependencies": [
  {"name":"puppetlabs/stdlib","version_requirement":">= 4.6.0"},
  {"name":"puppetlabs/concat","version_requirement":">= 1.2.3"},
  {"name":"eyp/eyplib","version_requirement":">= 0.1.0 < 0.2.0"}
],
```

in ERB files you can call this module's functions using:

```erb
<%= scope.function_bool2onoff([@trace]) %>
```

## Reference

### functions

#### bool2onoff

Transform a boolean (it can also be a string) to **On** or **Off**. Other values through.

#### bool2yesno

Transform a boolean (it can also be a string) to **yes** or **no**. Other values through.

#### bool2httpd

Same as **bool2onoff**, transform a boolean (it can also be a string) to **On** or **Off**. Other values through.

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
