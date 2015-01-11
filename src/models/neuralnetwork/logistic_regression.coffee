{Matrix} = require '../../math/matrix'

module.exports.LogisticRegression = class LogisticRegression
  constructor: (@layer, @is_classify=false) ->
    return

  layer: ->
    return @layer

  setup: (@nvis) ->
    @layer.setup(n_in=@nvis)

  getParams: ->
    return w: [@layer.w.matrix], dim: [@nvis, @layer.dim]

  fprop: (n_in, detail=false) ->
    if detail
      return [n_in.matrix[0], [@layer.fprop(n_in)]]
    else
      return @layer.fprop(n_in)

  predict: (n_in) ->
    if @is_classify
      return @layer.classify(n_in)
    else
      return @layer.fprop(n_in)

