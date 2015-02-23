
{Random} = require '../src/math/random'

module.exports =
  "uniform": (test) ->
    tmp = Random.uniform(3, 4)
    test.ok tmp > 3
    test.ok tmp <= 4
    test.done()
