{MLP, Sigmoid, Step} = require '../lib/models/neuralnetwork/mlp'
# {Train} = require '../lib/train/train'
{IRLS} = require '../lib/train/irls'
{XOR} = require '../datasets/XOR'

dataset = XOR
model = new Sigmoid(layer_name='output', dim=1)
model.setup(n_in = dataset['x'][0].length)
# trainer = new Train(dataset, model, new IRLS(0.1))
trainer = new IRLS(dataset, model)
trainer.train(1)
trainer.validate()
# mlp = new cflearn.NeuralNetwork.MLP(1,2)
# console.log mlp
