---
title: Steps Towards a Paper
author_profile: true
layout: single
permalink: /for-students/steps-towards-a-paper/
author_profile: true
classes: wide

---

Yi Ding

Created on: June 1, 2018
Updated on: April 19, 2024
Major Revision on January 21, 2026


### 1. Find and Self-Review a Problem/Idea

* The key information of the top research is usually a **claim**, **a special problem can be solved with a special method**. We need to deliver this information in a **simple** yet **clear** way.
* Sometimes, we have a great **problem** and try to find a good *solution* for it. Sometimes we have a great **idea** and need to find a good *problem* for it.
* The problems/ideas can be from many ways: the counter-intuition results from your last paper, the paper you read recently, discussions with your professor and other students, news, everyday events. For junior PhD students, master, and undergraduate students, the problems/ideas are usually provided by the professor.
* If you think you have found a great **problem** to work on, review the problem using the following questions before talking to others:
  * Can I summarize the **problem** in a sentence (e.g., LLMs cannot run locally on wearable devices)?
  * Why is this problem important? Why do the reviewers/readers/public care about it?
  * If the problem is important, did I find some existing work for it? If yes, what are the limitations that make them fail for the problem (under certain scenarios) (preliminary experiments may be needed here)? If no, is this problem too difficult/easy, or is this an emerging problem that nobody has studied yet (e.g., face recognition with facial musk during COVID)? 
  * When searching for related work, did I think about problems that are essentially the same/similar to my problem with a different name (e.g., LLM compression may not be studied before 2021, but compression of deep learning models with transformer structures has been studied a lot)?
  * If existing work fail to solve the problem (under certain scenarios), why can I come up with a solution? What's the unique expertise/opportunities I (our group) have to propose a solution? 
  * Can I find a angle to frame a **unique** (sub-)problem that can differentiate from existing work (e.g., LLM compression for sensor data)?
  * If I propose a solution, how can I evaluate it? Are there benchmark/public dataset to test? Can I build test environment to do experiments?
* If you think you have found a great **idea** to work on, review the idea using the following questions before talking to others:
  * Where did I get this idea? Why others did not come up with it?
  * Can I use a small example to illustrate the idea (preliminary experiments may be needed here)?
* Other comments/feedback I usually give to students:
  * Try to come up new problems instead of following others' problems. In academia, new problems are always more appreciated than new solutions for old problems. 
  * A work does not need to pass all the checks to become a paper, but meeting as many requirements as possible makes it more likely to be a **top paper**. Your career is decided by a small number of **top papers** instead of a large number of normal papers.

<!-- * There are two types of problems for system paper.
  * Measurement/prediction (e.g., route prediction). It is easier to design and evaluation since you have the ground truth of results. While it may needs more effort to persuade the reviewers. -->
<!--   * Inference (e.g., localization), where we do not have the ground truth, while we try to infer it from some data we have (GPS, timestamp). In the Evaluation section, we use another system (beacons) to show the performance of our design, and this "another system" is not aforementioned. The Design section and Evaluation must be isolated. (Keep in mind that the system in Design and Evaluation can be  exchanged) -->

### 2. Discuss with Your Professor and Fellow Students

<!-- * Scope
  * The problem you want to solve and the solution you provide must be generic, e.g. instant delivery but not food delivery.
  * The experiments and evaluations you did can be only a subset or a special case of your scope. For example, we test a dispatching algorithm on a grid in the urban delivery platform. -->
<!-- * Innovation
  * Instead of listing several innovations, it will be better to articulate one major difference or innovation. -->
