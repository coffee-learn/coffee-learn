coffee -co lib src
browserify lib/cflearn.js | uglifyjs > cflearn.min.js
