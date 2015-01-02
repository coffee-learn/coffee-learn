# Logistic regression to classify OR

## import Libraries
cflearn = require '../src/cflearn'

# ## Setting for Simple Perceptron
dataset = cflearn.Datasets.OR
layer   = new cflearn.Models.NeuralNetwork.Sigmoid(layer_name='output', dim=1, basis_function='gaussian')
model   = new cflearn.Models.NeuralNetwork.LogisticRegression(layer=layer, is_classify=true)

## Training
N = 10
trainer = new cflearn.Train.IRLS(dataset, model, use_bias=true)
trainer.validate()
for n in [0 ... N]
  trainer.train()
  trainer.validate()
