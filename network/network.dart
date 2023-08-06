import 'layer.dart';

class Network {
  
  List<Layer> layers;
  
  Network(this.layers);
  
  List<double> forward(List<double> inputs) {
    var current = inputs;
    for (var layer in layers) {
      current = layer.forward(current);
    }
    return current;
  }

  void train(List<List<double>> trainingData, List<double> labels, int epochs,
      double learningRate) {
    for (var epoch = 0; epoch < epochs; epoch++) {
      var totalError = 0.0;
      for (var i = 0; i < trainingData.length; i++) {
        var inputs = trainingData[i];
        var label = labels[i];

        var output = forward(inputs);
        var error = label - output[0];
        totalError += error * error;

        // Backpropagation
        for (var j = layers.length - 1; j >= 0; j--) {
          var layer = layers[j];
          var deltas = <double>[];

          for (var k = 0; k < layer.perceptrons.length; k++) {
            var perceptron = layer.perceptrons[k];
            var delta =
                error * (output[0] * (1 - output[0])) * perceptron.weights[k];
            deltas.add(delta);

            perceptron.updateWeights(learningRate, delta, inputs);
          }

          error = deltas.reduce((sum, delta) => sum + delta);
        }
      }

      print("#$epoch");
      print('Error: ${totalError / trainingData.length}\n');
    }
  }
}
