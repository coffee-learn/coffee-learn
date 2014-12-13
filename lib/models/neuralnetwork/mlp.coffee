{Matrix} = require '../../math/matrix'


module.exports.MLP = class MLP
  constructor: (layers, nvis) ->
    @layers = layers
    @nvis = nvis
    @setup()

  layers: ->
    return @layers

  setup: ->
    console.log 'setup'
    for i in [0 ... @layers.length]
      if i == 0
        @layers[i].setup(n_in=@nvis)
      else
        @layers[i].setup(n_in=@layers[i - 1].dim)

  predict: (n_in) ->
    for layer in @layers
      n_in = layer.fprop(n_in)
    return n_in

module.exports.Sigmoid = class Sigmoid
  constructor: (layer_name, dim) ->
    @layer_name = layer_name
    @dim = dim
  w: ->
    return @w
  dim: ->
    return @dim
  setup: (n_in=0) ->
    @w = Matrix.zeros(n_in, @dim, fill=1.0)
  fprop: (n_in) ->
    return @sigmoid(Matrix.dot(n_in, @w).matrix)
  classify: (n_in) ->
    if @fprop(n_in) >= 0.5
      return 1
    else
      return 0
  sigmoid: (x) ->
    return 1 / (1 + Math.exp(-x))


