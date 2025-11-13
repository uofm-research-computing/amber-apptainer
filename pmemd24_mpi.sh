#!/bin/bash
#SBATCH -n 2
#SBATCH --gres=gpu:rtx_6000:2
#SBATCH --mem=64G
#SBATCH -t 1:00:00

# Need this module on bigblue
#module load singularity

# for multiple gpus
srun --mpi=pmi2 --gpus-per-task=1 singularity exec --cleanenv --nv -B "/project:/project" ../../../pmemd24.sif pmemd.cuda.MPI -O -i mdin.GPU -o mdout.1GPU -inf mdinfo.1GPU -x mdcrd.1GPU -r restrt.1GPU
