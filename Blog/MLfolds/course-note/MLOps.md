---
layout: single
title: "Machine Learning Engineering for Production (MLOps) Specialization"
permalink: /blog/MLfolds/course-note/MLOps/
classes: wide
author_profile: true
use_math: true
date: 22/05/11
---

This is a learning note of ["Machine Learning Engineering for Production (MLOps) Specialization"](https://www.coursera.org/specializations/machine-learning-engineering-for-production-mlops) from Andrew Ng.

Main Topics:
* ML algorithms deployment.

Why ML Deployment is Important:

* Concept Drift / Data Drift: Different distributions of test set and real-world application.

Some important ideas/concepts:

* Concept drift / Data drift
* Label consisenty is important
* Human Level Performance (HLP)
* Proof of Concept (PoC)



## Week 1: Introduction to Machine Learning in Production

### The Machine Learning Project Lifecycle

Steps of an ML Project:

1. **Scoping (what is X & what is Y)**
   
   *  Decide key metrics: accuracy, latency, throughput;
2. **Data**
   
   * Define data & establish baselines;
   * Label & organize data;
     *  Is the data labeled consistantly?
3. **Modeling**
   
   * Select and train model;
     * Three parts of a ML system: **code**, **hyperparameter**, **data**.
   * Perform error analysis;
4. **Deployment**
   
   * Deploy in production;
   
   * Monitor and maintain system;

### Deployment

#### Key Challenges

Concept Drift / Data Drift

* Gradual change (*couriers' walk at different days*)
* Sudden change (*new elevators open / close*)

Software Engineering Issues (Checklist)

* Real-time or Batch?
* Cloud server or Edge/Browser?
* Computer resources (CPU/GPU/memory)?
* Latency, throughput (QPS)?
* Logging
* Privacy & Security

#### Deployment Patterns

Common deployment cases:

* New product/capability;
* Automate/assist with manual tasks *(dispatching)*; --> 
* Replace previous ML systems;

Key ideas:

* Gradual ramp up with monitoring;
* Rollback;

**Shadow mode deployemnt**: parallel operation

**Canary deployment**: small traffic

**Blue green deployment**: easy to rollback

Degree of automation: from human only to full automation

#### Monitoring

Monitoring dashboard (*what we've done in whole chain*) on all the things that may go wrong from input to output.

Metrics to monitor:

* Software Engineering: memory, latency, throughput, sever load;
* Input: avg. input length, # of missing values, etc.
* Output: # of null output, CTR, etc.

Model retraining:

* Manual retraining; (more frequent) 
* Automatic retraining;

#### Pipeline Monitoring

#### Ungraded Lab - Deploying a Deep Learning model

Good practice of learning / using Docker and venv with jupyter notebook.



## Week 2: Select and Train a Model

### Selecting and Training a Model

#### Modeling Overview

* Model-centric AI development
* Data-centric AI development

#### Key Challenges

**AI System = Code + Data**

1. Doing well on training set.
2. Doing well on dev/test sets.
3. Doing well on business metrics/project goals.

**Performance on key slices of data**: *that's why we have a policy/business layer on the order matching layer*

**Rare classes**: *a related problem is the long-tail of delivery time, every order with 1+ hours delivery time will lose a customer*

#### Establish a baseline

The improvements are compared with baselines (e.g., human), not algorithms themselves.

Unstructed data (HLP) v.s. Structured data

Ways to establish a baseline:

* Human level performance (HLP);
* Literature search for SOA/open source;
* Quick and dirty implementation;
* Performance of old system; 

#### Tips for getting started

* Literature search to see what's possible (courses, blogs, open-source projects);
* Find open-source implementation if possible;
* A reasonable algo + good data > A greate also + not so good data;

Sanity check for code and algorithm: try to overfit a small training examples.

### Error analysis and performance auditing

#### Error analysis example

<span style="color:Red">This is important because previously, what we do is a one-shot process, we try different models on the data-set, and choose the best. We never look deep into the wrong samples and figure out what is going wrong.</span>

Manally assign some tags to the examples that failed, and dig deeper, tags can be about:

* Certain classes (y);
* X features;
* Meta data;

*"Seems try to group the errors manually"*

#### Prioritizing what to work on

The ratio of the data samples, gap with baselines, matters.

<span style="color:Red">Then based on the analysis, we can decide which type of data we need to collected in the next step.</span>

#### Skewed datasets

Precision, Recall, F1 score;

#### Performance auditing 

*"Maybe review this part when there is a real problem to be sovled."*

### Data Iteration

#### A useful picture of data augmentation

Different types of input data as x-axis, gap with baseline (HLP) as y-axis, find the point that has most improvement potential.

#### Data augmentation

*("Seems we tried this trick in beacon heterogeneity projects", not frequently used in the projects.)*

Create realistic examples that (1) the algorithm does poorly on, but (2)  human (or baseline) can do well on.

Data iteration loop.

#### Can adding data hurt? 

A short answer: no.

#### Adding features

For structured data, it's usually difficult to collected more data on purpose, but we can add some insightful features.

A big advantage of deep learning is that we don't need to hand-craft features, especially for unstructed data, but for structured data, design features can still help in many applications.

#### Experiment tracking

What to track:

* Algorithms / code version;
* Dataset used;
* Hyperparameters;
* Results;

Tracking tools:

* Text files;
* Spreadsheet;
* Experiment tracking system;

#### From big data to good data

Good data:

* Covers important cases;
* Is defined consistently;
* Timely feedback from production data;
* Is sized appropriately.

#### Ungraded Lab -  A journey through Data

Good practice of **data preprocessing**, **model specification**, **experiment tracking**, **class imbalance**, and **data augmentation**, indicating that ***data really impacts*** the ML system performance.



## Week 3: Data Definition and Baseline

### Define Data and Establish Baseline

#### Major types of data problems

* Unstructed Data:
* Structured Data:
* Small Data (<10,000): Clear labels are critical.
* Big Data: Emphasis on data process.

#### Small data and label consistency

Label consistency is critical for small data problems.

#### Improving label consistency

#### Human level performance (HLP)

Why measure HLP: a baseline to show what might be possible for a ML system.

Other uses of HLP: (1) beating HLP to get paper published. (2) Prove ML system is superior to huamn doing the job.

The problem of HLP is the **ground truth label** might be only the label from another group of human (instead of the truth).

<span style="color:Red">(This is an interesting problem because if the ground truth label is hand crafted by human, instead of direct observation, what we learned is only biased conclusion of some human, such as the label for merchant in shops.)</span>

#### Raising HLP

### Label and Organize Data

#### Obtaining data

Get into the "Data Collection->Model Training->Error Analysis" iteration as soon as possible.

Compare data collection methods with the monetary cost and time cost.

Labeling data: "in house" vs "outsource" vs "crowdsource"

Don't increase data by more than 10x at a time.

#### Data pipeline

In POC phase, replicability is not that important.

In Production phase, use more sophisticated tools to make sure the data pipeline is replicable.

#### Meta-data, data provenance and lineage

Store the meta-data is something like comment your code, it's good and you need to do it timely.

#### Balanced train/dev/test splits

Small data set may need to check the balance of the split.

### Scoping

**What is scoping?** Choose a good project to work on.

**Scoping process** (1) Brainstorm business problem (not an AI problem); (2) Brainstorm AI solution; (3) Assess the feasibility and value of potential solutions; (3) Determine milestones; (4) Budget for resources;

**Diligence on feasibility and value** Feasibility: use external benchmark;  Predictive features: 

**Diligence on value** Long chain from ML metric to business metric; Social value.

**Milestones and resourcing** Key specification;

### Ungraded Lab - Data Labeling

Good practice examples to show the importance of good labeling and baselines.

Also talked about <span style="color:Red">"labeling based on rules".</span> Even the label in train set is from rules, the labels in test set should be ground truth.







