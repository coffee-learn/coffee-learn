coffee -co lib src
browserify lib/cflearn.js | uglifyjs > assets/cflearn.min.js
