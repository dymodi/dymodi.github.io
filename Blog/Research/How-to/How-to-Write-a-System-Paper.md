---
layout: single
title: How to Write a System Paper
permalink: /for-students/how-to-write-a-system-paper/
author_profile: true
classes: wide
date: Mar. 02, 2018
---



When writing a research paper, keep the following in mind (guideline from NSF for proposal writing):

- The importance of the problems addressed
- The novelty of the proposed solutions
- The technical depth
- The potential impact

Also keep in mind that **problem is** as **important** as (if not more important than) the solution.

Generally speaking, system paper refers to the paper published in **SenSys**, **MobiSys**, **MobiCom**.

Reminder for the whole paper:

* Different **levels of details** should be proposed in different parts of the paper. For example, the description on the same algorithm in the introduction, system overview, and design should be different.
* **Contents** in the different sections should **not** be **overlapping**, e.g., experiment settings should not be discussed in design and motivation should not be mentioned again in the experiment.
* Each part of the paper should be independent. It will be better that you don't need to revise other parts when some parts are revised.



## Title

Note the following points:

* Concise.
* Show the most innovative part of the paper
* Not misleading, that is, not include terminology in other fields.

If the title is something like "A New XX System based on YY", then YY must the major and innovative part in the design.


## Abstract

Abstract is a short version of Introduction, a tiny version of whole paper.

In an Abstract, we mainly provide the following four pieces of information:

* Background (and Vision)
* Problems (and Gaps)
* Our methods to solve the problems (narrow the gap)
* Our achievements (performance)

## Indroduction

Introduction is possibly the most important section of the paper, since reviewers and reads might choose to continue reading or give up after reading the Introduction. Usually we have the following paragraphs in the Introduction:

* Background (story)
* Related works
* Motivations, Challenges and Opportunities
* Solution we proposed
  * When you propose your solution, a related key question is that why you are the right person to do this? Do you have special data/experience/observation? It sounds like the opportunities, but must be related with you.
* Contribution of this paper

Applications should only be discussed in the Introduction.

## Motivation / Gap

The key point is related **data**, **figure** and **statistics**. In the motivation section, usually we answer the following questions:

* Why this problem is important?
* Why current solution won't work for this problem?
* Why simple alternatives won't work for this problem?
* What is the trigger of your solution?
* What is the incentive for people to use your system?

We don't need to cover all these questions but answer the ones that others may argue.

Motivation usually comes with observation, and observation will be bettern come with explanation or hypothesis.

If you are solving a problem within a special scenario (instant delivery), you may want to (explicitly) show the additional requirements of this scenario hence existing work fails to meet.

Motivation can be related to the design space, why our problem is different from those have been solved with existing solutions.

Note that motivation should be independent of our design.

## Challenges

In the Challenges section, we highlight the difficulties in solving the problem. It will be more convincing to include related **data**, **figure** and **statistics**. The key part in Challenges is:

* Why this problem is difficult?

Challenges should be **major** and **important**, and also should corresponds to the **major design** in our solution. A minor problem solved by some tricks in the solution should not be viewed as challenges. 

Another type of challenge is "Technical Challenge" is:

* Why this problem is difficult **by your solution**?

In order to show the technical challenges, the design should be briefly introduced.

Challenge can appear in many parts of the paper, abstract, introduction, design, etc. One of the purpose of stating challeng is to lead the readers to our way of sovling the problem. Sometimes how to disassemble the challenges implies how to solve the problem. We hope to make readers understand our thinking process when solving the problem.

## Opportunities

The Opportunities section should reveal the golden key, the very subtle angle that we can view and solve the problem, the **special observatio**n we found to trigger the following design. 

Opportunities are something we can not control, they are usually some special observations or phenomenon that trigger our design.

Better to be unique of this system/problem, compare with related problems that have been studied.

Better to be illustrated with related data, figure and statistics. The key point is:

* Why we can solve the problem?

If you have multiple opportunities, it will be better that those opportunities are somehow organized, such as spatial/temporal aspects. 

Also note that opportunities should be independent of our solution.

## Design / System / Solution

For top conference, like SenSys and MobiCom, the design must be simple and innovative.

When writing the design, **logic** and **hierarchy** are two most important things to keep in mind.

### System Overview

System overview is uesed to guide the specific design in the following. No need to show too much technical details.

A system overview is essential to show the architecture of the design/system. 

Keep the followings in mind:

* Input and output of each block should be clear.
* Avoid If-Else desgin.
* Blocks should not overlap or contain each other.

