Modernizr.load [
  load: ["/js/jquery.min.js", "/js/loader.js"]
  complete: ->
    load_ready()
    return
]

load_ready = ->

  # foundation5 for IE8 polyfill.
  # http://foundation.zurb.com/forum/posts/3189-foundation-5-orbit-slider-ie8-issue
  (($) ->
    unless Foundation.stylesheet
      Foundation._style_element = $("<style></style>").appendTo("head")[0]
      Foundation.stylesheet = Foundation._style_element.styleSheet
      if Foundation.stylesheet
        Foundation.stylesheet.cssRules = length: 0
        Foundation.stylesheet.insertRule = (rule, index) ->
          media = undefined
          mediaMatch = undefined
          mediaRegex = undefined
          namespace = undefined
          ruleMatch = undefined
          ruleRegex = undefined
          mediaRegex = /^\s*@media\s*(.*?)\s*\{\s*(.*?)\s*\}\s*$/
          mediaMatch = mediaRegex.exec(rule)
          media = ""
          if mediaMatch
            media = "@media " + mediaMatch[1] + " "
            rule = mediaMatch[2]
          ruleRegex = /^\s*(.*?)\s*\{\s*(.*?)\s*\}\s*$/
          ruleMatch = ruleRegex.exec(rule)
          namespace = "" + media + ruleMatch[1]
          rule = ruleMatch[2]
          @addRule namespace, rule
      else console.log "Could not fix Foundation css rules..."  if window.console
    return
  ) jQuery

  # foundation5 initialize.
  $(document).foundation()
