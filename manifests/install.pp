class vscode::install {

  case $facts['os']['family'] {
    'RedHat': {
      yumrepo { 'vscode.repo':
        ensure   => present,
        enabled  => 1,
        descr    => 'VSCode repo',
        baseurl  => 'https://packages.microsoft.com/yumrepos/vscode',
        gpgcheck => 1,
        gpgkey   => 'https://packages.microsoft.com/keys/microsoft.asc',
      }

      package { 'code':
        ensure  => installed,
        require => [
          Yumrepo['vscode.repo'],
        ],
      }
    }

    'Debian': {
      wget::fetch {'Download Microsoft VS Code gpg key':
          source      => 'https://packages.microsoft.com/keys/microsoft.asc',
          destination => '/tmp/',
      }

      exec { 'gpg --dearmor /tmp/microsoft.asc':
        path    => ['/usr/bin', '/usr/sbin',],
        creates => '/tmp/microsoft.asc.gpg',
        require => [
          Wget::Fetch['Download Microsoft VS Code gpg key'],
        ]
      }

      file { '/etc/apt/trusted.gpg.d/microsoft.gpg':
        ensure  => present,
        source  => 'file:///tmp/microsoft.asc.gpg',
        require => [
          Exec['gpg --dearmor /tmp/microsoft.asc'],
        ]
      }

      apt::source { 'vscode':
        comment  => 'This is the official VSCode repository',
        location => 'https://packages.microsoft.com/repos/vscode',
        release  => 'stable',
        repos    => 'main',
        include  => {
          'deb' => true,
        },
      }

      package { 'code':
        ensure  => installed,
        require => [
          Apt::Source['vscode'],
        ],
      }
    }

    'Windows': {
      file { 'C:/tmp/VSCode.exe':
        ensure => file,
        source => 'https://az764295.vo.msecnd.net/stable/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/VSCodeSetup-ia32-1.23.0.exe',
      }

      package { 'code':
        ensure          => installed,
        source          => 'C:/tmp/VSCode.exe',
        install_options => ['/verysilent', { '/log' => 'C:\\VSCode-install.log', }],
        require         => File['C:/tmp/VSCode.exe'],
      }
    }

    default: {
      notify { 'OS not supported': }
    }
  }

}
