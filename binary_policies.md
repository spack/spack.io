---
title: Policies for Binary Packages
layout: single
author_profile: false
---

Spack has the ability to create, download, install, and bootstrap
dependencies from binary packages. Spack signs binary packages with
gpg, and the ``spack gpg trust`` or ``spack buildcache keys -it``
commands tell Spack explicitly which gpg keys to trust.

When bootstrapping the lowest-level Spack dependencies from binaries,
binary verification is more complicated. Spack will bootstrap
``clingo`` and ``gpg`` without access to its normal gpg-based
verification capabilities. In those cases, Spack will bootstrap from a
very limited selection of binaries with sha256 checksums associated in
Spack. These bootstrapping binaries will also be associated with a
binary installation policy.

Spack is configured by default with unkown trust levels configured for
its builtin binary bootstrapping capabilities. When Spack needs to
bootstrap, it will prompt the user any unknown trust decisions. Users
may also use the ``spack trust`` command with appropriate options to
ensure Spack will not prompt in automated workflows.

Trusting binaries is not something to be done lightly. Different trust
policies effect the security of your account, and ultimately of your
computer or center. To enable users to make the best possible
decisions, here we describe each of the policies available in Spack
and what it means.

## Binary Trust Policies

Binaries distributed under each of the following policies are guaranteed, but gpg signing and by sha256 verification, to come from the worfklow outline for that policy

# llnl-spack-team

Binaries are built on LLNL hardware through CI on a gitlab instance on
the Livermore Computing (LC-CZ) network at LLNL. The CI jobs run on
ManyLinux containers downloaded once from the registry, and thereafter
stored on an LLNL machine so they are not a long-term target for
security threats. Binaries are checksummed as part of the CI workflow
on the same LLNL hardware, and are signed with a private gpg key owned
by one of the Spack maintainers employed at LLNL. All jobs in the CI
process are run as one of the Spack maintainers' user accounts.

# cloud-ci

Binaries are built by a github actions workflow
[in a public repo](https://github.com/alalazo/spack-bootstrap-mirrors)
owned by a Spack maintainer. Binaries are signed by a private gpg key
available to the CI process, and checksummed through the same workflow
that creates the binaries.
