![License](https://img.shields.io/badge/license-Apache%202-blue.svg)
# VSCode

#### Table of contents

1. [Overview](#overview)
2. [Supported Platforms](#supported-platforms)
3. [Requirements](#requirements)
4. [Installation](#installation)
5. [Usage](#usage)
6. [References](#references)
7. [Development](#development)

## Overview

This module will configure the repositories and install the Microsoft VS Code in your system.

## Supported Platforms

This module was tested under these platforms

- CentOS 7
- Debian 8
- Debian 9
- Ubuntu 17.10

Tested only in X86_64 arch.  

## Requirements

- Puppet >= 4.10.4

## Installation

Via git

    # cd /etc/puppetlabs/code/environment/production/modules
    # git clone https://github.com/igorolivei/puppet-vscode.git vscode

## Usage

### Quick run

    puppet apply -e "include vscode"

## References

### Classes

#### Public Classes

The `vscode` class has no parameters.

#### Private Classes

- `vscode::install`: Configure repositories and install the VS Code

## Development

### My dev environment

This module was developed using

- Puppet 4.10.10
    - Facter 2.4.6
- Ubuntu 17.10
- Vagrant 2.0.2 + VirtualBox 5.2.10
    - box: centos/7
    - box: debian/stretch64
    - box: debian/jessie64

### Author/Contributors

Igor Oliveira (igor.bezerra96@gmail.com)
