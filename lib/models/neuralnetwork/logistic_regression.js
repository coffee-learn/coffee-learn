// Generated by CoffeeScript 1.8.0
(function() {
  var LogisticRegression, Matrix;

  Matrix = require('../../math/matrix').Matrix;

  module.exports.LogisticRegression = LogisticRegression = (function() {
    function LogisticRegression(layer, is_classify) {
      this.layer = layer;
      this.is_classify = is_classify != null ? is_classify : false;
      return;
    }

    LogisticRegression.prototype.layer = function() {
      return this.layer;
    };

    LogisticRegression.prototype.setup = function(nvis) {
      var n_in;
      this.nvis = nvis;
      console.log('setup');
      return this.layer.setup(n_in = this.nvis);
    };

    LogisticRegression.prototype.fprop = function(n_in) {
      return this.layer.fprop(n_in);
    };

    LogisticRegression.prototype.predict = function(n_in) {
      if (this.is_classify) {
        return this.layer.classify(n_in);
      } else {
        return this.layer.fprop(n_in);
      }
    };

    return LogisticRegression;

  })();

}).call(this);