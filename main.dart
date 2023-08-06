import 'network/layer.dart';
import 'network/network.dart';
import 'network/preceptron.dart';

void main() {
  // Training data and labels for AND operation
  var andTrainingData = [
    [0.0, 0.0],
    [0.0, 1.0],
    [1.0, 0.0],
    [1.0, 1.0],
  ];
  var andLabels = [0.0, 0.0, 0.0, 1.0];

  // Create the neural network
  var inputLayer = Layer([
    Perceptron([0.5, 0.5], -0.7),
    Perceptron([0.5, 0.5], -0.2),
  ]);

  var outputLayer = Layer([
    Perceptron([1.0, 1.0], -0.5),
  ]);

  var andNetwork = Network([inputLayer, outputLayer]);

    print("-----------------------------------------------");
  print("Training to perform AND Operation");
  print("-----------------------------------------------");

  // Train the AND network
  andNetwork.train(andTrainingData, andLabels, 1000, 0.1);

  // Test the trained AND network
  print("-----------------------------------------------");
  print("Testing to perform AND Operation");
  print("-----------------------------------------------");
  print("0 AND 0 = ${andNetwork.forward([0, 0])[0]}");
  print("0 AND 1 = ${andNetwork.forward([0, 1])[0]}");
  print("1 AND 0 = ${andNetwork.forward([1, 0])[0]}");
  print("1 AND 1 = ${andNetwork.forward([1, 1])[0]}");
  print("-----------------------------------------------");
}
