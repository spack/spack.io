On a brand new `amazon-linux` image, you can have optimized HPC applications installed in only 7 commands! (If you already run Spack, it's only 3 additional commands). Let's say you want to install `gromacs`.

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
