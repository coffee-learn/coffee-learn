request = require "request"
path    = require "path"
fs      = require "fs"

module.exports.Car = class Car
  constructor: (@src_path) ->
    @is_browser = typeof window != 'undefined'
    @x          = []
    @y          = []
    @hasData()
    unless @is_browser
      @src_path  = 'http://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data'
    unless @hasData()
      @download()
    @parse()

  hasData: ->
    if @is_browser
      sessionStorage.getItem('car') != null
    else
      fs.existsSync(path.join(__dirname, '../../data/car.data'))

  download: ->
    if @is_browser
      $.ajax
        async:     false
        type:      "GET"
        url:       @src_path
        dataType:  "text"
        context:    this
        success:   (data, status, xhr)   ->
          if typeof(Storage) == "undefined"
            alert "このブラウザではこのデータで試すことができません。"
          else
            sessionStorage.setItem('car', data)
            console.log "data download was done."
        error:     (xhr,  status, error) -> alert status
        complete:  (xhr, status)         -> alert status
    else
      request('http://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data')
        .pipe(fs.createWriteStream(path.join(__dirname, '../../data/car.data')))

  parse: ->
    if @is_browser
      raw_data = sessionStorage.getItem('car')
    else
      raw_data = fs.readFileSync(path.join(__dirname, '../../data/car.data'), 'utf8')
    _data = raw_data.split("\n")
    for line in _data
      features = line.split(',')
      _x       = []
      _y       = []
      if features.length == 7
        _x.push switch features[0]
          when "low"   then 1
          when "med"   then 2
          when "high"  then 3
          when "vhigh" then 4
          else -1
        _x.push switch features[1]
          when "low"   then 1
          when "med"   then 2
          when "high"  then 3
          when "vhigh" then 4
          else -1
        _x.push switch features[2]
          when "2"     then 2
          when "3"     then 3
          when "4"     then 4
          when "5more" then 5
          else -1
        _x.push switch features[3]
          when "2"     then 2
          when "4"     then 4
          when "more"  then 5
          else -1
        _x.push switch features[4]
          when "small" then 1
          when "med"   then 2
          when "big"   then 3
          else -1
        _x.push switch features[5]
          when "low"   then 1
          when "med"   then 2
          when "high"  then 3
          else -1
        _y.push switch features[6]
          when "unacc"   then 0
          else 1
        @x.push _x
        @y.push _y

