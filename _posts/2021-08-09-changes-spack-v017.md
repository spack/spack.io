---
layout: single
title: "Changes coming in Spack v0.17"
date: 2021-05-28 00:02:00
tags: release bootstrapping v0.17
---

# Introduction


## ASP-based solver and bootstrapping

Spack had some [software requirements](https://spack.readthedocs.io/en/latest/getting_started.html#prerequisites) since its first releases. Up to `v0.16` all of these prerequisites were considered to be _system requirements_ i.e. they were assumed to be present on the machines where Spack is run. The rationale was that most of the required software, like `patch` or `make`, is commonly found on `linux` or `darwin` systems supported by Spack.

With Spack `v0.17` the situation will change as the concretizer defaults to `clingo`. The [clingo](https://github.com/potassco/clingo) ASP-based solver will become a mandatory third-party dependency and cannot be assumed to be pre-installed on every system that runs Spack. As maintainers of the Spack package manager we had to make a choice on how to bootstrap this dependency in a way that doesn't hinder the usability of the tool for most users but still accounts for legitimate security concerns that some sites may have.

What we decided is that from `v0.17` on Spack will, by default, bootstrap some of its dependencies pulling them from a public [buildcache](https://spack.readthedocs.io/en/latest/binary_caches.html). The source code to create this buildcache is [hosted on Github](https://github.com/alalazo/spack-bootstrap-mirrors) in the account of a Spack core developer, and will soon be moved to the Spack organization. The bootstrapping procedure will be transparent to the final user, who will just experience a slightly slower execution of the first concretization where the binary packages are being pulled from the buildcache and verified by their sha 256 checksum:
```console
$ spack find -b
==> Showing internal bootstrap store at "/home/spack/.spack/bootstrap/store"
==> 0 installed packages

$ spack spec zlib
Input spec
--------------------------------
zlib

Concretized
--------------------------------
zlib@1.2.11%gcc@11.1.0+optimize+pic+shared arch=linux-ubuntu18.04-broadwell

$ spack find -b
==> Showing internal bootstrap store at "/home/spack/.spack/bootstrap/store"
==> 2 installed packages
-- linux-rhel5-x86_64 / gcc@9.3.0 -------------------------------
clingo-bootstrap@spack  python@3.6
```
In our opinion this default should preserve the "clone and run" simplicity in setting up Spack that our users got used to. 

To address the cases where security concerns don't allow pulling pre-built binaries, **users can opt-out of bootstrapping from binaries or disable bootstrapping entirely with a single command**. To disallow bootstrapping from binaries, but still permit Spack to bootstrap from sources, users can give the following command:
```console
$ spack bootstrap untrust github-actions
==> "github-actions" is now untrusted and will not be used for bootstrapping
```
To completely disable any bootstrapping procedure the command to give is:
```console
$ spack bootstrap disable
```
in which case it will be users responsibility to ensure all the required software is properly installed on their systems.
