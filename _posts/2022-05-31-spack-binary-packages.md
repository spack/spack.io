Spack announces public binary cache in partnership with Amazon AWS. The partnership was announced at the Spack BoF session at ISC-HPC today.

Along with huge improvements to concretization and binary packaging, Spack v0.18.0 is the first release with publicly available official binary mirrors for Spack. These packages are built in CI and are automatically kept up-to-date with new releases of Spack, as well as a rolling release for the `develop` branch. There are over 3000 optimized binary packages, primarily for applications and libraries in the e4s project, in the binary mirror already, targeting the following architectures:

----------------------------
| OS            | Target    |
-----------------------------
| amazon-linux2 | graviton  |
| amazon-linux2 | aarch64   |
| amazon-linux2 | x86_64_v4 |
| ubuntu18.04   | x86_64    |
-----------------------------

Expect the list of architectures and packages to expand in the very near future!

You can browse the available packages at https://cache.spack.io. You can also browse all packages in Spack at https://packages.spack.io. Spack aims to lower the burden of maintaining a binary distribution and make it easy to mix source builds with binaries. Packages available in the binary mirror will install from binaries, and Spack will seamlessly transition to source builds for any packages that are not available. Users will see approximately 20X installation speedups for binary packages, and performance improvements for binary packaging are in the works.

We are currently running 40,000 builds per week in Amazon AWS to create the binary packages, and we will be expanding to thousands more in the near future. Our goal is to make source builds unnecessary for most users and eliminate the long wait times between deciding on a simulation to run and your ability to start a scientific simulation.

The amazon-linux binary packages available today also work with AWS ParallelCluster.

On a brand new `amazon-linux` image, you can have optimized HPC applications installed in only 7 commands! (If you already run Spack, it's only 3 additional commands).

Let's say you want to install `gromacs`.

First we need to get Spack installed. Spack has a couple low-level dependencies it needs to be able to do anything, including a C/C++ compiler. Those aren't on your image by default, so you will need to install them with yum.
```
sudo yum install -y git gcc gcc-c++ gcc-gfortran
```

Now you can clone Spack from github and check out the latest release. Spack will bootstrap the rest of what it needs to install the binary packages. You'll also want to setup the Spack shell integration so Spack is in your path and all its features are available
```
git clone https://github.com/spack/spack.git
cd spack
git checkout v0.18.0
. share/spack/setup-env.sh
```

Now you can configure Spack to use the pre-built binary caches. You can either point it to `develop` or `releases/v0.18.0`
```
spack mirror add binary_mirror  https://binaries.spack.io/develop
spack buildcache keys --install --trust
```

You can compare the public key that Spack downloads against the ones available at https://spack.github.io/keys/ for an alternate source of truth to validate source of the binaries.

Now you can download optimized HPC application binaries
```
spack install gromacs
```

Spack will install from binaries for any package spec that is available, and will aggressively reuse binaries for dependencies. You can see what's available with Spack

```
spack buildcache list --allarch
```

Anything that's not available will still reuse the available packages for dependencies, and will seamlessly fail over to building from source for any components for which binaries are not available.

10 minutes in and your application is already available, now you can go on to do the science you set out to do.
