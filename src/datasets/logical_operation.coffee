module.exports.OR = class OR
  constructor: ->
    @x = [
      [0, 0]
      [0, 1]
      [1, 0]
      [1, 1]
    ]
    @y = [
      [0]
      [1]
      [1]
      [1]
    ]

module.exports.XOR = class XOR
  constructor: ->
    @x = [
      [0, 0]
      [0, 1]
      [1, 0]
      [1, 1]
    ]
    @y = [
      [0]
      [1]
      [1]
      [0]
    ]
