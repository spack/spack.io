---
layout: single
title: "Into A New Decade: Using Spack at LRZ"
date: 2020-01-24 00:00:00
author: Johannes Albert-von der Gönna
author_profile: false
toc: false
excerpt: An account of how Spack is used on the HPC systems of the Leibniz Supercomputing Centre (LRZ): origins, ongoing development and outlook on the future.
tags: users lrz supermuc-ng
---

At the start of the new decade, it is the right time to reflect on the use of Spack at the [Leibniz Supercomputing Centre (LRZ)](https://www.lrz.de). We’d like to take a look at the current developments and pull out the crystal ball for a glimpse into the (near) future.

The story of LRZ using Spack goes back to early 2018. With the then forthcoming procurement of [SuperMUC-NG](https://doku.lrz.de/display/PUBLIC/SuperMUC-NG), currently Germany’s fastest supercomputer, a small team of HPC software application support staff set out to optimize software installations on the LRZ clusters. On the predecessor systems, each software package had been installed and managed individually. Over the years, this software stack had grown enormously and become so large, that a continuation of this practice was no longer feasible. Spack promised both: a consistent and flexible framework for installing and maintaining software. And Spack delivered, so porting the LRZ stack to Spack began.

In the second half of 2018, a beta release of this software stack was put into operation on the Linux Cluster, a heterogeneous cluster system serving the [Munich](https://www.uni-muenchen.de/index.html) [universities](https://www.tum.de/) and researchers all over Bavaria. At the same time, the deployment phase for SuperMUC-NG continued and when early user operations began, the primary software stack was Spack-based, providing more than 220 software modules to users. Since then, another internal release at the end of 2019 delivered updated libraries and applications to users.

{% include figure image_path="/assets/images/lrz-spack-team.jpg" alt="Members of the LRZ Spack team in front of SuperMUC-NG and pointing at a Spack sticker placed on the rack front." caption="The LRZ Spack team in front of SuperMUC-NG. Yes, we did put a sticker on the machine." %}

Now, as the [predecessor system](https://www.lrz.de/wir/newsletter/2019-12_en/#Adieu_SuperMUC_Phase1) has reached its end of life and was switched off at the turn of the year, the software installations on all high performance cluster systems currently operated at LRZ are managed by Spack.

While continuously integrating more packages into Spack (notable pending exceptions are some core components like certain compilers and MPI libraries), the new year’s resolution of the team is to move to the latest upstream version of Spack. This will introduce anticipated new features like chaining with the expressed goal of having users configure and install their own software, individually, while building upon the common software stack provided by LRZ. Also, with further refined environments and stacks as well as microarchitecture-targeting, it will be possible to replace substantial internal configuration and code customizations.

The team is looking forward to continue working alongside the very active Spack community, contributing to upstream development and user support while putting the fun back in supercomputer software installation and maintenance with Spack!

Make sure to follow [@lrz_de](https://twitter.com/lrz_de) on Twitter for the latest updates on supercomputing for students and researchers in Munich, Bavaria, Germany and beyond.
