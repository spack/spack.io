---
title: "Changes to bootstrapping in Spack v0.17"
author: Massimiliano Culpo
date: "2021-08-13"
---

Starting with Spack `v0.17`, the new concretizer will be the default, and Spack will automatically
install a new dependency (Clingo) from binaries. You can optionally disable this bootstrapping.

## Spack and its own dependencies

Since its earliest releases, Spack has had
[software requirements](https://spack.readthedocs.io/en/latest/getting_started.html#prerequisites),
and we've tried to restrict them to very basic system requirements that you'd find on most
machines. A compiler, `patch`, `make`, etc. are commonly found on at least Linux and macOS systems,
and we've expected users to make them available themselves.

With Spack `v0.16`, we introduced an option to use a new concretizer (dependency solver), which is
based on [Clingo](https://github.com/potassco/clingo) under the hood. Clingo is a very powerful
*Answer Set Programming* system -- it lets us solve the complex constraint problems among Spack
packages -- all the versions, conflicts, feature requirements, optional dependencies, and
compiler/target compatibility issues are now handled by Clingo
([more here](https://archive.fosdem.org/2020/schedule/event/dependency_solving_not_just_sat/)).
Using Clingo, we've been able to handle much more complex Spack environments, and we've been able
to fix issues where the old, greedy concretizer would fail on concretizable specs, or where it
would just make incorrect decisions. The new concretizer is more maintainable and allows us to
[develop features rapidly](https://github.com/spack/spack/pulls?q=is%3Apr+label%3Aconcretization+is%3Aclosed).
It will enable us to more aggressively
[reuse dependencies](https://github.com/spack/spack/pull/25310) and to model more complex software
relationships in the future.

## We're making the new concretizer the default

In Spack `v0.17`, we will make the new concretizer the default, but that means that Clingo will be
a prerequisite, and it is not something most people will have installed by default. However, we
want Spack to be just as usable out of the box after this change. In particular, we want `spack
install` to work immediately after you clone Spack, just like it did before.

## And we're bootstrapping it from binaries

What we decided is that from `v0.17` on Spack will, by default, install some of its dependencies
from a public [buildcache](https://spack.readthedocs.io/en/latest/binary_caches.html) of portable
binaries. The source code we use to create this buildcache is open and
[hosted on GitHub](https://github.com/alalazo/spack-bootstrap-mirrors). The bootstrapping procedure
will be transparent -- the first concretization you do will just be slightly slower while the
binary packages are fetched from the buildcache and verified by their SHA256 checksum. It looks
like this:

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

This default should preserve the "clone and run" simplicity in setting up Spack that you're used
to.

## What if I don't want to use Spack's binaries?

For those of you who do not want to use our public binaries, you can **opt out of bootstrapping**,
and Clingo will be built from source instead. To disallow bootstrapping from binaries, but still
permit Spack to bootstrap from sources, just run:

```console
$ spack bootstrap untrust github-actions
==> "github-actions" is now untrusted and will not be used for bootstrapping
```

To completely disable any bootstrapping, you can run:

```console
$ spack bootstrap disable
```

If you do this, you'll need to ensure for yourself that Spack's prerequisites are properly
installed. You can use this option, for example, if you know that Clingo is already installed
(e.g., using `pip`) in the `python` you're using to run Spack.

For more details on how bootstrapping will work, you can check out the
[pull request #22720](https://github.com/spack/spack/pull/22720). Also keep an eye on our
[permanently-pinned issue](https://github.com/spack/spack/issues/24223) for other high-impact
changes arriving soon in Spack `develop`.
