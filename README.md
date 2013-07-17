Puppet Autofs Module
====================

Introduction
------------

FIXME

## Usage ##

  include autofs

  autofs::map { 'home':
    key      => '*',
    prefix   => '/mnt/home',
    options  => '-fstype=nfs,rw',
    location => 'nfs.server:/srv/homes/&',
    order    => 0,
  }

  autofs::map { 'isos':
    key      => [ 'a', 'b', 'c' ],
    prefix   => '/mnt/isos',
    options  => '-fstype=nfs,rw',
    location => [ ':/srv/isos/aa.iso', ':/srv/isos/bb.iso', ':/srv/isos/cc.iso' ],
    order    => 1,
  }

  autofs::map { 'absolute':
    key      => [ '/media/a', '/media/b', '/media/c' ],
    prefix   => '/-',
    options  => '-fstype=nfs,rw',
    location => [ ':/srv/isos/aa.iso', ':/srv/isos/bb.iso', ':/srv/isos/cc.iso' ],
    order    => 1,
  }

FIXME

Notes
-----

FIXME

Requirements
------------

 * Module required: concat by ripiernaar
   [puppet-concat](https://github.com/ripienaar/puppet-concat.git)
 * If enable_motd is enabled (enable_motd => true) you'll need
   [puppet-motd](https://github.com/torian/puppet-motd.git)

TODO
----

FIXME

CopyLeft
---------

Copyleft (C) 2012 Emiliano Castagnari <ecastag@gmail.com> (a.k.a. Torian)

