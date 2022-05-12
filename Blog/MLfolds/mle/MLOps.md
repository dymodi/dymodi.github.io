---
layout: single
title: "Machine Learning Engineering for Production (MLOps) Specialization"
permalink: /blog/MLfolds/reinforcement-learning/MLOps/
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

Good practice of learning / using Docker.

