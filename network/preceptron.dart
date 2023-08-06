import 'dart:math';

class Perceptron {
  List<double> weights;
  double bias;
  Perceptron(this.weights, this.bias);
  double forward(List<double> inputs) {
    assert(inputs.length == weights.length);
    var result = 0.0;
    for (var i = 0; i < inputs.length; i++) {
      result += inputs[i] * weights[i];
    }
    result += bias;
    //ReLU
    result = max(0, result);
    return result;
  }
  void updateWeights(double learningRate, double error, List<double> inputs) {
    for (var i = 0; i < weights.length; i++) {
      weights[i] += learningRate * error * inputs[i];
    }
    bias += learningRate * error;
  }
}
