# AdaBoost-CNN: An Adaptive Boosting algorithm for Convolutional Neural Networks to classify Multi-Class Imbalanced datasets using Transfer Learning

For All use of the data, please 'cite' the following:

Taherkhani, A, Cosma, G, McGinnity, M (2020) AdaBoost-CNN: an adaptive boosting algorithm for convolutional neural networks to classify multi-class imbalanced datasets using transfer learning, Neurocomputing, 404, pp.351-366, ISSN: 0925-2312. DOI: 10.1016/j.neucom.2020.03.064.

The paper is available from:
https://authors.elsevier.com/a/1b6a73INukEAdx

and:

https://doi.org/10.1016/j.neucom.2020.03.064

# How to run

-To run the AdaBoost-CNN and a single CNN on the synthetic data run ‘test2_CNN.py’.

-The code will generate random synthetic data, and it trains and tests the two methods (AdaBoost-CNN and a single CNN) on this data.

-The variable ‘n_estimators’ before ‘Ada_CNN’ has been set to 10. It determines the number of estimators in the AdaBoost-CNN.

-The variable ‘epoch’ sets the number of training epochs of a CNN estimator in the AdaBoost-CNN.

# Requirment

This code is tested on Python 3.5.4 |Continuum Analytics, Inc.| (default, Aug 14 2017, 13:41:13) [MSC v.1900 64 bit (AMD64)]. It implements CNN by Keras Using TensorFlow backend.
