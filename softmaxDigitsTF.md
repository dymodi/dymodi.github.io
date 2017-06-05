# Softmax on Digits Data with TensorFlow

In this tutorial, we will basically follow the [official tutorial](https://www.tensorflow.org/get_started/mnist/beginners) but will change some parts to make it easier to understand. The contents about logistic regression borrows from Arindam Banerjee's Machine Learning course at University of Minnesota, which corresponds to Ethem Alpaydin's book *Introduction to machine learning*.

The corresponding executable python code of this tutorial can be found [here](https://github.com/dymodi/Machine-Learning/blob/master/ForBlogSoftmaxDigitsTF.py).

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

In the training phase, the following "cross-entropy" cost function is to be minimized,
\\[ E(\mathbf{w},w_0 | \mathcal{X}) =-\sum_tr^t\log y^t +(1-r^t) \log (1-y^t)\\]
here $$r$$ is the label and $$y$$ is the predict value of the model. Here we can raise a question that why some other cost functions are not utilized, we keep this as another topic in future blogs.

Now we come to the problem that there are more than two classes. For each class, we formulate the posterior probability as
\\[ y=\hat{P}(C_i|\mathbf{x}) = \frac{\exp[\mathbf w_i^T]}{\sum_{j=1}^K\exp[\mathbf w_j^T]} \\]

Now the cost function to be minimized becomes:
\\[ E( \{ \mathbf{w}_i, w_0 \}_i | \mathcal X) = -\sum_t\sum_i r^t_i\log y^t_i \\]

The above formula is the so-called softmax.

## Digits Dataset
The dataset used here is bit different from that in the official tutorial. This dataset can be loaded as follows:
```python
# Load data and import numpy libraries
from sklearn.datasets import load_digits
digits = load_digits()
```
The 64 features are the 8*8 pixels of each handwritten graph.

## TensorFlow
In this section we will go through the [code](https://github.com/dymodi/Machine-Learning/blob/master/ForBlogSoftmaxDigitsTF.py) and mainly focus on the modified parts. 

In the following, the data are partitioned as training data and test data where 1/10 are kept as the test data. Since we do not need to select a data among a bunch of candidate model, we do not need a validation set here.
```python
# Divide into train data and test data
train_num = np.int(total_num * 0.9)
X_train = X[0:train_num,:]
y_train = y[0:train_num,:]
X_test = X[train_num:total_num,:]
y_test = y[train_num:total_num,:]
```
In the official tutorial,  the function `mnist.train.next_batch(100)` is used to randomly fetch 100 data points to do the training. Since we are using as different dataset, an auxiliary function as follows is used to shuffle and fetch the data.
```python
# The shuffle_data function shuffle the data randomly
# and return n tuples (X,y) back
def shuffle_data(X,y,n):
    import numpy as np
    X = np.array(X)
    y = np.array(y)
    rows,columns = X.shape
    if rows < n:
        print("ERROR: There is not enough rows in X.")
    rndInd = np.random.permutation(rows)
    return X[rndInd[0:n],:], y[rndInd[0:n],:]
```
In the program, the input data and labels are declared as `placeholder`, which as its name indicates, maintain a place for the future data come to train and predict. The parameter `W` and `b` are declared as `variables`, which can be modified in the training phase and used in the predicting phase. This philosophy can be extended to other machine learning algorithm: we build the pipes and wait for the data. Note that here `b` in the code corresponds to $$w_0$$ in the mathematical derivations. 

The structure for the training is completed with on sentence:
```python
cross_entropy = tf.reduce_mean(
    tf.nn.softmax_cross_entropy_with_logits(labels = y_, logits=y))
train_step = tf.train.GradientDescentOptimizer(0.5).minimize(cross_entropy)
```
Note that at this point, the program is not yet executed, we only build the frame, a session is need to run the code.
``` python
# Create session
sess = tf.InteractiveSession()
```
We also need to initialize all the variables:
```python
# Initialize variables
tf.global_variables_initializer().run()
```

The real training process is also completed in two lines of code:
``` python
# Train model
for _ in range(1000):
    batch_xs, batch_ys = shuffle_data(X_train,y_train,100)
    sess.run(train_step, feed_dict={x:batch_xs, y_:batch_ys})
```
Currently it's not very clear to me why we need to repeat the `train_step` for thousands of times. It seems that TensorFlow does not capsulate the optimization computation, which is confusing to me.


