# Amber pmemd singularity/apptainer container
This container runs the non-commercial version of pmemd of the Amber molecular dynamics project.

# Build
Get this project:
```
git clone https://github.com/uofm-research-computing/amber-apptainer.git
cd amber-apptainer
```

Make sure to put your copy of pmemd24.tar.bz2 in this directory, no need to extract it. Then, from this directory, run:
```
singularity build --fakeroot pmemd.sif singularity_pmemd24.def
```

This will produce an image file called pmemd.sif. You can take a look in the container file system with:
```
singularity shell --cleanenv pmemd24.sif
```

pmemd24 is installed in /opt. Type `exit` to leave the shell.

# Usage
You can execute the pmemd.cuda command on a node with a GPU with:
```
singularity exec --nv --cleanenv pmemd24.sif pmemd.cuda ...
```

Where `...` are the options.

You can also add that line to submission script similar to pmemd24.sh example in this repo.

# Example
Get the amber benchmark files:
```
wget https://ambermd.org/Amber24_Benchmark_Suite.tar.gz
tar -xzf Amber24_Benchmark_Suite.tar.gz
```

Put the submission script in our work directory:
```
cp pmemd24.sh ./Amber24_Benchmark_Suite/PME/STMV_production_NPT_4fs/
cd ./Amber24_Benchmark_Suite/PME/STMV_production_NPT_4fs/
```

Submit the job:
```
sbatch pmemd24.sh
```

# Citations and other reading material

[NGC ubuntu container](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/cuda?version=12.4.1-devel-ubuntu22.04)

[Amber performance information](https://ambermd.org/GPUPerformance.php)

[The amber project](https://ambermd.org/index.php)

[Amber-MD dockerfile](https://github.com/Amber-MD/common-dockerfiles/blob/master/cuda-opencl/Dockerfile)