* Utilize the discussion time with your professor **wisely** and **efficiently**. In addition to learning what your professor told you, also try to learn how your professor comes up with the question/ideas and how the question/idea is communicated.
* Find a good timing to discuss the problem/idea with your professor. Bringing the problem/idea up too early without a thorough review of the questions above may end up with your idea challenged easily by your professor. It's a waste of time for both of you. Bringing the idea up too late after you've done a lot of literature review and experiments may end up with your problem/idea (1) not aligned with the group's goal/expertise (2) has some inherent limitations that you didn't realizem, which means the weeks you've spent on the literature review and experiments are wasted. A good timing is that you have *briefly* reviewed the problem/idea with some *quick* literature review and experiments.
* Prepare for the meetings with your professor carefully. Prepare a Google doc and with a brief description of your problem/idea/progress and share it with your professor **the day before the meeting**.
* Check your Google Doc with the following questions:
  * Is the document self-explainable to general CS audience? Does it has all the background/references need to understand it (dataset info, parameters,?
  * For each claim (especially important ones), did I have provide justification? For example, if I want to claim the importance of the problem or the limitation of a related work, how do I prove it? Can I use a preliminary experiment to Reference paper thas support the claim?  
  * Did I highlighted the important claims/results/conclusions?
  * Did I highlighted the added/modified content since last version?
* Don't **overfit** to the comments provided by the professor. The professor may have random ideas/comments/feedback. You're the leader of the project, use your own judgement and critize the professor's comment. 
* Talk to other members in the group about your problem/idea, even they are not working the same topic/direction. They can provide a fresh perspective for you to review and improve your problem/idea. 
* Before the study, remember the following checklist:
  * Make sure the professor accepts the whole project (motivation, problem, solution, evaluation, etc.).
  * When discussing with the professor, remember to refer to the whole framework and the differences between the two versions of slides.

### 3. Study and Design

* How to do literature review? 
  * A detailed guide can be found here: "[How to do a Literature Survey](https://yi-ding.me/assets/files/Literature-Survey-2025.pdf)".
  * For each related topic, prepare a survey to learn about this field and prepare the Related Works of the paper.
* How to do prelimanry experiments?
  * As discussed above, preliminary experiments may be needed when you want to (1) find the limitations of existing solutions on your problem; (2) illustrate the potenital of the idea/opportunity in solving the problem.
  * You can start with preparing data to have a whole image of the data and problem.
  * Find one or two most closely related papers, and implmente the ideas. It may appear as the preliminary experiment in the paper. Conducting some pre-experiments can help you (1) find the potential gap in the problem/direction; (2) familiarzie with the skill sets needed (e.g., fine-tuning); (3) reveal the potential technical challenges (e.g., computational resource contraints, latency contraints). 
* Technical challenges
  * The technical challenges you choose to solve and how you solve them reflects the **depth** of your work. 
  * Technical challenges are normally the difficulties you met when you use your *idea/opportunities* to solve the problem (e.g., your idea is to use LLM for navigation, then how to obtain the results in real time will become a technical challenge, as LLM is usually slow.). 
* Check list for your design/solution:
  * The problems discussed in the challenge section must be solved.
  * If there is an opportunity mentioned, it must be utilized in the design/solution.
  * The key point of the design/solution must correspond to the key points in the motivation section.
  * Research is different from engineering. In engineering you use all the techiniques and tricks to achieve optimal performance, while in research you use a simple and elegant desing to show the effectiveness/potential of an idea. Instead of manipulating a very complex method with many components and parameters, it will be better to design a **simple** system with one major innovative part and show that it works.
  * Instead of coming up with brand-new solutions, it will be better to import and build upon existing solutions.
* Sometimes, we may have an **advanced design** in addition to the main design, where we can discover and solve an advanced problem by removing the some assumptions.
* Evalution/experiments
  * Find some well-known solutions and some latest solutions in the field as baselines.
  * Make your code extensibile, as you may need to modify design and experiment settings based on the feedback from your professor or reviewers, but don't spend too much time on it, as in most cases the code only serve for only one project.

Most of your PhD life is a cycle of "find problems/ideas", "study and design", "discussion".

### 4. Writing and Submission

* The paper can be drafted based on the doc used for discussion with the professor. Specialized slides can be used to keep the main points of the paper. It will be better that Sections (even subsections and subsubsections) are designed clearly and carefully before starting to write.
* Before starting to write each section (or subsection, paragraph), think about what core information (idea/viewpoint/observation/design/result) you want to present and whether there is enough context built up before. Missing parts should be filled, and things already said should not be repeated. Otherwise, the paper will be messy.
* For System Paper writing, please find guides in this guidance: "[How to Write a System Paper](https://yi-ding.me/for-students/how-to-write-a-system-paper/)"
* Some rules on formatting should be followed:
  * Only capitalize the first word in the caption of figures or tables.
  * Wrap the figures
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