### Each Section of the System

* If some background knowledge is needed to understand the design, use one section (subsection) to explain the background briefly, because your readers need this. This background knowledge can be an existing technology or system.
* Keep in mind that you are not telling a story, you do not need to following the timeline, just focus the important parts.
* For a hardware system, each hardware component can be presented in a subsection.
* The main point and relation of the following **subsections** should be sketched before starting subsections.
* You should use the **first sentence** of each section to show the **function** of the module briefly.
* You can view each section as an individual paper, where you clarify the problem, motivation, challenge and solution.
* You should also view the section in a reader's view who is unfamiliar with your design. What's the things they want to know and what's the things they are interested in? Explain to them first.
* Domain knowledge (as a characteristic part in the paper) can be the design principle. For example, knowledge in POI applications can be used to guide POI clustering.
* Also keep in mind, each subsection should have some inner logical relations. 
* If some existing methods (Boositng, Random Forest) are used in your work, it's OK but you have to clarify why this method is used here. While of course, a borrowed method cannot be the core innovation of your work, then you must clarify you core innovation and contribution.
* A detailed figure of flow/organization of the subsystem can be provided although it may be provided in the system overview (as a small box).

## Implementation

* Platform or Deployment (better with real photos)
* Data collected for the design can also be listed here.
* Can be an individual section or a subsection in Evaluation
* API used in system can be provided for better understanding of the system.


## Evaluation

Evaluation is not a simple show off of our own system, but a comprehensive test of our system: 

* How it performs compared with baseline and existing work? 
* How it performs when components varies at different dimensions? (X axes) (Weather, noise, density, ...)
* How it performs for different indicators? (Y axes) (Error rate, profit, ...)
* It performs better under what cases? Why?
* It performs worse under what cases? Why? What inspiration we have for following works?

Also note that the cases in the evaluation section can be only a subset of the design section.

In order to evaluate the single module, we can set baselines of our design with or without the module.

**Frequent Use X-axis**: Amount of data, Parameters in design, CDF

**Frequent Use Y-axis**: Error, Precision, Recall, CDF

**Recommended Subsection Structure:**

1. Metrics
2. Baseline Approach (Note that it is not enough to compare with greedy approach)
3. Dimension A (X axes A)
4. Dimension B (X axes B)
5. Dimension C (X axes C)
6. Summary

**Another Recommended Subsection Structure:**

1. Evaluation Methodology (Data source, Baslines, Metirc, Groundtruth)
2. Evaluation Results (of different dimensions)

**In-field Experiments**

For system paper, it will be better to deploy the system to the real world and conduct some (small-scale) in-field experiements. It can be a special case of the whole evaluation section that we can get some insight of our design and test the practicability of our design.


## Related Works

"Your work should be a natural extension of the exisiting work in the community." Keep this in mind and find the related works in the target conferences.

Taxnonmy

We need to find a design space that excludes all the other existing works. Or we can find two dimensions that divide the design space into four parts and our work is the only work in one part. When seeking for dimensions, note that the scale is not a very good dimension since research works are usually thought to be scalable.

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
  * **CDF**: show the distribution of error



## Advice from Desheng

* First you need to bring out a **problem**: this problem cannot be too specific, which will lose expansibility, this problem cannot be too difficult otherwise people won't believe it can be solved. You do not need to solve the problem perfectly in the end, but you must shed some light on this problem.
* **Evaluation** is important hence must be solid. You must show that your system can work in real world. Other works that has not massive dataset but more intensive experiment results can be a strong competitor.
* **Discussion** section is important, you must articulate that your work can be generalize to other similar problems.
* **Related Works** is also important, the paper you cite shows your undesrstand of this field. If your reference are most low-quality publications, your work's quality will be suspected. If your reference are most other fields (e.g. KDD), there is a possiblity that you are outside the scope.
* You must let the reviewer learn something from your paper.
* It will be better that your work can be cited in the future (e.g. open data-set), otherwise the editor will choose other potential submissions. You will be happy if your work can be followed.
* If your problem has too many uncertainties, you can fix some spatial-temporal scenarios hence that the  uncertainty reduce to a sovlable level.
* Compared with Data paper, the Design section is short, (since a complicated design usually won't work in real world), while the Evaluation section is long because there are much effort in evaluation.



## Comments from Miao

* I expected paragraphs composed of arguments and their supporting materials. Arguments without supporting look strange. Casual materials without argument is also meaningless.
* The whole paper and each component should be well organized. Adjacent contents such as sentences should be connected.