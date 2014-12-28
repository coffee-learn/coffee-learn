# Logistic regression to classify XOR

## import Libraries
{LogisticRegression, Sigmoid} = require '../lib/models/neuralnetwork/logistic_regression'
{IRLS} = require '../lib/train/irls'
{OR, XOR} = require '../datasets/logical_operation'

## Setting for Simple Perceptron
dataset = OR
layer = new Sigmoid(layer_name='output', dim=1, basis_function='gaussian')
model = new LogisticRegression(layer=layer, is_classify=true)

## Training
trainer = new IRLS(dataset, model, use_bias=true)
N = 10
trainer.validate()
for n in [0 ... N]
  trainer.train()
  trainer.validate()
