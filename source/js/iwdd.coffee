Modernizr.load [
  load: ["/js/jquery.min.js", "/js/loader.js"]
  complete: ->
    load_ready()
    return
]

load_ready = ->
  # foundation5 initialize.
  $(document).foundation()
