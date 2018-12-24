---
layout: post
title: How to Write a System Paper
date: Mar. 02, 2018
author: Yi DING
---



When writing a research paper, keep the following in mind (guideline from NSF for proposal writing):

- The importance of the problems addressed
- The novelty of the proposed solutions
- The technical depth
- The potential impact

Also keep in mind that **problem is as important as** (if not more important than) **the solution**.

Generally speaking, system paper refers to the paper published in **SenSys**, **MobiSys**, **MobiCom**.

## Title

Note the following points:

* Title should be concise.
* Title should show the most innovative part of the paper
* Title should not be misleading, that is, not include terminology in other fields.


## Abstract

Abstract is a short version of Introduction, a tiny version of whole paper.

In an Abstract, we mainly provide the following four pieces of information:

* Background (and Vision)
* Problems (and Gaps)
* Our methods to solve the problems (narrow the gap)
* Our achievements (performance)

## Indroduction

Introduction is possibly the most important section of the paper, since reviewers and reads might choose to continue reading or give up after reading the Introduction. Usually we have the following paragraphs in the Introduction:

* The background (story)
* Related works
* Challenges and motivations
* The solution we proposed
* The contribution of this paper

Applications should only be discussed in the Introduction.

## Motivation / Gap

Motivation section is a quantify of motivation paragraph. The key point is related **data**, **figure** and **statistics**. In the motivation section, usually we answer the following questions:

* What is the problem we want to solve?
* Why this problem is important?
* Why current solution won't work for this problem?
* Why simple alternatives won't work for this problem?

Motivation usually comes with observation, and observation will be bettern come with explanation or hypothesis.

Note that motivation should be independent of our design.

## Challenges

In the Challenges section, we highlight the difficulties in solving the problem. It will be more convincing to include related **data**, **figure** and **statistics**. The key part in Challenges is:

* Why this problem is difficult?

## Opportunities

The Opportunities section should reveal the golden key, the very subtle angle that we can view and solve the problem, the special observation we found to trigger the following design. 

Better to be unique of this system/problem, compare with related problems that have been studied.

Better to be illustrated with related data, figure and statistics. The key point is:

* Why we can solve the problem?

## Design / System / Solution

For top conference, like SenSys and MobiCom, the design must be simple and innovative.

For some other conference, like INFOCOM, existing methods can be used, such as XGBoost. 

**Recommended Structure:**

1. Overview
2. First module
3. Second module

## Implementation

* Platform


## Evaluation

Evaluation is not a simple show off of our own system, but a comprehensive test of our system: 

* How it performs compared with baseline and existing work? 
* How it performs when components varies at different dimensions? (X axes) (Weather, noise, density, ...)
* How it performs for different indicators? (Y axes) (Error rate, profit, ...)
* It performs better under what cases? Why?
* It performs worse under what cases? Why? What inspiration we have for following works?

Also note that the cases in the evaluation section can be only a subset of the design section.

**Recommended Structure:**

1. Metrics

2. Baseline Approach (Note that it is not enough to compare with greedy approach)

3. Dimension A (X axes A)

4. Dimension B (X axes B)

5. Dimension C (X axes C)

6. Summary

**In-field Experiments**

For system paper, it will be better to deploy the system to the real world and conduct some (small-scale) in-field experiements. It can be a special case of the whole evaluation section that we can get some insight of our design and test the practicability of our design.


## Related Works

Taxnonmy

We need to find a design space that excludes all the other existing works.

A more organized related work section would show the significance of the topic, a **table** to organize all these papers into categories. 

Note that all the related topics need to be referred.

## Discussion

Some lessons learned and insights about how our design could be potentially generalizable to other problem in the related fields.

The discussion is also a very important section that you must articulate why your result in certain cases can be generalized to a broad areas.



## Figures

The figures in the paper serve different purpose. More examples can be found [here](https://github.com/dymodi/dymodi.github.io/blob/master/Research/Writing/How-to-Make-a-Figure.md). Specifically,

* Show the facts of the problem: X: time, Y: index
  * **Line graph**
  * **Bar graph**: line graph with standard variation
  * **CDF**: show the distribution of a variable
  * **Spatial feature layer**
* Show the relation of two variables:  X: Var1, Y: Var2
  * **Scatter plots**
  * **Correlation plot**
  * **Correlation matrix**: A heatmap can be used to show the correlation between multiple variables.
  * **QQ-plot**: Show the similarity of two distributions

* Show the system architechure
  * **System architechure**
  * **User interface**
* Show the facts of the data:
  * **Spatial feature layer**: Spatial-temporal heatmap on map, such as density, OD trace, partition
* Show the evaluation results:
  * **Line graph**: compare our results with baselines



## Advice from Desheng

* First you need to bring out a problem: this problem cannot be too specific, which will lose expansibility, this problem cannot be too difficult otherwise people won't believe it can be solved. You don't need to solve the problem perfectly in the end, but you must shed some light on this problem.
* Discussion section is important, you must articulate that your work can be generalize to other similar problems.
* You must let the reviewer learn something from your paper.
* It will be better that your work can be cited in the future (e.g. open data-set), otherwise the editor will choose other potential submissions.
* If your problem has too many uncertainties, you can fix some spatial-temporal scenarios hence that the  uncertainty reduce to a sovlable level.