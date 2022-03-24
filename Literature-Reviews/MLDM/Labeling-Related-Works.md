---
layout: single
title: "Related Works of Incomplete and Inaccurate Label"
permalink: /Literature-Reviews/MLDM/Labeling-Related-Works/
classes: wide
author_profile: true
use_math: true
date: 18/4/30
---

A good blog on this topic can be found [here](https://hazyresearch.github.io/snorkel/blog/ws_blog_post.html). The good point of this blog is not only a summary of existing solutions to weak label, but also a paradigm on how to formulate a "practical motivation" into a standard research problem.

An instructive discussion on Positive Unlabelled Learning (PUL) can be found on [Zhihu](https://www.zhihu.com/question/286851129)

"Inaccurate Labelling", as its name suggests, is how we handle inaccurate labels in machine learning problmes. Usually we assume the labelling is available and accurate, while in practice, labelling can be inaccurate. Here is a simple survey on this problem.

**Individual Papers**

* Learning from Incomplete and Inaccurate Supervision, *KDD19*
  * Explore the *one-sided* noise in the limited labeled data.

## Incomplete and Inaccurate Label in Sensing

* Exploring Semi-Supervised and Active Learning for Activity Recognition, *ISWC08*
  * Provides two ways to reduce the relying on large amount of labelled data for supervised learning.
  * **Semi-supervised learning** can be used, including *self-training* and *co-training*
  * **Active learning**, but this paper mainly solve the problem of "limited number of  labels" but not "inaccurate labels"
* Training Human Activity Recognition for Labels with Inaccurate, *UbiComp14*
  * A time shift label is added to the dataset and a multi-label problem is solved to handle inaccurate labelling problem.



## How to get more labeled training data?

The following refers to the [blog](https://hazyresearch.github.io/snorkel/blog/ws_blog_post.html).

One of the major reasons leading to the labeling problem is the reliance on **subject matter experts (SMEs)**, we all rely on SME in handcrafting ground truth labels.

In **active learning**, the goal is to make use of subject matter experts more efficiently by having them label data points that are estimated to be most valuable to the model. That is, we select some samples with low confidence and let SMEs to label them.

In the **semi-supervised learning** setting, we have a small labeled training set and a much larger unlabeled data set. Then we use some assumptions to leverage the unlabeled data.

In the standard **transfer learning** setting, our goal is to take one or more models already trained on a different dataset and apply them to our dataset and task.

In the **weak supervision** setting, instead of getting more labeled data from SMEs, we can get some various types of higher-level, or otherwise less precise, forms of supervision, which would be faster and easier to provide.


## Ref

[ISWC08] Stikic, M., Van Laerhoven, K., & Schiele, B. (2008, September). **Exploring semi-supervised and active learning for activity recognition**. In *Wearable computers, 2008. ISWC 2008. 12th IEEE international symposium on* (pp. 81-88). IEEE.

[UbiComp14] Toda, T., Inoue, S., Tanaka, S., & Ueda, N. (2014, September). **Training human activity recognition for labels with inaccurate time stamps**. In *UbiComp* (pp. 863-872). ACM.

[KDD19] Zhang, Z. Y., Zhao, P., Jiang, Y., & Zhou, Z. H. (2019). **Learning from incomplete and inaccurate supervision**. In *Proceedings of the 25th ACM SIGKDD*.



