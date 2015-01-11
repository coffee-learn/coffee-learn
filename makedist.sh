coffee -co lib src
browserify lib/cflearn.js | uglifyjs > dist/cflearn.min.js
