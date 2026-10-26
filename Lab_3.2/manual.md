# Lab 3.2: Tiled Matrix Multiplication

## 1. Objective

The purpose of this lab is to get you familiar with using shared memory to write optimized kernel algorithms by implementing a “tiled” version of matrix multiplication.

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

**Step 2:** Edit main.cu and kernel.cu to include the host setup code and device kernel code where indicated.

**Step 3:** Edit the file kernel.cu to initialize the thread block and kernel grid dimensions and invoke the CUDA kernel, and to implement the matrix multiplication kernel code.

**Step 4:** Compile and test your code.

```bash
make
./sgemm-tiled # Uses the default matrix sizes
./sgemm-tiled <m> # Uses square m x m matrices
./sgemm-tiled <m> <k> <n> # Uses (m x k) and (k x n) input matrices
```

Your code is expected to work for varying input dimensions – which may or may not be divisible by your tile size. It is a good idea to test and debug initially with examples where the matrix size is divisible by the tile size, and then try the boundary cases.

**Step 5:** Answer the following question in a new file named answers.txt:

- In your kernel implementation, how many threads can be simultaneously scheduled for execution on a V100 GPU? Use:

```bash
nvcc --ptxas-options="-v" kernel.cu
```

to see the resource usage of your kernel (although compilation will fail, it will only do so after compiling the kernel and displaying the relevant information). Show your work.

**Step 6:** Submit your assignment. You need to submit the following files:

- main.cu
- kernel.cu
- answers.txt

Compress the files and name them after your student name and student id like so:

```
Lab3.2_Name_id.tar
```

Submissions with incorrect subject lines may not be processed.

## 4. Grading

Your submission will be graded based on the following criteria.

- Functionality/knowledge: 65%
  - Correct code and output results
  - Correct usage of CUDA library calls and C extensions
  - Correct handling of boundary cases
- Answers to questions: 35%
  - Correct answer to questions in step 5
  - Sufficient work is shown
  - Neatness and clarity
