In this tutorial, we will basically follow the [official tutorial](https://www.tensorflow.org/get_started/mnist/beginners) but will change some parts to make it easier to understand. The contents about logistic regression borrows from Arindam Banerjee's Machine Learning course at University of Minnesota.

TensorFlow provides a very creative frame for machine learning programming. We will first build a structure (graph) for the algorithm and then feed the data and run the session. In the graph, the operations are the vertices and data flows on the edges.

## Softmax
In short, Softmax is the multi-class logistic discrimination. For a linear discrimination, the discriminant function is defined as: 
\\[ g(\mathbf{x}) = \mathbf{w}^T\mathbf{x} + w_0\\] 
This somehow assumes a linear relation from the features to the probability of each class. In comparison, the logistic regression assumes the log of the ration between two classes has a linear form, which is
\\[ \log \left( \frac{P(1|\mathbf{x})}{P(0|\mathbf{x})} \right) = \mathbf{w}^T\mathbf{x}  \\]
A direct calculation gives:
\\[ P(1|\mathbf{x}) = \frac{\exp(\mathbf{w}^T\mathbf{x})}{1+\exp(\mathbf{w}^T\mathbf{x})} =\sigma(\mathbf{w}^T\mathbf{x})\\]
\\[ P(0|\mathbf{x}) = \frac{1}{1+\exp(\mathbf{w}^T\mathbf{x})} =1-\sigma(\mathbf{w}^T\mathbf{x})\\]
Here $$\sigma$$ is the so called [logistic function](https://en.wikipedia.org/wiki/Logistic_function).
