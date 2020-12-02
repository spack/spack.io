---
layout: single
title: "Spack User Survey 2020"
date: 2020-12-02 00:03:00
author: Todd Gamblin
author_profile: true
toc: true
excerpt: Results from the Spack 2020 User Survey are out! Check out our summary below.
tags: user survey 2020 community
header:
    overlay_image: /assets/images/packages-banner-large.jpg
    overlay_filter: 0.2
    show_excerpt: false
---

# Introduction

Spack has been around for a while, and we've always felt like we have a
pretty good sense of the community through channels like GitHub, Slack,
and our Google group. However, the project is getting larger, and we
wanted to better understand the community's needs with more structured
feedback. Spack is funded by the [NNSA](https://www.energy.gov/nnsa/)
[ASC Program](https://en.wikipedia.org/wiki/Advanced_Simulation_and_Computing_Program)
and the U.S.
[Exascale Computing Project (ECP)](https://exascaleproject.org/), and we
wanted to understand the different needs of ASC, ECP, and other types of
users.

So, this year, we ran our first ever Spack user survey. Read on to see
the results.

## About the survey

The survey has 26 multiple-choice questions and 6 longer-form questions.
It was open from September 28 to October 9, and there were 169
respondents. We advertised to the broadest audiences we knew how to
reach. Specifically, we advertised the survey through:

* Our [Google group](https://groups.google.com/g/spack) (402 members);
* [Slack](https://spackpm.herokuapp.com) (~900 members);
* [Twitter](https://twitter.com/spackpm) (~1,100 followers);
* the [ECP](https://exascaleproject.org/)-wide mailing list (ECP is ~1,000 people); and
* the [El Capitan](https://www.llnl.gov/news/llnl-and-hpe-partner-amd-el-capitan-projected-worlds-fastest-supercomputer) Center of Excellence (COE) mailing list.

There's probably a lot of overlap between these lists, so this may not be
as wide an audience as it would seem. It's probably biased towards U.S.
users, as the people on the mailing lists are very U.S.-centric. So,
while the sample is by no means scientific, we know at least that it
covers a lot of Spack users.

## Data

The results are summarized here, but you can get the full data set and
the scripts we used to generate these charts
[here](https://github.com/spack/spack-user-survey). There are a lot of
results -- let us know if you find anything interesting that we missed.

## Thanks!

Thanks to the 169 users who filled out the survey, both for this feedback
and for your continuing contributions to Spack! This project wouldn't be
possible without the community!

# Demographics

In this section of the survey, we tried to understand the composition of
the Spack community.

## ECP and Spack

The first question we asked was whether respondents were part of ECP.

<figure>
  <a href="/assets/images/spack-user-survey-2020/pie_in_ecp.svg">
    <img src="/assets/images/spack-user-survey-2020/pie_in_ecp.svg">
  </a>
</figure>

ECP is just over a third of the community (~35%, or 61 of 169
respondents). It includes people from both sides of the U.S. Department
of Energy -- [NNSA](https://www.energy.gov/nnsa/) laboratories like
[LLNL](https://llnl.gov), [LANL](https://lanl.gov), and
[Sandia](https://sandia.gov); and
[Office of Science](https://www.energy.gov/science/), laboratories like
[ANL](https://www.anl.gov), [ORNL](https://ornl.gov),
[LBL](https://www.lbl.gov/), [PNNL](https://www.bnl.gov/),
[BNL](https://www.bnl.gov/), and others. Under ECP, the Spack team is
focusing on delivering a software stack for the first U.S. exascale
machines, which includes upcoming systems like:

* LBL's [Perlmutter](https://www.nersc.gov/systems/perlmutter/): AMD CPU /
  NVIDIA GPU (pre-exascale)
* ANL's [Aurora](https://www.alcf.anl.gov/aurora): Intel CPU / Intel GPU
* ORNL's [Frontier](https://www.olcf.ornl.gov/frontier/): AMD CPU / AMD GPU
* LLNL's [El Capitan](https://www.llnl.gov/news/llnl-and-hpe-partner-amd-el-capitan-projected-worlds-fastest-supercomputer): AMD CPU / AMD GPU

All of these are HPE/Cray systems, but the hardware is quite diverse
(particularly the GPUs). We wanted to see whether the users at the
bleeding edge of HPC had significantly different needs from the Spack
community as a whole. So, in most of the following sections, we present
responses for Spack and for ECP separately.

## What kind of user are you?

We asked users what their role was at their organization.

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_pies_user_type.svg">
    <img src="/assets/images/spack-user-survey-2020/two_pies_user_type.svg">
  </a>
</figure>

Spack was originally targeted at user support teams and system
administrators, but by far the largest parts of the community are end
users (scientists/researchers) installing software on HPC machines (41%)
and software developers (35%). System administrators were ~11% of the
overall community, and user support staff were only 8%. In ECP, this is
even more pronounced -- only a small fraction of respondents identified
as system administrators, and developers were nearly 44% of the ECP user
base.

Part of the absence of sysadmins may be that at DOE labs, administrators
don't typically handle installation of user software -- that's left to
dedicated support teams who engage with users. Admins (at least in DOE)
tend to focus on keeping the machines running and managing the host OS
underneath Spack.

If you compare this to
[EasyBuild's latest survey](https://www.youtube.com/watch?v=ppKVsnwba7g#t=9m36s),
you'll see that the composition of the communities is very different. In
EasyBuild's similar survey, only 3% of the respondents identified as
developers, and only 9% were scientists. User support and admins were 26%
and 53% of the EasyBuild user base, respectively.

## Where do you work?

We next asked users where they work.

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_pies_workplace.svg">
    <img src="/assets/images/spack-user-survey-2020/two_pies_workplace.svg">
  </a>
</figure>

The community as a whole is diverse. Slightly less than a third (31%) are
from Universities. 37.6% are from DOE NNSA and Office of Science
laboratories (more than all of ECP -- so parts of DOE not in ECP are
included). Other public research labs make up 18% of Spack users, and
~13% are from private companies and cloud providers. Within ECP, a large
majority of users (76%) were from DOE labs, but there was still some
participation from public labs and universities.

Comparing again with
[EasyBuild's survey](https://www.youtube.com/watch?v=ppKVsnwba7g#t=9m36s),
we can see that EasyBuild has a much smaller percentage of users from
national computing centers (13% vs. 37%), and a larger percentage of
users from universities (55%). It is hard to tell exactly how the
proportions compare, as EasyBuild's survey provided a "university
research group" option, while in our survey that is likely spread across
the "University HPC center" and "public research lab" categories.

## What country are you in?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_pies_country.svg">
    <img src="/assets/images/spack-user-survey-2020/two_pies_country.svg">
  </a>
</figure>

Just under 2/3 of Spack users are in the United States, and nearly
exactly 2/3 are from North America when our two Canadian respondents are
included. 27% are from Europe, 5% from Asia, and there was one respondent
each from the Middle East (Saudi Arabia) and South America (Argentina).
Within ECP (which is a U.S. DOE project), the proportion is much higher
-- nearly 97% are from the U.S.

## What are your primary application areas?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_multi_bars_app_area.svg">
    <img src="/assets/images/spack-user-survey-2020/two_multi_bars_app_area.svg">
  </a>
</figure>

These results are mostly as we expected -- most Spack users (~80%) are
doing traditional HPC and simulation. In the broader community around 30%
are doing computer science research, but within ECP around 50% are doing
CS research. In ECP, AI and bioinformatics were noticeably less emphasized
than in the broader Spack community. Interestingly, compiler testing was
the 7th most popular application area outside ECP, but the 4th most
popular inside ECP. Only one user reported using Spack for web
applications.

## How did you find out about Spack?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_pies_how_find_out.svg">
    <img src="/assets/images/spack-user-survey-2020/two_pies_how_find_out.svg">
  </a>
</figure>

Both in and outside ECP, about half of Spack users hear about the tool
via word of mouth. This result made us pretty happy -- we think it means
that users are very willing to recommend Spack to friends. After word of
mouth, 22% people heard of Spack because it was used at their site.
Within ECP this was slightly more likely at 30%.

24% of users heard about Spack from outreach activities: tutorials, BOF
sessions, and presentations.


## How long have you been using Spack?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_bars_how_long_using.svg">
    <img src="/assets/images/spack-user-survey-2020/two_bars_how_long_using.svg">
  </a>
</figure>

Spack usage has been growing over time, and the number of users who join
the community each year is increasing. Most of the overall community has
been using Spack for less than two years. We also see this effect in the
number of contributors to the project on GitHub. In 2018, after the
project had been publicly available for 4 years, there were around 300
contributors. 2 years later, there are nearly 700.

Within ECP, the community is older -- most people started using Spack in
ECP 2-3 years ago. There has been less adoption since then, but we
attribute this to Spack's rapid adoption in ECP. Spack caught on quickly
there, people have continued to use it, and there is not a large influx
of users *into* ECP. The population stays mostly the same over time.

## Have you contributed to Spack?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_multi_bars_how_contributed.svg">
    <img src="/assets/images/spack-user-survey-2020/two_multi_bars_how_contributed.svg">
  </a>
</figure>

Around 75% of users who responded have contributed to Spack in some way
or another, and most of those (60%) have contributed a package. Nearly
40% of users are active on Slack, and nearly 40% have filed issues on
GitHub.

It's notable that Slack discussions are *far* more active than the Spack
mailing list -- users seem to want to engage live rather than sending
emails back and forth.

Not many users (~10%) have contributed to documentation, but even this
small amount helps the project -- this is around 16 people.

There don't seem to be any special takeaways here for ECP, except that
ECP users seem to be slightly more likely to contribute a package (nearly
70% have done so).

# Spack Usage

Having characterized the user base, we moved on to finding out how they
use Spack.

## What version(s) of Spack do you use?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_multi_bars_spack_versions.svg">
    <img src="/assets/images/spack-user-survey-2020/two_multi_bars_spack_versions.svg">
  </a>
</figure>

Spack users like to be on the bleeding edge, and it shows up the versions
of Spack they use. Just under 60% of users are using the `develop` branch
of Spack, and the number is higher (~65%) in ECP. The next most popular
version was 0.15, which was the latest latest Spack release at the time
of this survey.

Comparatively few users were on older versions, though a very small
number of people were using 0.10. A lot has happened since then -- 0.10
was released in January 2017, and there were around 1,000 packages then
(vs. 5,000 now). We hope the users still on 0.10 will upgrade -- both for
features and for package fixes.

## What OS do you use Spack on?

<figure class="half">
  <a href="/assets/images/spack-user-survey-2020/two_multi_bars_os_simple.svg">
    <img src="/assets/images/spack-user-survey-2020/two_multi_bars_os_simple.svg">
  </a>
  <a href="/assets/images/spack-user-survey-2020/two_multi_bars_os.svg">
    <img src="/assets/images/spack-user-survey-2020/two_multi_bars_os.svg">
  </a>
  <figcaption>
    OS's of Spack users ignoring (left) and considering (right) specific Linux
    distributions.
  </figcaption>
</figure>

Spack is targeted at HPC, so it's no surprise that nearly 100% of users
are using it on Linux. What users sometimes
[forget](https://twitter.com/HPC_James/status/1329238400596123653) is
that Spack also works on macOS. Around 35% of all users run Spack on
their macs, and over half the users within ECP are also running it on
macOS. A small number of users (< 10%) are running Spack within the
Windows Subsystem for Linux. We don't test there, but we're told that
Spack works fine in the WSL environment.

If we look at the responses in more detail, we can see the specific Linux
*distributions* that users are running. The most popular, by far, are
CentOS and Red Hat. In ECP, Red Hat is especially popular. Ubuntu is the
next most popular after these, then macOS, then other Linux distributions
and WSL. SuSE is more popular within ECP than in the broader community,
likely because it is the Linux distribution that most Cray systems are
built on.


## How many software installations have you done with Spack in the past year?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_multi_bars_num_installations.svg">
    <img src="/assets/images/spack-user-survey-2020/two_multi_bars_num_installations.svg">
  </a>
</figure>

Almost 28% of the community has done over 200 software installations, and
over 12% have done over 1,000 installs. The ECP numbers are similar to
the general population, but the distribution is slightly shifted towards
larger numbers of installations.

## What Python version(s) do you use to run Spack?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_multi_bars_python_version.svg">
    <img src="/assets/images/spack-user-survey-2020/two_multi_bars_python_version.svg">
  </a>
</figure>

Support for Python 2 ended January 1, 2020, but nearly a year later,
around 40% of Spack users are still using Python 2.7. 4 users are even
using Python 2.6. Python 2.7 is still the system Python version on many
operating systems, including Red Hat 7 and CentOS 7, and on Red Hat and
CentOS 6 (which are still used at some sites) the default is 2.6.

While many projects can pick their version of Python, Spack is often the
tool people use to *install* newer versions of Python, and we don't want
to make users use another installer just to install Spack's dependencies.
We want it to work out of the box, so we try to make Spack work with the
system Python everywhere.

## How bad would it be if Spack dropped support for Python 2.6?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_pies_how_bad_no_py26.svg">
    <img src="/assets/images/spack-user-survey-2020/two_pies_how_bad_no_py26.svg">
  </a>
</figure>

We asked whether it would be OK for us to drop Python 2.6, and we found
that there are still around 4 hold-outs who really need Spack to work on
Python 2.6, and over 20% of people would be at least mildly
inconvenienced by this change. For the time being, we'll keep supporting
Python 2.6, but you can probably expect its deprecation to be announced
sometime within the next year, as the last few Red Hat 6 installations
dwindle.

## How bad would it be if Spack only worked with Python 3?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_pies_how_bad_only_py3.svg">
    <img src="/assets/images/spack-user-survey-2020/two_pies_how_bad_only_py3.svg">
  </a>
</figure>

Eventually, we'd like to drop Python 2 entirely, but with 40% of users
still using 2.7, and with 36% of users likely to be bothered by the
shift, we'll hold off on dropping 2.7, as well. Interestingly, while ECP
users were less likely that the broader community to completely oppose
dropping 2.6, they were *more* likely than the community to oppose
dropping 2.7.

## How do you get installed Spack packages into your environment?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_multi_bars_how_use_pkgs_any.svg">
    <img src="/assets/images/spack-user-survey-2020/two_multi_bars_how_use_pkgs_any.svg">
  </a>
  </figure>

The most common way to use Spack packages is still through modules, and
module usage seems to be split about evenly between Lmod and TCL modules,
with some overlap. We were surprised to see that the `spack load` command
is the second most popular way to use Spack packages, only a few
percentage points behind modules.

We don't have data on past usage of `spack load`, but we've tried to make
it easy to use everywhere, and this may have caused its usage to
increase. In particular, in earlier Spack releases, `spack load`
*required* modules in order to work (it was a thin layer around `module
load`). As of
[Spack `0.14`](https://github.com/spack/spack/releases/tag/v0.14.0) in
early 2020, it only requires Spack's own environment support -- so you
can easily load a one-off package on your mac or personal Linux box where
you don't already have modules installed.

After `spack load`, around 35% of users are making use of Spack
environments to load groups of packages together. Like `spack load`,
Spack environments require no support from the module system -- they work
regardless of where Spack is deployed and they provide be a more portable
alternative to loading environment modules.

## Which Spack features do you use?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_multi_bars_used_features.svg">
    <img src="/assets/images/spack-user-survey-2020/two_multi_bars_used_features.svg">
  </a>
</figure>

While Spack
[environments](https://spack.readthedocs.io/en/latest/environments.html)
ranked below modules for simply getting packages into `PATH`,
environments are actually the most widely used single *feature* of Spack
(at least on our list here). Around 2/3 of users say they use
environments. environments can be used to add packages to `PATH`, to
maintain a list of dependencies via `spack.yaml`, to version a
`spack.yaml` environment in a repo, to do
[combinatorial builds](https://spack-tutorial.readthedocs.io/en/latest/tutorial_stacks.html),
to reproduce builds with `spack.lock`, to configure and run
[CI pipelines](https://spack.readthedocs.io/en/latest/pipelines.html),
and to
[build container images](https://spack.readthedocs.io/en/latest/containers.html).

# Looking Ahead

We wanted to get a sense of what users will need from Spack in the coming
year, so we asked about upcoming architectures, Spack features, and
events.

## Which CPUs do you expect to use with Spack in the next year?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_multi_bars_cpus_next_year.svg">
    <img src="/assets/images/spack-user-survey-2020/two_multi_bars_cpus_next_year.svg">
  </a>
</figure>

Nearly everyone in the Spack community plans to run on Intel CPUs in the
next year, and around 80% expect to use Spack to build for AMD systems.
Just over 40% of users will run on ARM and just under 40% will run on
Power. Within ECP, the percentage of users that want to run on any of the
non-Intel CPUs is larger -- as you might expect, ECP is targeting a more
diverse set of architectures. There were many more ECP users who expected
to run on Power than in the broader community, likely because the current
top two U.S. systems, Summit and Sierra, are Power machines.

We can't draw a fair comparison with EasyBuild on this question, as
EasyBuild's survey asked users what CPUs they were *currently* using
rather than what they expected to be using in the next year. Even if it's
to be taken with a grain of salt, the difference is still worth
mentioning. In the
[EasyBuild survey](https://www.youtube.com/watch?v=ppKVsnwba7g#t=30m06s),
the vast majority of users were similarly running on Intel machines. But,
less than 20% of were using AMD chips, less than 5% were using Power, and
only one user reported using ARM.

## Which GPUs do you expect to use with Spack in the next year?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_multi_bars_gpus_next_year_any.svg">
    <img src="/assets/images/spack-user-survey-2020/two_multi_bars_gpus_next_year_any.svg">
  </a>
</figure>

All users in the Spack community expect to run on GPUs in the next year,
and over 90% plan to build for NVIDIA GPUs. Around half of the overall
community expects to build for AMD GPUs, and around 30% expect to build
for Intel GPUs. Within ECP, the percentage of users planning to run on
NVIDIA GPUs is very slightly lower, likely because NVIDIA will not be the
GPU on any of the initial three exascale machines. Aurora will be an
Intel GPU system and both Frontier and El Capitan will use AMD GPUs. As
you might expect, 80% of ECP users expect to use AMD GPUs and over half
expect to use Intel GPUs.

[GPU usage in the EasyBuild community](https://www.youtube.com/watch?v=ppKVsnwba7g#t=31m17s)
was similarly high -- 96.5% of EasyBuild users were compiling software
for GPUs -- so it's pretty clear that GPUs have become pervasive in HPC.

## Which compilers do you expect to use with Spack in the next year?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_multi_bars_compilers_next_year.svg">
    <img src="/assets/images/spack-user-survey-2020/two_multi_bars_compilers_next_year.svg">
  </a>
</figure>

As you might expect given the CPU and GPU results, Spack users
anticipate using a very wide range of compilers. `gcc` is still king,
with almost 100% of users expecting to use it, and LLVM and Intel
compilers are next on the list.

Interestingly, only around 60% planned to use `nvcc`, and a bit more than
40% planned to use NVIDIA's HPC compilers. Given that over 90% of users
said they expected to build on NVIDIA GPUs, we're tempted to explain the
discrepancy by saying that a large percentage of users expect to use
NVIDIA GPUs not through CUDA directly, but through GPU-optimized
libraries or through compiler capabilities like OpenMP offload. The same
can probably be said for AMD and Intel GPUs -- the percentage of users
who plan to run with compilers specifically intended for these GPUs was
consistently lower than the number of users who anticipated using them.

## Rank upcoming Spack features by importance

<figure>
  <a href="/assets/images/spack-user-survey-2020/feature_bars_all_features.svg">
    <img src="/assets/images/spack-user-survey-2020/feature_bars_all_features.svg">
  </a>
</figure>

We asked respondents to rank some planned and not-yet-planned Spack
features by importance: "not important", "slightly important", "somewhat
important", "very important", and "critical". The two most frequently
ranked "critical" (and also the top two features by average score) were
reusing external installs and the new concretizer. These are related, as
the new concretizer is needed to reuse existing installations.

After those, the most important features were better compiler flag
handling and better support for developers. Separate concretization of
build dependencies (i.e., using `gcc` for packages like CMake even if the
user asked that the main package be built with the Intel compilers) was
next on the list, followed by language virtuals (ability to depend on
`cxx`, `c`, or `fortran` and have that resolve to a compiler and runtime
library), automatic package maintainer notifications on GitHub, and build
testing.

The features rated least important were build testing, publicly
available optimized binary packages, package testing, cloud integration
for Spack, and Windows support, with the last three rated significantly
less important than all the others.

Every feature was listed as "critical" by at least some users, but there
are some clear preferences here that we'll be trying to tailor our
efforts to. We already shipped the new concretizer as an experimental
feature in
[Spack v0.16.0](https://github.com/spack/spack/releases/tag/v0.16.0), and
we've already merged a number of fixes for it in
[Spack v0.16.1](https://github.com/spack/spack/projects/37). Separate
concretization of build dependencies and reusing existing installs are
both modifications that we'll need to make to the new concretizer, and
we've already started looking into how we can provide them. Better
developer support, language virtuals, maintainer notifications, better
build testing, and package testing are already milestones for 2021.

The feature that stands out that we haven't yet worked into our plans is
better compiler flag handling. Based on this survey we're going to see if
we can work that into our schedule for 2021, as well.

<figure class="half">
  <a href="/assets/images/spack-user-survey-2020/heat_map_features_by_workplace.svg">
    <img src="/assets/images/spack-user-survey-2020/heat_map_features_by_workplace.svg">
  </a>
  <a href="/assets/images/spack-user-survey-2020/heat_map_features_by_job.svg">
    <img src="/assets/images/spack-user-survey-2020/heat_map_features_by_job.svg">
  </a>
  <figcaption>
    Feature ratings by workplace (left) and by job type (right).
  </figcaption>
</figure>

In addition to the community-wide averages above, we looked at whether
different segments of the community rated features differently. On the
right above, we split out average feature ratings by workplace, and on
the left we split them out by job type.

Overall, the rank order of features was similar across different
workplaces and job types. Reusing existing installs and the new
concretizer were consistently at the top of everyone's list, and the
lowest-rated features had low ratings across the board. Industry users
prioritized cloud integration noticeably higher than other groups, and
user support staff placed a much higher value on package testing than
other job types (perhaps because they are involved in more package
testing efforts at their sites). Managers and ASCR labs rated separate
build dependencies lower than other groups. Other than these outliers
there were not significant deviations from the overall order of
preference.

There are some noticeable trends *across* groups. System administrators,
user support staff, and industry users tended to rate features as less
important across the board. It's hard to know how to interpret this -- it
could mean that they're happy with the existing capabilities of Spack, or
that these particular improvements aren't their top priorities.

## If we had a (virtual) workshop on Spack, would you attend?

We've thought about having a Spack user meeting for a while, and we had
actually started planning for an inaugural Spack User Meeting earlier this
year. That fell apart when the pandemic hit. Other similar tools have had
good luck with meetings like this (e.g.,
[NixCon](https://2020.nixcon.org/) and the
[EasyBuild User Meeting](https://github.com/easybuilders/easybuild/wiki/5th-EasyBuild-User-Meeting)),
so we asked users what they thought of a potentially virtual meeting:

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_pies_would_attend_workshop.svg">
    <img src="/assets/images/spack-user-survey-2020/two_pies_would_attend_workshop.svg">
  </a>
</figure>

Just over half of users (over 85 people) said they would attend, and 8
said they'd be willing to present on their work. That seems like more
than enough for an initial Spack meeting, so expect us to announce
something for 2021.

# Getting Help

We're interested in making it easier to learn about Spack, so we asked
people how they're doing it now.

## Have you done a Spack tutorial?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_pies_did_tutorial.svg">
    <img src="/assets/images/spack-user-survey-2020/two_pies_did_tutorial.svg">
  </a>
</figure>

We were surprised to see that over 60% of all our users have done a Spack
tutorial. Since 2016, We've been doing Spack tutorials at conferences
like [Supercomputing](https://supercomputing.org/),
[ISC](https://www.isc-hpc.com/), and
[PEARC](https://pearc.acm.org/pearc19/workshops-and-tutorials/), and this
year we had over 125 attendees at our virtual
[Spack tutorial on AWS](https://spack-tutorial.workshop.aws/). This seems
to show that tutorials have been a very effective form of outreach, even
if they aren't the main way people first hear about Spack (per our
[earlier question](http://localhost:4000/spack-user-survey-2020/#how-did-you-find-out-about-spack)).
At the very least, they likely contribute to the
[high rate of contribution](http://localhost:4000/spack-user-survey-2020/#have-you-contributed-to-spack)
in the community.

## How do you get help with Spack when you need it?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_multi_bars_how_get_help.svg">
    <img src="/assets/images/spack-user-survey-2020/two_multi_bars_how_get_help.svg">
  </a>
</figure>

Users go to the docs more than any other place for help with Spack.
Slack,
[as mentioned above](http://localhost:4000/spack-user-survey-2020/#have-you-contributed-to-spack),
is also very popular -- 50% of users use it to get help. We were happy to
see that around 40% of users get help from their coworkers, and when we
looked further at this data, those who got help from coworkers were not
confined to big laboratories -- they came from
[all the types of workplaces](http://localhost:4000/spack-user-survey-2020/#where-do-you-work)
that we considered.

## How often do you consult the Spack documentation?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_pies_how_often_docs.svg">
    <img src="/assets/images/spack-user-survey-2020/two_pies_how_often_docs.svg">
  </a>
</figure>

Users consult the documentation reasonably frequently -- weekly to
monthly for most. A small fraction (14%) check it daily. ECP users check
the documentation less frequently on average than the community as a
whole, but
[ECP users have also been using Spack for longer](http://localhost:4000/spack-user-survey-2020/#how-long-have-you-been-using-spack),
and are likely more familiar with it.

## If there were commercial support for Spack, would you or your organization buy it?

<figure>
  <a href="/assets/images/spack-user-survey-2020/two_pies_commercial_support.svg">
    <img src="/assets/images/spack-user-survey-2020/two_pies_commercial_support.svg">
  </a>
</figure>

We don't have any plans to provide commercial support for Spack at the
moment, but it's nice to know that 23%, or 39 users and their
organizations might be willing to pay for it. That's a fairly large
percentage of users willing to pay for support for an open source
product.

# Quality of Spack

We wrapped up the multiple choice part of our survey with a final
question asking users to rate the quality of Spack.

## How would you rate the overall quality of Spack, its community, docs, and packages?

<figure>
  <a href="/assets/images/spack-user-survey-2020/feature_bars_all_quality.svg">
    <img src="/assets/images/spack-user-survey-2020/feature_bars_all_quality.svg">
  </a>
</figure>

Similar to our
[question on features](http://localhost:4000/spack-user-survey-2020/#rank-upcoming-spack-features-by-importance)
above, users were asked to rate different parts of Spack as "horrible",
"bad", "ok", "good", and "excellent". We split the results out by
workplace and job:

<figure class="half">
  <a href="/assets/images/spack-user-survey-2020/heat_map_quality_by_workplace.svg">
    <img src="/assets/images/spack-user-survey-2020/heat_map_quality_by_workplace.svg">
  </a>
  <a href="/assets/images/spack-user-survey-2020/heat_map_quality_by_job.svg">
    <img src="/assets/images/spack-user-survey-2020/heat_map_quality_by_job.svg">
  </a>
  <figcaption>
    Quality ratings by workplace (left) and by job type (right).
  </figcaption>
</figure>

Responses were positive on average for all categories. Less than 5% of
users responded negatively for any aspect. Consistently, the
highest-rated aspect was the community, which is great, because Spack
wouldn't be sustainable without its community. Just after the community
was Spack itself.

While both the community and Spack averaged "good" or higher overall, the
docs and packages rated slightly lower. Packages had the lowest average
ratings.

While some users have
[praised the documentation](https://twitter.com/owainkenway/status/1283075361740333058),
a lot of documentation has accumulated and it likely needs to be
organized better. Spack targets
[many different kinds of users](http://localhost:4000/spack-user-survey-2020/#what-kind-of-user-are-you),
and there is not just one workflow. We've gotten a lot of requests to
provide clearer how-to guides for common site deployment and developer
workflows, which is something we plan to work on over the next year.

Spack packages are a harder problem. The package DSL is part of what
makes Spack unique -- there is one template for each package, and the
same template lets you build any version or configuration of a package.
This makes it easier to port Spack packages to new systems, but it also
makes the testing surface for Spack packages *very* large. We think we
are still on the right path, for several reasons:

* Together with Kitware, we've built up a sophisticated CI system using
  the support for
  [pipelines](https://spack.readthedocs.io/en/latest/pipelines.html)
  built into Spack environments.
* We've hooked up our GitLab instance to Spack's main GitHub repository,
  and within the next couple of weeks, we'll be testing a subset of Spack
  builds on *every* pull request.
* These are the same builds used to produce ECP's
  [Extreme Scale Scientific Software Stack (E4S)](https://e4s.io).

One of our priorities for 2021 under ECP is hardening these builds and
testing Spack packages on a wide range of platforms, and now that the new
concretizer is in Spack, we expect to be able to steer Spack
configurations towards well tested ones, based on builds in our pipeline
and under E4S. So, we expect package stability to get much better over
the coming year, and we're hoping that it will show up in next year's
survey responses.


# Longer answers

We asked 6 long answer questions. If you want, you can read them all in
the [data repository](https://github.com/spack/spack-user-survey). The
number and length of responses to these was overwhelming, and we haven't
come up with a great way to summarize them, but reading them all gave us
a great picture of what people in the community are up to. We've picked a
few responses per question and quoted them below.

## Tell us briefly about your use case and your usual Spack workflow.

  * *I am using Spack to build the software environment for our users on
    our University's centralized HPC system.*

  * *Using Spack to build complex applications natively. Moving the the
    build into containers, if possible with `spack containerize`.*

  * *We use spack to provide 3 consistent entry points into our nuclear
    physics software environment: cvmfs, build_caches, containers.*

  * *Rather heterogeneous cluster with an environment per architecture.
    Currently having lots of fun packaging bioinformatics tools.*

  * *Support Spack in Fugaku*

  * *I'm a math library developer and use spack to build third party
    libraries e.g., `blas`, `lapack`, `MPI`, `hypre`, `SuperLU_MT`,
    `SuperLU_DIST`, `PETSc`, and `Trilinos` both for developing on my
    laptop and for continuous integration on a dedicated workstation.*

  * *We use spack to install most facility-provided software on OLCF HPC
    machines.*

  * *Distributed build system with Spack environments*


## What about Spack helps you the most?

  * *The community*

  * *Greg Becker responding to my questions on Slack.*

  * *How Spack handles installation of multiple versions of the same app.*

  * *How Spack should be Linux OS agnostic (yet to be tested) so we can
    experiment with offering other distros for users.*

  * *Absolute flexibility, especially compared to, i.e., `nix`. And
    dependency handling, which I never want to do manually again.*

  * *I'm still in dependency hell, but Spack took me from the 7th circle
    (violence - for the violence I'd like to commit against my keyboard
    while building things) to the 3rd circle (gluttony - for the
    voracious appetite I now have for spack-installed packages and the
    indulgent number of dependencies they require).*

  * *Well-defined package specifications and solid concretization.*

  * *The concretizer (despite some issues) is the most helpful aspect of
    Spack. It allows for automatic dependency management and
    reproducibility.*

## What are the biggest pain points in Spack for your workflow?

  * *surprising re-concretizations, updating environments and removing old
    packages*

  * *inter dependencies with many variants makes a huge/complicated
    package file*

  * *Better parallel building of environments. I think Slurm integration
    could be very good to have.*

  * *Right now, the time it takes to concretize in our deployment with ~2000
    packages already in the database.*

  * *Not having language virtual dependencies makes it harder to have
    language polyfills for newer features when the compiler doesn’t support
    them. It also is hard to say what compiler versions you support*

  * *c++ language standard dependencies, build dependency blow-up*

  * *It seems that we should specify external package path every time so it
    would be great if Spack can detect preinstalled libraries.*

## What's the biggest thing we could do to improve Spack over the next year?

  * *Keep doing outreach efforts, videos, tutorials, hackathons, whatever to
    spread the voice more.*

  * *Python as a virtual dependency*

  * *The complaint I still have to field from people is "I tried to build a
    simple package, and Spack built Python and CMake and and and and..." so
    I think better deciphering of externals (which I know you're working on
    as we speak) would be good.*

  * *QA: less features but really solid CI on tagged releases, including
    packages.*

  * *Cross compiler support, new concreteizer*

  * *Documentation organisation, examples, and explicit API listing of all
     internal functionality.*

  * *New concretizer, maintainer bot*

  * *Build lots of buildcaches for each site to speed up builds. It could be
    nice to have a cloud repository could be AWS, GCP, where spack host all
    the buildcaches.*

  * *Fully-working backtracking concretizer*

  * *Don't lose momentum.*

## Are there key packages you'd like to see in Spack that are not included yet?

  * *Probably new build system support like Julia / Golang*

  * *I would like to be able to contribute one day adding the Uintah
    software suite*

  * *moose*

  * *WRF. I'm aware that it's now included in develop branch.*

  * *None that we haven't been able to rapidly write for ourselves.*

## Do you have any other comments for us?

  * *This project makes me enjoy coming into work.*

  * *Yes, I like spack, can't do without it now.*

  * *It would be great if <a
    href="https://github.com/spack/spack-configs">https://github.com/spack/spack-configs</a>
    included more DOE machines and were updated more frequently. If the
    administrators at computing centers provide these files somewhere it
    does not seem to be well advertised to users.*

  * *Pretty much every year my biggest victory with Spack is "they fixed the
    thing that was biggest gripe about Spack last year," which is a sign of
    a really good job listening to users, so keep that up.*

  * *Keep up the good work. I will continue using and supporting Spack for
    many years to come.*

  * *Keep being awesome! Spack is my favorite tool of the last 5 years!*

  * *It's easy to create a real tangle of versions and special builds. I
    think the project should work to maintain good communication with the
    application developers, so that standard or common/expected versions and
    dependency sets can be more clearly identified*

  * *Spack is extraordinary and blows away all past attempts to bring
    sanity to HPC software. I encourage you to offer commercial support.
    Please have support tiers that allow us to select an appropriate
    level of support.*
