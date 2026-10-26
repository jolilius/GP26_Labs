# Lab 4: Tiled Convolution

## 1. Objective

The purpose of this lab is to get you more familiar with shared memory tiling techniques, handling complex boundary conditions, and using constant memory.

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

**Step 2:** Edit the file main.cu to add the constant memory copy and set the block and grid dimensions correctly.

**Step 3:** Edit kernel.cu to implement the shared memory tiled convolution. Use zero padding if needed

**Step 4:** Compile and test your code.

```bash
make
./convolution # Uses the default input image size
./convolution <m> # Uses a square m x m input image
./convolution <m> <n> # Uses an (m x n) input image matrix
```

**Step 5:** Answer the following questions in a new file named answers.txt:

1. What is the floating-point computation rate for the GPU kernel in this application? How does it scale with the size of the input image? To answer this question, try multiple sized inputs and calculate the rate for each using the timing measurements provided in the code. Make sure to justify your choice of input sizes.
2. What percentage of time is spent as overhead for using the GPU? Consider as overhead: device memory allocation time and memory copy time to and from the device. Do not include problem setup time or result verification time in your calculations of overhead or total execution time. Try this with multiple input sizes and explain how the overhead scales with the size of your input?

**Step 6:** Submit your assignment. You need to submit the following files:

- main.cu
- kernel.cu
- answers.txt

Compress the files and name them after your student’s name and student id like so:

```
Lab4_Name_id.tar
```

Submissions with incorrect subject lines may not be processed.

## 4. Grading

Your submission will be graded based on the following criteria.

- Functionality/knowledge: 65%
  - Correct code and output results
  - Correct usage shared and constant memory to cover global memory access latency
  - Correct handling of boundary cases
- Answers to question: 35%
  - Correct answer to questions in step 4
  - Sufficient work shown
  - Neatness and clarity
