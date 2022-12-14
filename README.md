# Computer Architechture and Design Revision Resources

+ [Introduction](#introduction)
+ [Reading Checklist](#reading-checklist)
+ [Past Papers](#past-papers-(44-total))
+ [Basic RISC-V Instruction Set](#basic-risc-v-instruction-set)
+ [Classic-RISC-V-Piplined-design](#classic-five-stage-pipeline-for-a-risc-processor)
+ [Piplened Processor Design](#pipelined-processor-design)
+ [Pipeline Hazards](#pipeline-hazards)
+ [Booth Coding](#booth-coding)
+ [Tomasulo's Algorithm](#tomasulo's-algorithm)

## Introduction

This repo contains all of the readings, past papers and some notes for Computer
Architecture and Design at the University of Edinburgh. Feel free to clone this
repo to track your own revision or make a pull request if something is missing.
Blank versions of the checklists can be found in the files `reading_list.md` and 
`paper_list.md`.

## Reading Checklist (21 total)

- [ ] _Introduction_, H&P, sections 1.1 - 1.6
- [ ] _Principles_, H&P, sections 1.8 - 1.9
- [ ] _Boolean Logic_, M&C, chapter 2
- [ ] _Logic Minimisation_, M&C Chapter 3
- [ ] _ISA_, H&P, appendix A
- [x] _Pipelined Processor Design_, H&P, section C-1
- [x] _Pipeline Hazards_, H&P, section C-2
- [ ] _Latches and FLip Flops_, M&C sections 5.1 to 5.4
- [ ] _Sequential Logic_, M&C sections 5.5 to 5.8
- [ ] _Sequential Logic_, M&C sections 8.4 to 8.6
- [ ] _RTL Design_, M&C chapter 8
- [ ] _Branch Prediction_, H&P, pp. C-22 to C-26, and C-35 to C-37
- [ ] _Branch Prediction_, H&P, section 3.3
- [ ] _Dynamic Instruction Scheduling_, H&P, section 3.4 to 3.6
- [ ] _Tomasulo's Algorithm_, H&P, pp. 195 to 208, and section 3.9
- [ ] _High Speed Addition_, M&C, section 4.5; H&P-online J-37 to J-41
- [x] _Multipliers_,  H&P-online, sections J-50 to J-54
- [ ] _Memory Heirarchies_,  Introductory : H&P appendix B 
- [ ] _Cache Performance Enhancements_,  Advanced : H&P chapter 2 
- [ ] _Advanced Arithmetic Functions_, H&P-online, sections J-17 to J-20
- [ ] _Main memory and error correction_, M&C, pp. 394 to 410

## Past Papers (44 total)

### Computer Architecture and Design (2 total)

- [ ] 2021/2022 
- [ ] 2019/2020

### Computer Architecture (20 total)

- [ ] 2017/2018
- [ ] 2016/2017
- [ ] 2016/2017 resit
- [ ] 2015/2016 
- [ ] 2015/2016 resit
- [ ] 2013/2014 
- [ ] 2012/2013 
- [ ] 2011/2012 
- [ ] 2010/2011 
- [ ] 2010/2011 resit
- [ ] 2009/2010 
- [ ] 2009/2010 resit
- [ ] 2008/2009 
- [ ] 2008/2009 resit
- [ ] 2007/2008 
- [ ] 2007/2008 resit
- [ ] 2006/2007 
- [ ] 2005/2006 
- [ ] 2005/2006 resit
- [ ] 2004/2005

### Computer Design (22 total)

- [ ] 2004/2005
- [ ] 2005/2006
- [ ] 2006/2007
- [ ] 2006/2007 resit
- [ ] 2007/2008
- [ ] 2007/2008 resit
- [ ] 2008/2009
- [ ] 2008/2009 resit
- [ ] 2009/2010
- [ ] 2010/2011
- [ ] 2010/2011 resit
- [ ] 2011/2012
- [ ] 2011/2012 resit
- [ ] 2012/2013
- [ ] 2012/2013 resit
- [ ] 2013/2014
- [ ] 2013/2014 resit
- [ ] 2015/2016
- [ ] 2015/2016 resit
- [ ] 2016/2017
- [ ] 2017/2018
- [ ] 2018/2019

## Basic RISC-V instruction set

1. _Instruction Fetch Cycle_ (`IF`) 
    Send the program counter (PC) to memory and fetch the current instruction
    from memory. Update the pc to the next sequential PC by adding 4 (becuase
    each instruction is 4 bytes) to the PC.

2. _Instruction decode/register fetch cycle_ (`ID`) 
    Decode the instruction and read the registers corresponding to register
    source specifiers from the register file. As the registers are read, do the
    equality test to check for a possible branch. If it is needed, sign extend
    the offset field of the instruction. In an agressive implmentation, we can
    complete the branch at this stage by storing the branch target address in
    the PC if the condition was true.  This technique is known as fixed field
    decoding. In this implementation we may read a register we aren't using
    which won't hurt performance but does have an energy impact.

3. _Execution/effective address cycle_ (`EX`)
  The ALU operates on the operands prepared in the prior cycle, performing one
  of three functions depending on  the operand type

  - Memory reference - The ALU adds the base register and the offset to form
    the effective address

    ```c
    ...
    return 0;
    ```

  - Register-Register - The ALU performs the operation specified by the ALU
    opcode on the values read from the register file. 

    ```c
    int x = y + z;
    ```

  - Register-Immediate - The ALU performs the operation specified by the ALU
    opcode on the register from the register file (the first value) and the
    sign extended immediate value. 

    ```c
    int x = 10;
    ```

4. _Memory Access_ (`MEM`)
  There are two cases in the `MEM` stage

  - The instruction is load, the memory does a read using the effective address
    computed in the previous cycle.

  - The instruction is store, the memory writes the data from the second
    register from the register file to the effective address 

5. _Write-back cycle_ (`WB`)
  Register-Register ALU instruction or load instruction: Write the result to
  the register file whether it comes from memory (load) or the ALU.


## Classic Five-Stage Pipeline for a RISC Processor

| Instruction Number | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
|--------------------|---|---|---|---|---|---|---|---|---|
| instruction i      |IF | ID| EX|MEM| WB|   |   |   |   |
| instruction i+1    |   | IF| ID|EX |MEM|WB |   |   |   |
| instruction i+2    |   |   | IF|ID | EX|MEM|WB |   |   |
| instruction i+3    |   |   |   |IF | ID| EX|MEM|WB |   |
| instruction i+4    |   |   |   |   | IF| ID|EX |MEM|WB |

## Pipelined Processor Design

_Pipelining_ is an implementation technique whereby multiple instructions are
overlapped in execution; it takes advantage of parallelism that exists among
the actions needed to execute an instruction. Today, pipelining is the key
implementation technique used to make fast CPUs.

All stages need to proceed at the same time, for this reason the length of a
processor cycle is determined by the time required for the slowest pipe stage.
In a computer, this processor cycle is typically 1 clock cycle (sometimes 2 but
_rarely_ more).

Thus we aim to balance the length of each pipeline stage. If the stages are
perfectly balanced then the time per instruction on the pipelined machine
(_assuming ideal conditions_) is given by

```math
\frac{\text{Time per instruction on unpiplined machine}}{\text{Number of pipe stages}}
```

Under these conditions the speedup would be $n$ where $n$ is the number of pipe
stages. However, the stages are not usually perfectly balanced. Therefore, the
time per instruction on the pipelined processor will not have it's minimum
possible value, yet it can be close.

Pipeling can either be viewed as reducing the number of clock cycles per
instruction, if the processor usually takes multiple cycles per instruction. If
the processor typically takes 1 cycle per instruction then it can be seen as
reducing the time per cycle. Alternatively, it can be seen as a combination of
the two.

The advantage to pipeling is it cannot be seen by the programmer unlike some
other speedups. 

### Example

> Example: Consider the unpipelined processor in the previous section. Assume
> that it has a 1 ns clock cycle and that it uses 4 cycles for ALU operations
> and branches and 5 cycles for memory operations. Assume that the relative
> frequencies of these operations are 40%, 20%, and 40%, respectively. Suppose
> that due to clock skew and setup, pipelining the processor adds 0.2 ns of
> overhead to the clock. Ignoring any latency impact, how much speedup in the
> instruction execution rate will we gain from a pipeline?

In the unpipelined implmentation we have the avergae instruction execution time of

```math
\text{Average Instruction Execution Time} = \text{Clock Cycle} \times \text{Average CPI}
```

```math
= 1ns \times ( 40\% + 20\% ) \times 4 + 40\% \times 5 = 4.4ns
```
In the pipelined processor we have the slowest stage which is $1ns$ plus the pipelinis overhead $0.2$ which results in

```math
\frac{\text{Time per instruction on unpiplined machine}}{\text{Number of pipe stages}}
```

```math
\frac{4.4}{1.2} = 3.7 \text{ times faster}
```

## Pipeline Hazards

The reason that pipelining cannot operate at it's fastest are situations,
called hazards. Hazards reduce the performance from the ideal speedup gained by
pipelining. There are three classes of hazards. 

+ _Structural Hazards_ happens when the hardware cannot support every case of
   the current instructions.

+ _Data Hazards_ arise when an instruction in the pipeline depends on the
  results of a previous instruction that is exposed by the overlapping of
  instructions in the pipeline.

+ _Control Hazards_ arise from the pipeling of instructions that modify the PC

Hazards make it necessary to stall the pipeline and wait for the execution of
the instruction

## Booth Coding

Booth coding involves translating multiplications into powers of 2 to
reduce the number of operations required to complete it. There are
three cases. Start at $P_0$ where $P$ is the multiplier. Move one
position to the left and check the condition as listed below. In all
cases ignore overflow.

1. `01` add the multiplicand
2. `10` subtract the multiplicand
3. `00` or `11`, do nothing



> Example: 6*2:

```
	    001100  = 6
     x  000010  = 2
	 
	    000000  <- zero followed by zero, do nothing
	 - 000010   <- zero into one, subtract multiplicand
	 000000     <- one followed by one, do nothing
  + 000010      <- one into zero, add multiplicand
  ------------
    0000001100  = 12
```

## Tomasulo's Algorithm

Tomasulo's Algorithm is a hardware algorithm for the dynamic
scheduling of instructions that allows for out of order execution and
enables more efficient use of multiple execution units. The major
innovation was register renaming in hardware and reservation stations
for all functional units.

### Register Renaming

Tomasulo's algorithm performs _out of order execution_ through
register renaming.  All reservation stations hold either a real value
or a placeholder value.  If a real value if unavailable during the
issue stage then a placeholder value is used. The placeholder value is
the reservation station that will produce the correct value.  When the
function unit is finished execution, everywhere that references the
reservation station for that value will be replaced with the real
value.

### Example (blank)

```asm
flw f6
flw f2
fmul f0  f2 f4
fsub f8  f6 f2
fdiv f10 f0 f6
fadd f6  f8 f2
```
> The program

| Instruction | j  | k  | Issue | Done | Write |
|-------------|----|----|-------|------|-------|
| flw F6      | 34 | x2 | 1     |      |       |
| flw f2      | 45 | x3 |       |      |       |
| fmul f0     | f2 | f4 |       |      |       |
| fsub f8     | f6 | f2 |       |      |       |
| fdiv  f10   | f0 | f6 |       |      |       |
| fadd f6     | f8 | f2 |       |      |       |
> The table of instructions 

| Time | Name  | Busy | Op | Vj | Vk | Qj | Qk |
|------|-------|------|----|----|----|----|----|
|      | Add1  | No   |    |    |    |    |    |
|      | Add2  | No   |    |    |    |    |    |
|      | Add3  | No   |    |    |    |    |    |
|      | Mult1 | No   |    |    |    |    |    |
|      | Mult2 | No   |    |    |    |    |    |
> Reservation stations (operations)

| Entry | Busy | Address |
|-------|------|---------|
| Load1 | Yes  | 34+X2   |
| Load2 | No   |         |
| Load# | No   |         |
> Reservation stations (load)

|              | F0 | F2 | F4 | F6    | F8 | F10 | F12 | ... | F31 |
|--------------|----|----|----|-------|----|-----|-----|-----|-----|
| Producing RS |    |    |    | Load1 |    |     |     | ... |     |
> Result

### Example (Described)

1. Issue FLW to the reservation station Load1, hence F6 producer set to Load1
2. Issue second FLW to the reservation station Load2, F2 producer set to Load2
3. Issue fmul to mult1, Vk set to F4 (no dependency), Qj set to Load2 (RAW on F2)
   - fmul cannot start until Qj is resolved
   - F0 producer set to Mult1
4. FLW #1 is done so everywhere that depends on Load1 can be set to the value on the next clock
5. etc...
