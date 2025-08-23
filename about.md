---
title: About Spack
layout: single
toc: true
author_profile: false
---

Spack is a package manager for [supercomputers], Linux, macOS, and Windows.
It makes installing scientific software easy.
With Spack, you can build a package with multiple versions, configurations, and compilers, and all of these builds can coexist on the same machine.

Spack isn't tied to a particular language; you can build a software stack consisting of Python or R packages, link to libraries written in C, C++, or Fortran, easily [swap compilers], and target [specific microarchitectures].
Use Spack to install without root in your home directory, to [manage shared installations and modules], or to [build combinatorial versions] of software for testing.

## Install Spack

Clone Spack from GitHub and you're ready to go:

{% highlight console %}
git clone https://github.com/spack/spack.git
. spack/share/spack/setup-env.sh
spack install hdf5
{% endhighlight %}

## Custom versions & configurations

Spack allows installation to be customized.
Users can specify the version, compile-time options, and target architecture, all on the command line.

{% highlight bash %}
# Install a particular version by appending @
$ spack install hdf5@1.14

# Add special compile-time options by name
$ spack install hdf5@1.14 api=v110

# Add special boolean compile-time options with +
$ spack install hdf5@1.14 +hl

# Add compiler flags using the conventional names
$ spack install hdf5@1.14 cflags="-O3 -floop-block"

# Target a specific micro-architecture
$ spack install hdf5@1.14 target=icelake
{% endhighlight %}

Users can specify as many or as few options as they care about.
Spack will fill in the unspecified values with sensible defaults.

## Customize dependencies

Spack allows *dependencies* of a particular installation to be customized extensively.
Users can specify both *direct* dependencies of a package, using the `%` sigil, or *transitive* dependencies, using the `^` sigil:

{% highlight bash %}
# Install hdf5 using gcc@15 as a compiler (direct dependency of hdf5)
$ spack install hdf5@1.14 %gcc@15

# Install hdf5 using hwloc with CUDA enabled (transitive dependency)
$ spack install hdf5@1.14 ^hwloc+cuda
{% endhighlight %}

The expression on the command line can be as simple or as complicated as the user needs:

{% highlight bash %}
# Install hdf5 compiled with gcc@15, linked to mpich compiled with gcc@14
$ spack install hdf5@1.14 %gcc@15 ^mpich %gcc@14
{% endhighlight %}

## Non-destructive installs

Spack installs every unique package/dependency configuration into its own prefix, so new installs will not break existing ones.

## Packages can peacefully coexist

Spack avoids library misconfiguration by using `RPATH` to link dependencies.
When a user links a library or runs a program, it is tied to the dependencies it was built with, so there is no need to manipulate `LD_LIBRARY_PATH` at runtime.

## Unprivileged user installs

Spack does not require administrator privileges to install packages.
You can install software in any directory you choose, making it easy to manage packages in your home directory or shared project locations without needing sudo access.

## From source and binary

Spack's core strength is creating highly customized, optimized software builds from source code.
While it's primarily a from-source package manager, it also supports fast binary installations through build caches.

## Contributing is easy

Spack packages are simple Python scripts.
The [`spack create`][spack create] command will generate boilerplate to get you started, and you can create a package in a matter of minutes.
You write the build instructions; Spack builds the dependencies for you.

{% highlight python %}
from spack_repo.builtin.build_systems.autotools import AutotoolsPackage

from spack.package import *


class Libelf(AutotoolsPackage):
    """Libelf is a library for handling ELF files."""

    homepage = "https://example.com"
    url = "https://example.com/libelf-0.8.13.tar.gz"

    license("LGPL-2.0-only")

    version("0.8.13", sha256="bab128d2328a84181b22eefef54af7122a16b39672046ada16107a2147033575")
    version("0.8.12", sha256="61a9dfef3e0a59e58d381887e9d69a9267a42b7ccca3b3da68c658aa39ba5dc2")

    depends_on("c", type="build")

    def configure_args(self):
        return ["--enable-shared"]

{% endhighlight %}

## Get Involved!

Visit [Spack on GitHub] and [take the tutorial].
Join the discussion on the [Slack], and learn how to [contribute] your own packages.
Check out the [Upcoming Events] page for tutorials, workshops, BoFs, etc.

[build combinatorial versions]: https://spack.readthedocs.io/en/latest/environments.html#spec-matrices
[contribute]: https://spack.readthedocs.io/en/latest/packaging_guide_creation.html
[manage shared installations and modules]: https://spack.readthedocs.io/en/latest/module_file_support.html
[Slack]: https://slack.spack.io/
[Spack on GitHub]: https://github.com/spack/spack
[spack create]: https://spack.readthedocs.io/en/latest/packaging_guide_creation.html#creating-and-editing-packages
[specific microarchitectures]: https://spack.readthedocs.io/en/latest/spec_syntax.html#support-for-specific-microarchitectures
[supercomputers]: https://en.wikipedia.org/wiki/Supercomputer
[swap compilers]: https://spack.readthedocs.io/en/latest/spec_syntax.html
[take the tutorial]: https://spack-tutorial.readthedocs.io/en/latest/
[Upcoming Events]: /events/
