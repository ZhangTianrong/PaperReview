# General Evaluation for Instruction Conditioned Navigation using Dynamic Time Warping

[\[paper\]](1907.05446.pdf)

*Last revised in Nov 2019, NeurIPS. It is our fault to have not noticed this article.*

## Motivation
A better (**effective and efficient**) metrics that evaluates **both success and fidelity**. 
*This is similar to our goal. Good to see how they address efficiency ([[General Evaluation for Instruction Conditioned Navigation using Dynamic Time Warping#Efficiency]]) given that we both use DTW as our starting point*.

**SED & CLS have limitations that result in gap in evaluation of VLN models**. 
*This is something we might want to dig further about, to see what kind of limitations they are focusing on*.
*It seems that they are mostly concerned about the ignorance of action orders in evaluating CLS and the account is similar to ours, i.e. more like a narrative with examples than a proof of some sort*.

*Probably the biggest lesson we can learn from this article is how to structure a paper about metrics, including what experiments to do to convince the readers.*

## Proposed Metrics

***Definition:*** (nDTW)
$$
\mathrm{nDTW}(R,Q) = \exp\left(-\frac{\mathrm{DTW}(R,Q)}{|R|\cdot d_{th}}\right)
$$
with $R$ the reference sequence and $Q$ the predicted one. $d_{th}$ is the threshold distance. *Like a soft margin I guess*.

*This is simply normalizing and remapping DTW to [0,1]*.

***Definition:*** (SDTW)
$$
\mathrm{SDTW}(R,Q) = SR(R,Q)\cdot \mathrm{nDTW}(R,Q)
$$
where $\mathrm{SR}(R,Q)$ is 1 when it's a success and 0 otherwise. $d_{th}$ is often used in determining whether it's a success or not.

*This is the way to entangle SR and fidelity? $\mathrm{SR}(R,Q)$ is an indicator that is either 1 or 0, which in my view can be problematic.*
*They did a study on UC and SC metrics in the appendix which might account for this?*

### Efficiency

> (DTW and nDTW can be) exactly computed in quadratic time and
space complexity and approximately computed in linear time and space complexity.

*This is possibly the thing we missed? Approximated algorithm? I doubt that when normalized, the approximation ratio can be messed up!*

> In algorithms such as FastDTW where interpolation is required, a simple adaptation—sampling nodes—can be made for discrete environments.

#### Algorithms

![[Pasted image 20201224150435.png]]

*Doesn't seem to be approximated at all. The same DP implementation as ours. This means the bottleneck of our metrics is still the part about evaluating the similarity between scene points.*

## Validating the metric

### Human evaluations

> we give human raters a series of questionnaires each containing a set of five reference and query path (*i.e. the predicted paths*) pairs. In each set, we keep the reference path fixed and instruct raters to rank the path pairs in response to this question: “If I instructed a robot to take the blue path, which of these orange paths would I prefer it to take?"

*A potential problem with this validation is that they are comparing paths and the instructions are not provided. This distinguishes their and ours; we argued that path-based metrics are inadequate*.

### Using them as reward signals

*Didn't seem to have provided details on what model was used and apparently only one model is studied.*

Yield better results in both nDTW, SDTW and prior metrics like CLS and SPL *(should SPL be higher?)*.