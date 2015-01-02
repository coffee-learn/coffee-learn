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

