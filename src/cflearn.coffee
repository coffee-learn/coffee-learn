cflearn        = {}
module.exports = cflearn

Math     = require './math/math'
Models   = require './models/models'
Train    = require './train/train'
Datasets = require './datasets/datasets'

cflearn.Math     = Math
cflearn.Models   = Models
cflearn.Train    = Train
cflearn.Datasets = Datasets

global.cflearn = cflearn
