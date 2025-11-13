#!/bin/bash
#SBATCH -c 1
#SBATCH --gres=gpu:rtx_6000:1
#SBATCH --mem=64G
#SBATCH -t 1:00:00

# Need this module on bigblue, as well as "--gres=gpu:1"
#module load singularity

# Do not need AMBERHOME and
# the sif file can have a relative path like this example or a full path like /project/$USER/amber24-container
singularity exec --cleanenv --nv -B "/project:/project" ../../../pmemd24.sif pmemd.cuda -O -i mdin.GPU -o mdout.1GPU -inf mdinfo.1GPU -x mdcrd.1GPU -r restrt.1GPU

