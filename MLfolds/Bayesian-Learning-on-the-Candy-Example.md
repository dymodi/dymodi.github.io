--- 
layout: post
title: Bayesian Learning on the Candy Example
date: Dec. 15, 2017
author: Yi DING
---

[comment]: # (Use the candy example to explain Bayesian learning)

For the Bayesian learning, Professor Arindam Banerjee has a very good example of candy bages. In this post, we use the candy example to explain and summarize Bayesian learning.

## Bayes Theorem
Before we reach out to Bayesian learning. We need first review the idea of [Beyas Theorem](http://www.cs.cmu.edu/afs/cs/project/theo-20/www/mlbook/ch6.pdf).
\\[ p(\theta|\mathcal X)= \frac{p(\mathcal X|\theta)p(\theta)}{p(\mathcal X)}\\]

$$p(\theta)=$$ prior probability of hypothesis $$\theta$$

$$p(\mathcal X)=$$ prior probability of training data $$\mathcal X$$

$$p(\theta\mid\mathcal X)=$$ probability of $$\theta$$ given $$\mathcal X$$

$$p(\mathcal X\mid\theta)=$$ probability of $$\mathcal X$$ given $$\theta$$

## Bayesian Estimation
Usually, we have more than one hypotheses and we want the most probable hypothesis given the training data. That is, Bayesian Estimation can help us choose an appropriate hypothesis from multiple hypotheses (in discrete hypothesis space), or compute the apporprate parameter (in continuous hypothesis space).

**Maximum a posteriori (MAP)**, as its name suggests, is to estimate the parameter $$\theta$$ by maximize the posteriori $$p(\theta\mid\mathcal X)$$.

\begin{align}
\theta_{\text{MAP}} = \text{argmax}_\theta p(\theta\mid\mathcal X) \text{argmax}_\theta p(\theta\mid\mathcal X)
\end{align}

 = \text{argmax}_\theta p(\mathcal X| \theta)p(\theta)

\\[ = \text{argmax}_\theta \frac{p(\mathcal X\mid \theta)p(\theta)}{p(\mathcal X)} \\]


## Basic Idea
According to Professor Banerjee, "The Bayesian view of learning is updating probability distribution over the hypothesis space."