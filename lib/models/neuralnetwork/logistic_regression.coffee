{Matrix} = require '../../math/matrix'


module.exports.LogisticRegression = class LogisticRegression
  constructor: (@layer, @is_classify=false) ->
    return

  layer: ->
    return @layer

  setup: (@nvis) ->
    console.log 'setup'
    @layer.setup(n_in=@nvis)

  fprop: (n_in) ->
    return @layer.fprop(n_in)

  predict: (n_in) ->
    if @is_classify
      return @layer.classify(n_in)
    else
      return @layer.fprop(n_in)

module.exports.Sigmoid = class Sigmoid
  constructor: (@layer_name, @dim, @basis_function=null) ->
    return
  w: ->
    return @w
  dim: ->
    return @dim
  phi: ->
    return
  setup: (n_in=0) ->
    @w = Matrix.zeros(n_in, @dim)
  fprop: (n_in) ->
    return @sigmoid(Matrix.dot(n_in, @w).matrix)
  classify: (n_in) ->
    if @fprop(n_in) >= 0.5
      return 1
    else
      return 0
  sigmoid: (x) ->
    return 1 / (1 + Math.exp(-x))


