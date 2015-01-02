# module.exports.Matrix = class Matrix
module.exports.Matrix = class Matrix
  constructor: (array) ->
    @matrix = array

  matrix: ->
    return @matrix

  row: ->
    return @matrix.length

  col: ->
    return @matrix[0].length

  T: ->
    t_matrix = []
    for col in [0 ... @col()]
      array = []
      for row in [0 ... @row()]
        array.push @matrix[row][col]
      t_matrix.push array
    return new Matrix(t_matrix)

  inv: ->
    if (@col() != @row())
      throw new Error('matrix dimensions are not valid')
    M = JSON.parse(JSON.stringify(@matrix))
    N = @row()
    for row in [0 ... N]
      for col in [0 ... N]
        if col == row
          M[row].push(1)
        else
          M[row].push(0)
    for i in [0 ... N]
      pivot = M[i][i]
      for j in [0 ... 2 * N]
        M[i][j] = (1 / pivot) * M[i][j]
      for k in [i + 1 ... N]
        mul = M[k][i]
        for n in [i ... 2 * N]
          M[k][n] = M[k][n] - mul * M[i][n]
    for i in [N - 1 ... 0]
      for k in [i - 1 .. 0]
        mul = M[k][i]
        for n in [i ... 2 * N]
          M[k][n] = M[k][n] - mul * M[i][n]
    INV = []
    for row in M
      INV.push row[N .. 2 * N]
    return new Matrix(INV)


  @zeros: (row, col, fill=0) ->
    matrix = []
    for r in [0 ... row]
      array = []
      for c in [0 ... col]
        array.push fill
      matrix.push array
    return new Matrix(matrix)

  @identify: (n=2, fill=1) ->
    E = Matrix.zeros(n, n)
    for row in [0 ... E.row]
      for col in [0 ... E.col]
        E.matrix[row][col] = fill if row == col
    return E

  @add: (matrix_A, matrix_B) ->
    if (matrix_A.row() != matrix_B.row()) or (matrix_A.col() != matrix_B.col())
      throw new Error('matrix dimensions are not valid')
    answer = []
    for row in [0 ... matrix_A.row()]
      answer.push []
      for col in [0 ... matrix_B.col()]
        answer[row][col] = matrix_A.matrix[row][col] + matrix_B.matrix[row][col]
    return new Matrix(answer)

  @sub: (matrix_A, matrix_B) ->
    if (matrix_A.row() != matrix_B.row()) or (matrix_A.col() != matrix_B.col())
      throw new Error('matrix dimensions are not valid')
    answer = []
    for row in [0 ... matrix_A.row()]
      answer.push []
      for col in [0 ... matrix_B.col()]
        answer[row][col] = matrix_A.matrix[row][col] - matrix_B.matrix[row][col]
    return new Matrix(answer)


  @dot: (matrix_A, matrix_B) ->
    if (matrix_A.col() != matrix_B.row())
      throw new Error('matrix dimensions are not valid')
    answer = []
    for row in [0 ... matrix_A.row()]
      array = []
      for col in [0 ... matrix_B.col()]
        sum = 0.0
        for i in [0 ... matrix_A.col()]
          sum += matrix_A.matrix[row][i] * matrix_B.matrix[i][col]
        array.push sum
      answer.push array
    return new Matrix(answer)

  @get_obj_type: (obj) ->
    return {}.toString.call(obj)


