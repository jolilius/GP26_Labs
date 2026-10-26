# Lab 1: Environment Setup

## 1. Objective

The purpose of this lab is to check your environment settings and to make sure you can compile and run CUDA programs on the environment you’ll be using throughout the course. In this lab, you will:

- Get a copy of the assignment package and walk through the directory structure
- Set up the environment for executing the assignments
- Test the environment with a simple program that just queries what GPU device is attached

## 2. Preliminary work

**Step 1:** Use the instructions available on Moodle to setup your CSC account and request to join the “GPU Programming 2025” project.

**Step 2:** Clone the repository you will be using for all the lab assignments from the public repository by executing the following command in the directory where you would like to put it:

```bash
git clone https://github.com/Alirezalm/GP25_Labs.git
```

**Step 3:** Change into the new directory.

```bash
cd GP25_Labs
```

You are now ready to begin the lab.

## 3. Compile and execute the CUDA program

**Step 1:** Change into the lab directory and compile:

```bash
cd Lab_1
make
```

**Step 2:** Execute the lab using Mahti **interactive** session.

```bash
./device-query
```

You should expect see something like the following message:

```text
There is 1 device supporting CUDA
Device 0: "Tesla T10 Processor"
Major revision number: 1
Minor revision number: 3
Total amount of global memory: 4294770688 bytes
Number of multiprocessors: 30
Number of cores: 240
Total amount of constant memory: 65536 bytes
Total amount of shared memory per block: 16384 bytes
Total number of registers available per block: 16384
Warp size: 32
Maximum number of threads per block: 512
Maximum sizes of each dimension of a block: 512 x 512 x 64
Maximum sizes of each dimension of a grid: 65535 x 65535 x 1
Maximum memory pitch: 2147483647 bytes
Texture alignment: 256 bytes
Clock rate: 1.30 GHz
Concurrent copy and execution: Yes
TEST PASSED
```

**Step 3:** Allocate **one compute node with four A100 GPUs** on Mahti and submit the program to use four GPUs.

**Step 4:** Submit single GPU and multi-GPU output files (.txt) to Moodle.
