---
layout: single
title: "Spack on Microsoft Azure VMs"
date: 2020-01-17 00:02:00
tags: cloud hpc microsoft
---

Another HPC cloud use case! A Microsoft Tech Community [blog post](https://techcommunity.microsoft.com/t5/azure-global/run-spack-on-azure-and-integrate-the-build-cache-with-azure-blob/ba-p/1115263) describes the steps for using Spack to build and install packages on the Azure cloud for HPC workloads. There's a repo you can fork to try it yourself: [azurehpc](https://github.com/Azure/azurehpc) contains scripts to automatically install Spack on Azure VMs, set up suitable configuration files, and integrate the CentOS-HPC 7.7 MPI libraries.
