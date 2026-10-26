# Lab 2: Vector Addition

## 1. Objective

The purpose of this lab is to get you familiar with using the CUDA API by implementing a simple vector addition kernel and its associated setup code.

## 2. Preliminary work

**Step 1:** Clone the repository you will be using for all the lab assignments from the public repository by executing the following command in the directory where you would like to put it:

```bash
git clone https://github.com/Alirezalm/GP25_Labs.git
```

**Step 2:** Change into the new directory.

```bash
cd GP25_Labs
```

You are now ready to begin the lab.

## 3. Procedure

**Step 1:** Update your local repository to obtain the code needed for the assignment.

```bash
cd <labs-directory>
git pull
```

**Step 2:** Edit the file main.cu to implement the following where indicated:

1. Allocate device memory
2. Copy host memory to device
3. Initialize thread block and kernel grid dimensions and invoke CUDA kernel
4. Copy results from device to host
5. Free device memory

**Step 3:** Edit the file kernel.cu to implement the vector addition kernel code.

**Step 4:** Compile and test your code.

```bash
make
./vecadd # Uses the default vector size
./vecadd <m> # Uses vectors of size m
```

**Step 5:** Submit your assignment. You only need to submit the following files:

- main.cu
- kernel.cu
- output.txt (program output)

Compress the files and name them after your student name and student id like so:

```
Name_id.tar
```

Submissions with incorrect subject lines may not be processed.
