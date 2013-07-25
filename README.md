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
    }

    autofs::map { 'isos':
      key      => [ '/mnt/a', '/mnt/b', '/mnt/c' ],
      prefix   => '/-',
      options  => '-fstype=nfs,rw',
      location => [ ':/srv/isos/aa.iso', ':/srv/isos/bb.iso', ':/srv/isos/cc.iso' ],
    }

FIXME

Notes
-----

FIXME

Requirements
------------

 * If enable_motd is enabled (enable_motd => true) you'll need
   [puppet-motd](https://github.com/torian/puppet-motd.git)

TODO
----

FIXME

CopyLeft
---------

Copyleft (C) 2012 Emiliano Castagnari <ecastag@gmail.com> (a.k.a. Torian)

