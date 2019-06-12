---
author: Yi DING
layout: post
title: Related Works of Learning with Missing Value
date: Nov. 1, 2018
---
# Related Works of Learning with Missing Value



[1] gives comparison of several approaches for solving the missing value problem, including deletion and single imputation techniques.  First we can study the characteristic of the missing data. **Deletion methods** is one of the basic methods to dealing with missing values. In **single imputation methods**, missing values are filled in and the outcome is a complete data set.

[2] discuss whether missing values should be imputated from the view point of cost-sensitive leaning. The made the claim of “Missing Is Useful” to argue that sometimes it will be better not to imputate missing values.

[3] proposed the method of mixed-attribute imputation to estimate missing values with known values in from different types of attributes.

[4] provides a new angle and solved the MV problem for real big data. They proposed a framework to partition the data and achieve imputation with only a subset of features.

[5] is a paper from Amazon Deutschland. It proposed a method to achieve missing value imputation for non-numerical data. 



## Methods handling missing values

### Deletion Methods

Deleting the whole row or column with missing value, details discussed in [1].

### Single imputation methods

#### Mean imputation

Simply fill with the mean value of the feature.

#### Regression imputation

Estimate missing feature $$X$$ with knowing feature $$Y$$. Linear regression or other regression can be used.

#### Expectation-maximization (EM)

Similar as EM in parameter estimation. Can be combined with regression imputation.

#### Hot deck methods

Find the nearest records like $$k$$-NN methods.






## Ref

[1] Chih-Feng Liu, Thao-Tsen Chen, and Shie-Jue Lee. 2012. A COMPARISON OF APPROACHES FOR DEALING WITH MISSING VALUES. In Proceedings of the 2012 International Conference on Machine Learning and Cybernetics, 15–17.

[2] Shichao; Zhang and Zhengxin Qin. 2005. “Missing Is Useful”: Missing Values in Cost-Sensitive Decision Trees. *IEEE TKDE* 17, Bd 1 (2005), 80 S.

[3] Xiaofeng Zhu, Shichao Zhang, Zhi Jin, Zili Zhang, and Zhuoming Xu. 2011. Missing value estimation for mixed-attribute data sets. *IEEE TKDE* 23, 1 (2011), 110–121. DOI:https://doi.org/10.1109/TKDE.2010.99

[4] Pythia Godzilla, Christos Anagnostopoulos, and Peter Triantafillou. 2014. Scaling Out Big Data Missing Value Imputations. In *ACM SIGKDD*, 651–660.

[5] Felix Bießmann, David Salinas, Sebastian Schelter, Philipp Schmidt, and Dustin Lange. 2018. Deep Learning for Missing-Value Imputation in Tables with Non-Numerical Data. In *ACM CIKM*, 2017–2025.