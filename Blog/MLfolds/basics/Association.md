---
layout: single
title: "Association Between Variables"
permalink: /blog/MLfolds/basics/Association/
classes: wide
author_profile: true
use_math: true
date: 19/6/14
---

Some of the contents are based on *Statistical Inference* [1] and [Introduction to Data Mining](https://www-users.cs.umn.edu/~kumar001/dmbook/index.php), and a [blog](https://medium.com/@outside2SDs/an-overview-of-correlation-measures-between-categorical-and-continuous-variables-4c7f85610365).

Sometimes, we need to decide whether two variables are related or we need to compare the (strength of) relationships between a bunch a $$X$$s and $$Y$$s. However, we need different types of metrics for different types of data. First we need to know the categorization of data (attributes).

A related topic is **feature selection**, which might be discussed after.



## Categorization of data (attributes)

|                              | **Attribute Type** | **Description**                                              | **Examples**                                                 | **Operations**                                               |
| ---------------------------- | ------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Categorical<br/>Qualitative | Nominal            | Nominal attribute values only  distinguish. ($$=, \ne $$)    | zip codes, employee ID numbers, eye color, sex: {*male, female*} | mode, entropy, contingency correlation, $$\chi^2$$ test      |
| Categorical<br/>Qualitative | Ordinal            | Ordinal attribute values also order objects. (<, >)          | hardness of minerals, {*good, better, best*}, grades, street numbers | median, percentiles, rank correlation, run tests, sign tests |
| Numeric<br />Quantitative | Interval           | For interval attributes, differences between values are meaningful. (+, - ) | calendar dates, temperature in Celsius or Fahrenheit         | mean, standard deviation, Pearson's correlation, *t* and *F* tests |
| Numeric<br />Quantitative | Ratio              | For ratio variables, both differences and ratios are meaningful. (*, /) | temperature in Kelvin, monetary quantities, counts, age, mass, length, current | geometric mean, harmonic mean, percent variation             |



## Numeric v.s. Numeric

**Linear Association (Covariance and (Pearson) Correlation)**

In statistical inference, the covariance and correlation are two measures that quantify this difference in the strength of a relationship between two random variables

Here we will use the notation $$\text{E}X = \mu_X$$, $$\text{E}Y = \mu_Y$$, $$\text{Var} X =\sigma_X^2$$, and $$\text{Var}Y = \sigma_Y^2$$.

The *covariance* of $$X$$ and $$Y$$ is the number defined by:

$$\text{Cov}(X, Y) = \text{E}((X-\mu_X)(Y - \mu_Y))$$

The *correlation* of $$X$$ and $$Y$$ is the number defined by:

$$\rho_{XY}=\frac{\text{Cov}(X,Y)}{\sigma_X \sigma_Y}$$

The value $$\rho_{XY}$$ is also called the *correlation coefficient*.

**Ordinal Association (Rank correlation)**

1. Spearman Correlation
2. Goodman Kruskal’s Gamma
3. Kendall’s Tau
4. Somers’ D



## Categorical v.s. Categorical

Here we follow the slides [Association Between Categorical Variables](https://newonlinecourses.science.psu.edu/stat800/node/64/).

**Two way table** is good way to show the association between two categorical variable.

**Chi-square test ($$\chi ^2$$ test)**

The **chi-square test** for two-way tables is used as a guideline for declaring that the evidence in the sample is strong enough to allow us to generalize the relationship to a larger population.

- ***Definition*:** A **statistically significant** relationship is a relationship observed in a sample that would have been unlikely to occur if really there is no relationship in the larger population.
- ***Concept*** : A chi-square statistic for two-way tables is sensitive to the strength of the observed relationship. The stronger the relationship, the larger the value of the chi-square test.
- ***Definition*** : A **p-value** for a chi-square statistic is the probability that the chi-square value would be as large as it is (or larger) if really there were no relationship in the population.
- **IMPORTANT decision rule** : An observed relationship will be called statistically significant when the p-value for a chi-square test is less than 0.05. In this case, we generalize that the relationship holds in the larger population.
- **Assumptions**: The two variables must be categorical and expected counts in each cell must be **at least** 5.

The chi-square test statistic for a test of independence of two categorical variables is found by:

$$X^2=\sum(O-E)^2/E$$

where $$O$$ represents the observed frequency. $$E$$ is the expected frequency under the null hypothesis and computed by:

$$E=\frac{row\ total \times column\ total}{sample\ size}$$



## Numeric v.s. Categorical

**Point biserial Correlation**

It is similar to the Pearson coefficient, but the calculation assumes that the continuous variable is normally distributed and homoscedastic.

**Logistic Regression**

If there is a relationship between the categorical and continuous variable, we should be able to construct an accurate predictor of the categorical variable from the continuous variable. (Similar ideas can be extended to other machine learning models such as random forest).

**Kruskal-Wallis H Test** **(Or parametric forms such as t-test or ANOVA)**

A simple approach could be to group the continuous variable using the categorical variable, measure the variance in each group and comparing it to the overall variance of the continuous variable. If the variance after grouping falls down significantly, it means that the categorical variable can explain most of the variance of the continuous variable and so the two variables likely have a strong association. 



Other methods: train a random forest and count the number of trees using the variable.



## Ref.

[1] Casella, G., & Berger, R. L. (2002). ***Statistical inference*** (Vol. 2). Pacific Grove, CA: Duxbury.