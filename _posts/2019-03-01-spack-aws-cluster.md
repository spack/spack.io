---
layout: single
title: "Spack on AWS cluster"
date: 2019-03-01 00:02:00
tags: cloud hpc
---

Deploying an HPC cluster on Amazon Web Services might sound daunting, but it's possible with Spack. Harvard's Jiawei Zhuang has written a [guide for standing up a cloud-HPC cluster](https://jiaweizhuang.github.io/blog/aws-hpc-guide/) using AWS ParallelCluster, Slurm, and Spack. The guide provides an easy-to-follow workflow using the Weather Research and Forecasting model as an example.

Zhuang and the GEOS-Chem team at Harvard made a reproducible cloud simulation using Spack. Check out their [paper](https://eartharxiv.org/g9etd/), "Enabling high-performance cloud computing for Earth science modeling on over a thousand cores: application to the GEOS-Chem atmospheric chemistry model," which describes using Spack to build caches.
