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


