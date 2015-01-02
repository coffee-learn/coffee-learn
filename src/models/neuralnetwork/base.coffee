{Matrix} = require '../../math/matrix'

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


