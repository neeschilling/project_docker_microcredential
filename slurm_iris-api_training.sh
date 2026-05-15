#!/bin/bash
#SBATCH --job-name=iris-api_training
#SBATCH --mail-user=neeltje.schilling@psb.vib-ugent.be
#SBATCH --mail-type=end #### NONE, BEGIN, END, FAIL, REQUEUE, ALL
#SBATCH --mem=4G
#SBATCH -e "slurm_%x_%j.error"  ## %x takes job name; %j takes job ID
#SBATCH -o "slurm_%x_%j.out"
#SBATCH --time=00:05:00

#purges all loaded modules
module purge


#set directory to folder
cd /scratch/gent/510/vsc51046/docker_project/project_docker_microcredential

#runs the training.py script using the created image
singularity run -B .:/app/models iris-api_training.sif python train.py

#Sleep 5 seconds before creating report
sleep 5

# Creating resources report
echo "=== Report resources usage ==="
sacct -j $SLURM_JOBID  --format=jobid,partition,elapsed,state,totalcpu,maxrss,averss