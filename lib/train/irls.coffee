# IRLS(Iterative Reweithted Least Squares Method)
{Matrix} = require '../math/matrix'

module.exports.IRLS = class IRLS
  constructor: (dataset, model) ->
    @X = new Matrix(dataset['x'])
    @Y = new Matrix(dataset['y'])
    @model = model

  train: ->
    N = @X.row
    phi = @X
    R = Matrix.zeros(N, N)
    Y = []
    for n in [0 ... N]
      y_n = @model.fprop(new Matrix([@X.matrix[n]]))
      R.matrix[n][n] = y_n * (1 - y_n)
      Y.push [y_n]
    H = Matrix.dot(phi.T(), Matrix.dot(R, phi))
    w_new = Matrix.sub(@model.w,
      Matrix.dot(H.inv(),
        Matrix.dot(phi.T(),
          Matrix.sub(new Matrix(Y), @Y)
        )
      )
    )
    @model.w = w_new

  validate: ->
    for n_in in @X.matrix
      console.log @model.classify(new Matrix([n_in]))



