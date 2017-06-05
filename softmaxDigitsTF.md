In this tutorial, we will basically follow the [official tutorial](https://www.tensorflow.org/get_started/mnist/beginners) but will change some parts to make it easier to understand. The contents about logistic regression borrows from Arindam Banerjee's Machine Learning course at University of Minnesota, which corresponds to Ethem Alpaydin's book *Introduction to machine learning*.

TensorFlow provides a very creative frame for machine learning programming. We will first build a structure (graph) for the algorithm and then feed the data and run the session. In the graph, the operations are the vertices and data flows on the edges.

## Softmax
In short, Softmax is the multi-class logistic discrimination. For a linear discrimination, the discriminant function is defined as: 
\\[ g(\mathbf{x}) = \mathbf{w}^T\mathbf{x} + w_0\\] 
This somehow assumes a linear relation from the features to the probability of each class. In comparison, the logistic regression assumes the log of the ration between two classes has a linear form, which is
\\[ \log \left( \frac{P(1|\mathbf{x})}{P(0|\mathbf{x})} \right) = \mathbf{w}^T\mathbf{x}  \\]
A direct calculation gives:
\\[ P(1|\mathbf{x}) = \frac{\exp(\mathbf{w}^T\mathbf{x})}{1+\exp(\mathbf{w}^T\mathbf{x})} =\sigma(\mathbf{w}^T\mathbf{x})\\]
\\[ P(0|\mathbf{x}) = \frac{1}{1+\exp(\mathbf{w}^T\mathbf{x})} =1-\sigma(\mathbf{w}^T\mathbf{x})\\]
Here $\sigma$ is the so called [logistic function](https://en.wikipedia.org/wiki/Logistic_function).

In the training phase, the following "cross-entropy" cost function is to be minimized,
\\[ E(\mathbf{w},w_0 | \mathcal{X}) =-\sum_tr^t\log y^t +(1-r^t) \log (1-y^t)\\]
here $r$ is the label and $y$ is the predict value of the model. Here we can raise a question that why some other cost functions are not utilized, we keep this as another topic in future blogs.

Now we come to the problem that there are more than two classes. For each class, we formulate the posterior probability as
\\[ y=\hat{P}(C_i|\mathbf{x}) = \frac{\exp\left[ \mathbf{w}_i^T\mathbf{x}+w_{i0}\right]}{\sum_{j=1}^K \exp\left[ \mathbf{w}_j^T\mathbf{x}+w_{j0} \right]} \\]

Now the cost function to be minimized becomes:
\\[ E( \{ \mathbf{w}_i, w_0 \}_i | \mathcal X) = -\sum_t\sum_i r^t_i\log y^t_i \\]