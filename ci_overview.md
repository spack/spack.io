# Overview

A critical feature of Spack's continuous integration (CI) system is
verifying the ability to install interdependent sets of important
packages
([*"stacks"*](https://spack-tutorial.readthedocs.io/en/latest/tutorial_stacks.html)).
This aspect of Spack's CI system allows us to confidently continue to
support large software deployments as changes are made to Spack.

# How it works
Underlying the Spack CI system are our
[binary caches](https://spack-tutorial.readthedocs.io/en/latest/tutorial_binary_cache.html).
Spack uses binary caches to install prebuilt packages instead of building
them from source. This allows us to minimize unnecessary rebuilds in CI,
and to provide prebuilt binaries to our users. Spack CI maintains two
separate types of binary caches:

* Protected caches. These are populated by jobs running on protected branches (typically `develop`). Binaries installed in these caches are cryptographically signed using GnuPG keys. These binaries are suitable for use by end users. Take a look at [cache.spack.io](https://cache.spack.io/) to see the current list of prebuilt packages that are ready to be installed!
* PR caches. These binaries correspond to a work-in-progress branch that has not yet been merged to `develop`. PR binary caches exist primarily to reduce unnecessary rebuilds during an iterative development cycle.

When Spack CI runs, it first executes a **generation** job. This job
determines what packages in the stack need to be rebuilt and computes
a directed acyclic graph (DAG) defining the dependency relationships
between the packages that will be rebuilt.

This information is used to create a dynamic child pipeline.
This pipeline consists of one job per package that needs to be rebuilt.
These jobs will run in parallel while respecting the dependency
information calculated in the generation step. As each of these jobs
complete successfully, they will upload their results to the appropriate
 build cache.

# Key components

![image](/assets/images/ci_overview/architecture_diagram.png)

Spack CI uses the following key services:

## GitLab CI
Spack CI is powered by the self-hosted instance
[gitlab.spack.io](https://gitlab.spack.io/spack/spack/-/pipelines).

GitLab CI provides many of the core features we needed to create
Spack CI, such as DAG scheduling of jobs, dynamically generated child
pipelines, and the automatic propagation of build artifacts from one job
to another.

GitLab is well-supported within the DOE, so we can share in the expertise
within that community.

## Kubernetes
[Kubernetes](https://kubernetes.io/docs/concepts/overview/)
is orchestration software for deploying production services at scale.
It allows us to robustly provide the services required by the Spack CI
system. With few exceptions, all of the components of the Spack CI system
are running within our Kubernetes cluster.

## Karpenter
[Karpenter](https://karpenter.sh/) is an autoscaler for Kubernetes.
It provisions and deprovisions nodes in our Kubernetes cluster in
response to demand on the CI system.

Karpenter helps us reduce costs by flexibly considering nodes from a
large set of EC2 instance types, including spot instances. For example,
we currently consider more than 600 types of EC2 instances for our
[x86_64_v3 workloads](https://github.com/spack/spack-infrastructure/blob/main/k8s/production/karpenter/provisioners/runners/x86_64/v3/provisioners.yaml).
Karpenter considers price, availability, and the amount of pending work
to be done as it decides what type of instance to provision for the
pending workload.

## On-Premises Runners
In addition to our autoscaling, cloud-based GitLab CI runners, we also
work with our partners at the University of Oregon to provide
capabilities beyond what is available in AWS. In particular, this
includes runners with POWER9 processors, and runners containing the Cray
 Programming Environment.

## SpackCIBridge
[SpackCIBridge](https://github.com/spack/spack-infrastructure/blob/main/images/gh-gl-sync/SpackCIBridge.py)
is a custom Python polling service we created to support the
"PRs from forks" workflow that the Spack development community prefers.
In addition to propagating branches from GitHub to GitLab, this script
is also responsible for posting CI status back to the relevant commit
on GitHub.

## SpackBot
[SpackBot](https://github.com/spack/spackbot) is a GitHub app that
facilitates PR development and testing.  SpackBot receives notifications
of GitHub events and takes action to add maintainers and labels, it can
fix style errors, run pipelines, and is responsible for copying binaries
from merged PRs to a shared mirror to speed up subsequent PR pipelines.

## Monitoring
We use [Prometheus](https://prometheus.io/) and
[Grafana](https://grafana.com/) to monitor the state of our CI system.
This helps us notice when problems arise in our CI infrastructure.

![image](/assets/images/ci_overview/error_taxonomy.png)

*Error taxonomy dashboard showing the types of job failures that occurred
over a 7 day interval*

![image](/assets/images/ci_overview/pipeline_status.png)

*Trendline chart showing the rate of success for our GitLab CI pipelines*

## S3
Spack CI’s binary caches are transparently hosted within
[S3](https://aws.amazon.com/s3/). This gives us an easy-to-use location
for storing and retrieving the binaries resulting from our CI builds.
Spack CI is currently managing >10 TB of binary packages across 19 stacks.
This includes releases, weekly snapshots, and a rolling develop mirror
which is pruned on a regular basis.

# Ongoing & Future Work

Spack CI is a production system that the development community relies on.
For this reason, it needs to be highly available so as to not negatively
impact Spack's development velocity. Part of this effort is continued
maintenance of the infrastructure (including security updates) and
providing support to our users.

We also work with the Spack community to continuously expand the list of
packages that get built in our CI stacks.

We endeavor to maintain the robustness of our CI infrastructure as we
introduce new capabilities. In particular, we are excited to roll out new
CI stacks supporting the Windows operating system soon!
