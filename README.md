# Computer Architechture and Design Revision Resources

- [Reading Checklist](#reading-checklist)
- [Past Papers](#past-papers-(44-total))
- [Piplened Processor Design](#pipelined-processor-design)

## Reading Checklist (21 total)

- [ ] _Introduction_, H&P, sections 1.1 - 1.6
- [ ] _Principles_, H&P, sections 1.8 - 1.9
- [ ] _Boolean Logic_, M&C, chapter 2
- [ ] _Logic Minimisation_, M&C Chapter 3
- [ ] _ISA_, H&P, appendix A
- [ ] _Pipelined Processor Design_, H&P, section C-1
- [ ] _Pipeline Hazards_, H&P, section C-2
- [ ] _Latches and FLip Flops_, M&C sections 5.1 to 5.4
- [ ] _Sequential Logic_, M&C sections 5.5 to 5.8
- [ ] _Sequential Logic_, M&C sections 8.4 to 8.6
- [ ] _RTL Design_, M&C chapter 8
- [ ] _Branch Prediction_, H&P, pp. C-22 to C-26, and C-35 to C-37
- [ ] _Branch Prediction_, H&P, section 3.3
- [ ] _Dynamic Instruction Scheduling_, H&P, section 3.4 to 3.6
- [ ] _Tomasulo's Algorithm_, H&P, pp. 195 to 208, and section 3.9
- [ ] _High Speed Addition_, M&C, section 4.5; H&P-online J-37 to J-41
- [ ] _Multipliers_,  H&P-online, sections J-50 to J-54
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

$$
\frac{\text{Time per instruction on unpiplined machine}}{\text{Number of pipe stages}}
$$

Under these conditions the speedup would be $n$ where $n$ is the number of pipe
stages. However, the stages are not usually perfectly balanced. Therefore, the
time per instruction on the pipelined processor will not have it's minimum
possible value, yet it can be close.
