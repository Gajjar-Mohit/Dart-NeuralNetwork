import 'preceptron.dart';

class Layer {
  
  List<Perceptron> perceptrons;
  
  Layer(this.perceptrons);
  
  List<double> forward(List<double> inputs) {
    return [
      for (var neuron in perceptrons) neuron.forward(inputs),
    ];
  }
}
