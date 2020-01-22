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
optimet_repo=/path/to/rep optimet_version=master /path/to/optimate/OptiMate.sh

```
