import 'preceptron.dart';

class Layer {
  List<Perceptron> neurons;
  Layer(this.neurons);
  List<double> forward(List<double> inputs) {
    return [
      for (var neuron in neurons) neuron.forward(inputs),
    ];
  }
}
