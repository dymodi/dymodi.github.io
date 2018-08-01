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

Also keep in mind that problem is as important as (if not more important than) the solution.

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
* Challenges and motivations
* Related works
* The solution we proposed
* The contribution of this paper

Applications should only be discussed in the Introduction.

## Motivation / Gap

Motivation section is a quantify of motivation paragraph. The key point is related **data**, **figure** and **statistics**. In the motivation section, usually we answer the following questions:

* What is the problem we want to solve?
* Why this problem is important?
* Why current solution won't work for this problem?

Note that motivation should be independent of our design.

## Challenges

In the Challenges section, we highlight the difficulties in solving the problem. It will be more convincing to include related **data**, **figure** and **statistics**. The key part in Challenges is:

* Why this problem is difficult?

## Opportunities

Related data, figure and statistics.

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

Also not that the cases in the evaluation section can be only a subset of the design section.

**Recommended Structure:**

1. Metrics
2. Baseline Approach
3. Dimension A (X axes A)
4. Dimension B (X axes B)
5. Dimension C (X axes C)
6. Summary



## Related Works