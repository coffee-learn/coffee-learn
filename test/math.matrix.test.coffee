
{Matrix} = require '../lib/math/matrix'

module.exports =
  "zeros": (test) ->
    A = [
      [0, 0, 0, 0]
      [0, 0, 0, 0]
      [0, 0, 0, 0]
    ]
    B = [
      [2, 2, 2, 2]
      [2, 2, 2, 2]
      [2, 2, 2, 2]
      [2, 2, 2, 2]
    ]
    test.ok Matrix.zeros(3, 4).matrix.toString() == A.toString()
    test.ok Matrix.zeros(4, 4, 2).matrix.toString() == B.toString()
    test.done()

  "inv": (test) ->
    A = [
      [1, 2, 1]
      [3, 2, 1]
      [1, 2, 3]
    ]
    A_inv = [
      [-0.5, 0.5, 0]
      [1, -0.25, -0.25]
      [-0.5, 0, 0.5]
    ]
    test.ok new Matrix(A).inv().matrix.toString() == A_inv.toString()
    test.done()

  "add": (test) ->
    A = [
      [1, 2, 3]
      [2, 3, 4]
    ]
    B = [
      [2, 4, 6]
      [3, 6, 9]
    ]
    A_B = [
      [3, 6, 9]
      [5, 9, 13]
    ]
    test.ok Matrix.add(new Matrix(A), new Matrix(B)).matrix.toString() == A_B.toString()
    test.done()
