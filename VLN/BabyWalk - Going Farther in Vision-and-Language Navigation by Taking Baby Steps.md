# BabyWalk: Going Farther in Vision-and-Language Navigation by Taking Baby Steps

[\[paper\]](2005.04625.pdf) [\[code\]](https://github.com/Sha-Lab/babywalk)

## Motivation

**Generalize** what is learnt in shorter paths to longer ones.

*Enforce generalizability in training by curriculum*
*Can curriculum learning promote generalizability*

### Test-ground

+ Benchmark datasets: R2R, R4R, R6R & R8R
+ Metric: [[General Evaluation for Instruction Conditioned Navigation using Dynamic Time Warping|SDTW]]. *RCM performs worse with fidelity enabled but the author said*
	> Note that the agent trained to optimize the aforementioned fidelity measure (RCM(fidelity)) performs better than the agent trained to reach the goal only (RCM(goal)), supporting the claim by Jain et al. (2019) that following instructions is a more meaningful objective than merely goal-reaching.
	
	*This argument is rather un-grounded.*

## Proposed Method

> **Decomposing long instructions into shorter ones (BabySteps)** and completing them sequentially. A special design memory buffer is used by the agent to turn its **past experiences into contexts** for future steps.

*Resembles atomic functions in VQA?*
*Similar to RNN in design, which is actually common in RL agents for VLN*

### Learning progress
1. imitation learning: Demonstrations $\to$ BabySteps in a student-forcing fashion
	+ bite-size training examples
		*Newly generated? Can be borrowed for our study potentially. Similar approach of truncating at none and perform alignment at landmark level through DP. See the appendix for details.*
1. curriculum-based reinforcement learning with increased number of BabySteps at a time in each lecture.
	*Still in a forcing way between each set of BabySteps. Strange to me at first by well understandable with the second thought.*

## Other Comment

+ *Treating generalization as transfer learning? Optimal transport? Distribution of datasets specified by (x, y=(a,s)) i.e. inst, act seq, env seq.?*
+ *Read [[General Evaluation for Instruction Conditioned Navigation using Dynamic Time Warping|SDTW]] paper. It seems that the CLS team proposed it as a better metric and use CLS for reward only? Need to compare ours with it.*

