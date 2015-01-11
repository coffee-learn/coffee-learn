# IRLS(Iterative Reweithted Least Squares Method)
{Matrix} = require '../math/matrix'

module.exports.IRLS = class IRLS
  constructor: (dataset, @model, @use_bias=false) ->
    @X = new Matrix(JSON.parse(JSON.stringify(dataset['x'])))
    @Y = new Matrix(JSON.parse(JSON.stringify(dataset['y'])))
    if @use_bias = true
      @X.matrix[i].push 1 for i in [0 ... @X.row()]
    @model.setup(nvis=@X.col())

  train: ->
    N = @X.row()
    phi = @X
    R = Matrix.zeros(N, N)
    Y = []
    for n in [0 ... N]
      y_n = @model.fprop(new Matrix([@X.matrix[n]]))
      R.matrix[n][n] = y_n * (1 - y_n)
      Y.push [y_n]
    H = Matrix.dot(phi.T(), Matrix.dot(R, phi))
    w_new = Matrix.sub(@model.layer.w,
      Matrix.dot(H.inv(),
        Matrix.dot(phi.T(),
          Matrix.sub(new Matrix(Y), @Y)
        )
      )
    )
    diff = Matrix.norm(Matrix.sub(w_new, @model.layer.w)) / Matrix.norm(@model.layer.w)
    @model.layer.w = w_new
    return diff

  validate: ->
    results = []
    correct = 0
    for n_in, i in @X.matrix
      predict_y = @model.predict(new Matrix([n_in]))
      results.push([predict_y])
      if predict_y == @Y.matrix[i][0]
        correct += 1
    return [@X.matrix, @Y.matrix, results, 100 * (correct / @Y.row())]

  fprop: (n_in, detail=false) ->
    return @model.fprop(new Matrix([n_in]), detail)

  predict: (n_in) ->
    return @model.predict(new Matrix([n_in]))



