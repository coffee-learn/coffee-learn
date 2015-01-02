{LogisticRegression} = require './logistic_regression'
{Sigmoid} = require './base'
{MLP} = require './mlp'

NeuralNetwork = {}
NeuralNetwork.LogisticRegression = LogisticRegression
NeuralNetwork.Sigmoid = Sigmoid
# NeuralNetwork.MLP = MLP

module.exports = NeuralNetwork
