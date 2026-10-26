# Lab 1: Environment Setup

## 1. Objective

The purpose of this lab is to check your environment settings and to make sure you can compile and run CUDA programs on the environment you will be using throughout the course, CSC's Roihu supercomputer. In this lab, you will:

- Get a copy of the assignment package and walk through the directory structure
- Set up the environment for executing the assignments
- Test the environment with a simple program that just queries what GPU device is attached

## 2. Preliminary work

**Step 1:** Use the instructions available on Moodle to set up your CSC account and request to join the "GPU Programming 2026" project. The same instructions explain how to set up multi-factor authentication and your SSH access to Roihu.

**Step 2:** Log in to the GPU side of Roihu:

```bash
ssh <username>@roihu-gpu.csc.fi
```

The SSH certificate that Roihu requires is valid for only 24 hours. If the login is refused after a day, your certificate has expired: get a new one (see the instructions on Moodle) and log in again.

**Step 3:** Clone the repository you will be using for all the lab assignments from the public repository by executing the following command in the directory where you would like to put it:

```bash
git clone https://github.com/jolilius/GP26_Labs.git
```

**Step 4:** Change into the new directory.

```bash
cd GP26_Labs
```

You are now ready to begin the lab.

## 3. Compile and execute the CUDA program

The Roihu GPU nodes use ARM processors (NVIDIA Grace), and each node has four NVIDIA GH200 GPUs. Programs that use a GPU run on a compute node in a Slurm job; the login node is only for preparing and submitting the work.

**Step 1:** Look at the lab directory. `main.cu` is the program, `Makefile` builds it, and `run.sh` is the batch script that builds the program on a compute node and runs it.

```bash
cd Lab_1
cat run.sh
```

**Step 2:** Submit the job with one GPU. Use the CSC project you joined in the preliminary work (shown in MyCSC) as the account:

```bash
sbatch --account=<your-project> run.sh
```

Slurm prints the job number. The output is written to `lab1_<jobnumber>.out`; wait for the job to finish (`squeue --me` shows your jobs) and then read the file. You should expect to see something like the following message:

```text
There is 1 device supporting CUDA

Device 0: "NVIDIA GH200 120GB"
  Major revision number:                         9
  Minor revision number:                         0
  Total amount of global memory:                 102005473280 bytes
  Number of multiprocessors:                     132
  Total amount of constant memory:               65536 bytes
  Total amount of shared memory per block:       49152 bytes
  Total number of registers available per block: 65536
  Warp size:                                     32
  Maximum number of threads per block:           1024
  Maximum sizes of each dimension of a block:    1024 x 1024 x 64
  Maximum sizes of each dimension of a grid:     2147483647 x 65535 x 65535
  Maximum memory pitch:                          2147483647 bytes
  Texture alignment:                             512 bytes
  Clock rate:                                    1.98 GHz
  Concurrent copy and execution:                 Yes

TEST PASSED
```

**Step 3:** Submit the job again, this time with all four GPUs of a node. Only the resource request changes:

```bash
sbatch --account=<your-project> --gres=gpu:gh200:4 run.sh
```

The output should now list four devices.

**Step 4:** Submit the single-GPU and the four-GPU output files (`lab1_<jobnumber>.out`) to Moodle.
