# IRLS(Iterative Reweithted Least Squares Method)
{Matrix} = require '../math/matrix'

module.exports.IRLS = class IRLS
  constructor: (dataset, @model, @use_bias=false) ->
    @X = new Matrix(dataset['x'])
    @Y = new Matrix(dataset['y'])
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
    console.log phi.T()
    H = Matrix.dot(phi.T(), Matrix.dot(R, phi))
    w_new = Matrix.sub(@model.layer.w,
      Matrix.dot(H.inv(),
        Matrix.dot(phi.T(),
          Matrix.sub(new Matrix(Y), @Y)
        )
      )
    )
    @model.layer.w = w_new

  validate: ->
    for n_in in @X.matrix
      console.log @model.predict(new Matrix([n_in]))



