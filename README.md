# OptiMate
Tool for building OPTIMET (https://github.com/OPTIMET/OPTIMET), principly to make it easy for users on UCL clusters to build their own development copies, but with modification to `deps.sh` should also work elsewhere.

To use OptiMate, clone the repo on a UCL RC Cluster (e.g. Myriad, Kathleen) and pick a directory where you want to compile OPTIMET.

Then run:

```bash
/path/to/optimate/OptiMate.sh
```

This will fetch and build Belos and OPTIMET v1.0.1 in the current directory with a time-stamp.

You can control this process by passing variables, so for example if you have your own fork of OPTIMET in a local git repo, you can do:

```bash
optimet_repo=/path/to/repo optimet_ver=master /path/to/optimate/OptiMate.sh

```

If you want to modify the way things are build (particularly libraries) you can modify `deps.sh`.  One thing to be aware of is that you cannot build OPTIMET using the version of Scalapack included in current (at least 2017 onwards) MKL because it lacks the required BLACS object files that OPTIMET needs.  It is therefore necessary to compile Scalapack from source.
