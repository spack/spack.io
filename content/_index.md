---
title: "Welcome to Spack!"
description: "A flexible package manager supporting multiple versions, configurations, platforms, and compilers."
---

{{< lead >}}
A flexible package manager supporting multiple versions, platforms, and compilers.
{{< /lead >}}

{{< figure src="imgs/spack-banner.svg" class="m-auto mt-6 w-full" >}}

Spack is a package manager for
[supercomputers](https://en.wikipedia.org/wiki/Supercomputer), Linux, and
macOS.  It makes installing scientific software easy.  Spack isn't tied
to a particular language; you can build a software stack in
[Python](https://spack.readthedocs.io/en/latest/basic_usage.html#extensions-python-support)
or R, link to libraries written in C, C++, or Fortran, and easily [swap
compilers](https://spack.readthedocs.io/en/latest/getting_started.html#compiler-configuration)
or target [specific
microarchitectures](https://spack.readthedocs.io/en/latest/basic_usage.html#support-for-specific-microarchitectures).

### Quickstart
```shell
git clone -c feature.manyFiles=true https://github.com/spack/spack.git
. spack/share/spack/setup-env.sh
```
```shell
spack install hdf5
```
