---
title: About Spack
layout: single
toc: true
author_profile: false
---

Spack is a package manager for
[supercomputers](https://en.wikipedia.org/wiki/Supercomputer), Linux, and
macOS.  It makes installing scientific software easy. With Spack, you can
build a package with multiple versions, configurations, platforms, and
compilers, and all of these builds can coexist on the same machine.

Spack isn't tied to a particular language; you can build a software stack
in
[Python](https://spack.readthedocs.io/en/latest/basic_usage.html#extensions-python-support)
or R, link to libraries written in C, C++, or Fortran, easily
[swap compilers](https://spack.readthedocs.io/en/latest/getting_started.html#compiler-configuration), and
target [specific
microarchitectures](https://spack.readthedocs.io/en/latest/basic_usage.html#support-for-specific-microarchitectures).
Use Spack to install without root in your home directory, to
[manage shared installations and modules](https://spack.readthedocs.io/en/latest/module_file_support.html),
or to [build combinatorial versions](https://spack.readthedocs.io/en/latest/basic_usage.html#specs-dependencies)  of software for testing.

## Install Spack

Clone Spack from GitHub and you're ready to go:

{% highlight console %}
git clone https://github.com/spack/spack.git
. spack/share/spack/setup-env.sh
spack install hdf5
{% endhighlight %}

## Custom versions & configurations

The installation of Spack can be customized in a variety of ways. Users can
specify the package version, compiler, compile-time options, and even
cross-compile platform, all from the command line.

{% highlight bash %}
   # Install a specific version by appending @
   $ spack install hdf5@1.10.1

   # Specify a compiler (and optional version), with %
   $ spack install hdf5@1.10.1 %gcc@4.7.3

   # Add special boolean compile-time options with +
   $ spack install hdf5@1.10.1 %gcc@4.7.3 +szip

   # Add custom compiler flags
   $ spack install hdf5@1.10.1 %gcc@4.7.3 cppflags="-O3 -floop-block"

   # Cross-compile for compute nodes on a Cray or Blue Gene/Q
   $ spack install hdf5@1.10.1 target=backend
{% endhighlight %}

Users can specify as many or few options as they care about. Spack will fill in
the unspecified values with sensible defaults. The two listed syntaxes for
variants are identical when the value is boolean.

## Customize dependencies

Spack allows dependencies of particular installations to be customized
extensively. Suppose that `hdf5` depends on `openmpi` and indirectly on
`hwloc`. Using `^`, users can add custom configurations for dependencies:

{% highlight bash %}
   # Install hdf5 and link it with specific versions of openmpi and hwloc
   $ spack install hdf5@1.10.1 %gcc@4.7.3 +debug ^openmpi+cuda fabrics=auto ^hwloc+gl
{% endhighlight %}

## Packages can peacefully coexist

Spack installs every unique package/dependency configuration into its own
prefix, so new installs will not break existing ones.

Spack avoids library misconfiguration by using `RPATH` to link dependencies.
When a user links a library or runs a program, it is tied to the dependencies
it was built with, so there is no need to manipulate `LD_LIBRARY_PATH` at
runtime.

## Creating packages is easy

Spack packages are simple Python scripts. The
[`spack create`](https://spack.readthedocs.io/en/latest/packaging_guide.html#creating-editing-packages)
command will generate boilerplate to get you started, and you can create a
package in a matter of minutes. You write the build instructions; Spack builds
the dependencies for you.

{% highlight python %}
from spack import *

class Kripke(Package):
    """Kripke is a simple, scalable, 3D Sn deterministic particle
       transport proxy/mini app.
    """
    homepage = "https://computing.llnl.gov/projects/co-design/kripke"
    url      = "https://computing.llnl.gov/downloads/kripke-openmp-1.1.tar.gz"

    version('1.1', '7fe6f2b26ed983a6ce5495ab701f85bf')

    variant('mpi',    default=True, description='Build with MPI.')
    variant('openmp', default=True, description='Build with OpenMP enabled.')

    depends_on('mpi', when="+mpi")

    def install(self, spec, prefix):
        with working_dir('build', create=True):
            cmake('-DCMAKE_INSTALL_PREFIX:PATH=.',
                  '-DENABLE_OPENMP=%s' % ('+openmp' in spec),
                  '-DENABLE_MPI=%s'    % ('+mpi' in spec),
                  '..',
                  *std_cmake_args)

            make()
            mkdirp(prefix.bin)
            install('kripke', prefix.bin)
{% endhighlight %}

## Get Involved!

Visit [Spack on GitHub](https://github.com/spack/spack) and
[take the tutorial](https://spack-tutorial.readthedocs.io/en/latest/).
Join the discussion on the
[GoogleGroup](https://groups.google.com/d/forum/spack), and learn how to
[contribute](https://spack.readthedocs.io/en/latest/contribution_guide.html)
your own packages. Check out the [Upcoming Events](/events/) page for tutorials,
workshops, BoFs, etc.
