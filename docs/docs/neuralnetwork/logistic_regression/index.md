---
layout: documentation
title:  Logistic Regression
---

# Logistic Regression
```ruby
class cflearn.Models.NeuralNetwork.LogisticRegression(layer=[], is_classify=false)
```

### Methods
```
setup(nvis)
```
Initialize logistic regression units.

- Parameters:  
    - nvis: Size of visible units

```
getParams()
```
Get trained parameters.

- Returns:
    - Weight matrix of each units
    - Dimensions of each units

```
fprop(n_in, detail=false)
```
Forward propagation of a unit.

- Parameters:
    - n_in: Input value of units
    - detail: Get output values recursive
- Returns:
    - if detail=true
        - output values of each layers
    - if detail=false
        - output value of only output layer

```
predict(n_in)
```

- Parameters:
    - n_in: Input value of units
- Returns:
    - Classify / Regression result

### Example in CoffeeScript

```ruby
# Logistic regression to classify OR

## import Libraries
require 'cflearn'

### Setting for Simple Perceptron
dataset = cflearn.Datasets.XOR
layer   = new cflearn.Models.NeuralNetwork.Sigmoid(layer_name='output', dim=1, basis_function='gaussian')
model   = new cflearn.Models.NeuralNetwork.LogisticRegression(layer=layer, is_classify=true)

## Training
N = 10
trainer = new cflearn.Train.IRLS(dataset, model, use_bias=true)
console.log trainer.validate()
for n in [0 ... N]
  trainer.train()
  console.log trainer.validate()
```
