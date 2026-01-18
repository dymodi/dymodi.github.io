---
title: Steps Towards a Paper (Under Construction)
author_profile: true
layout: single
permalink: /for-students/steps-towards-a-paper/
author_profile: true
classes: wide

---



### 1. Come Up with An Idea

* Shoot first, then make the target.
  * Sometimes, we have a good problem and try to find a good solution to it. Sometimes we have a good solution and need to find a **good problem** for it. Or you can call it, make a target after shooting.
  * The key information of the top research is usually a **claim**, **a special problem can be solved with a special method**. We need to deliver this information in a simple yet clear way.
* If you think you have found a good **goal/problem** to work on, review the goal/problem using the following questions before talking to others:
  * Can I summarize the **goal** or **problem** in a sentence? (e.g., The goal is to run LLMs locally on wearable devices like a smartwatch. Or, the problem is that LLMs cannot be run locally on wearable devices.)
  * Why is this goal/problem important? Why do the reviewers/readers/public care about it?
  * If the work is indeed important, did I find some existing work for this problem? If yes, what are the limitations that make them fail for the problem (under certain scenarios)? If no, is this problem too difficult/easy, or is this an emerging problem that nobody has studied yet (e.g., face recognition with facial musk during COVID)? 
  * When searching for related work, did I think about problems that are essentially the same/similar to my problem, but with a different name? (e.g., LLM compression may not be studied before 2021, but compression of deep learning models with transformer structures has been studied a lot).
  * If existing work fails to solve the problem (under certain scenarios), why can I come up with a solution? What's the unique expertise/opportunities I (our group) have to propose the solution?
  * If I propose a solution, how can I evaluate it? Are there benchmark/public dataset to test? Can I build test environment to do experiments?
* If you think you have found a good **idea/observation** to work on, review the idea/observation using the following questions before talking to others:
  * It will be better if an idea comes with a special observation.
  * Is this work a simple piling of two or more ideas?
* Other comments/feedback I usually give to students:
  * Try to come up new problems/goals instead of following others' problems/goals. In academia, new problems/goals are always more appreciated than new solutions for old problems/goals. 
  * A work does not need to pass all the checks to become a paper, but meeting the requirements makes it more likely to be a **top paper**. Your career is decided by a small number of **top papers** instead of a large number of normal papers.
* There are two types of problems for system paper.
  * Measurement and prediction (e.g., route prediction). It is easier to design and evaluation since you have the ground truth of results. While it may needs more effort to persuade the reviewers.
  * Inference (e.g., localization), where we do not have the ground truth, while we try to infer it from some data we have (GPS, timestamp). In the Evaluation section, we use another system (beacons) to show the performance of our design, and this "another system" is not aforementioned. The Design section and Evaluation must be isolated. (Keep in mind that the system in Design and Evaluation can be  exchanged)

### 2. Discuss with Your Professor

* Scope
  * The problem you want to solve and the solution you provide must be generic, e.g. instant delivery but not food delivery.
  * The experiments and evaluations you did can be only a subset or a special case of your scope. For example, we test a dispatching algorithm on a grid in the urban delivery platform.
* Innovation
  * Instead of listing several innovations, it will be better to articulate one major difference or innovation.
* Motivation
  * Motivation must be shown with statistics and simple stories.
* Solution
  * The key point of solutions must correspond to the key points in the motivation section.
  * The problems discussed in the challenge section must be solved.
  * The golden key found in the opportunities section must be utilized in the solution.
  * Sometimes, we can prepare the raw data first, uncover the pattern in the raw data, and find the corresponding solution.
  * Another advantage of preparing data first is that we can immediately try our new idea on the data if we have new thoughts.
  * Instead of manipulating a very complex method with many components and parameters, it will be better to design a simple system with one major innovative part and show that it works.
  * Instead of coming up with brand-new solutions, it will be better to import existing solutions.
* Advanced Design
  - Discover and solve the advanced problem by removing the assumptions. For example, if we do not assume that riders are walking at a constant speed (1m/s) indoors, the problem will become more complex.
* Before the study, remember the following checklist:
  * Make sure the professor accepts the whole project (motivation, problem, solution, advanced design, evaluation).
  * When discussing with the professor, remember to refer to the whole framework and the differences between the two versions of slides.

### 3. Study and Design

* Find one or two most closely related papers, and implmente the ideas. It may appear as the preliminary experiment in the paper. Conducting some pre-experiments can help you (1) find the potential gap in the problem/direction; (2) familiarzie with the skill sets needed (e.g., fine-tuning); (3) reveal the potential technical challenges (e.g., computational resource contraints, latency contraints). 
* Prepare data to have a whole image of the data and problem.
* Find well-known methods in the field as baselines.
* For each related topic, prepare a survey to learn about this field and prepare the Related Works of the paper.

### 4. Writing and Submission

The paper can be drafted based on the slides used for discussion with the professor. Specialized slides can be used to keep the main points of the paper. It will be better that Sections (even subsections and subsubsections) are designed clearly and carefully before starting to write.

Before starting to write each section (or subsection, paragraph), think about what core information (idea/viewpoint/observation/design/result) you want to present and whether there is enough context built up before. Missing parts should be filled, and things already said should not be repeated. Otherwise, the paper will be messy.

For System Paper writing, please find guides in this [post](https://yi-ding.me/for-students/how-to-write-a-system-paper/).

Some rules on formatting should be followed:

* Only capitalize the first word in the caption of figures or tables.
* When using Python to plot, use `fig = plt.figure(figsize=(8,4))` to control the figure size.

### 5. Revise of a Rejected Paper

* Rejection is an everyday life for PhD (and for professors), you will never be rejected only if you never tried.
* You may want to take a look at the suggestions on "[How to Handle Rejection](https://yi-ding.me/for-students/how-to-handle-rejection/)"
* When revising the draft, read it in the reviewer's view (who has no idea about what you are doing but wants to find drawbacks) and find potential bugs and drawbacks.
* Refine by yourself first and then to other students and finally to professors.
* Put contents as much as possible regardless of the page limit; it will be easier to drop than add contents in the final hours.
* Better complete a draft two or more weeks before DDL and send out to others (Professor, co-authors, etc) for comments.
* Comments should be from people who are familiar as well as unfamiliar with this topic.
* Outline the revised points from the comments and discuss them with them.
* Revise the draft and re-do the first step.

### 6. Presentation

* When others ask questions, try to find out why they ask "this" question.



Created on: June 1, 2018

Updated on: April 19, 2024

