# Softmax on Digits Data with TensorFlow

In this tutorial, we will basically follow the [official tutorial](https://www.tensorflow.org/get_started/mnist/beginners) but will change some parts to make it easier to understand.

TensorFlow provides a very creative frame for machine learning programming. We will first build a structure(graph) for the algorithm and then feed the data and run the session. In the graph, the operations are the vertices and data flows on the edges.

## Softmax
In short, Softmax is the multi-class logistic discrimination. For a linear discrimination, the discriminant function is defined as:
\\( x^{2} \\)
\\[ \frac{1}{n^{2}} \\]