countdown = ->
  now     = moment()
  end     = moment new Date("October 24, 2015 00:00:00") 
  days    = end.diff(now, "days")
  hours   = end.diff(now, "hours") % 24
  minutes = end.diff(now, "minutes") - ((hours * 60) + (days * 1440))
  seconds = end.diff(now, "seconds") - ((minutes * 60) + (hours  * 3600) + (days * 86400))

  setTimeout ->
    countdown()
  , 1000
  
  $("[js-countdown='day']").text days
  $("[js-countdown='hour']").text hours
  $("[js-countdown='minute']").text minutes
  $("[js-countdown='second']").text seconds

$ ->
  countdown()

  toggleMobileModal = (action) ->
    if action == "open"
      $("[js-menu]").attr "s-active", true

    else if action == "close"
      $("[js-menu]").removeAttr "s-active"

    else
      if $("[js-menu]").is "[s-active]"
        $("[js-menu]").removeAttr "s-active"
      else
        $("[js-menu]").attr "s-active", true

  $("[js-toggle-menu]").click ->
    toggleMobileModal("open")
  
  $("[js-close-navigation]").click ->
    toggleMobileModal("close")

  $('a[href^="#"]').on 'click', (e) ->
    target = $(this).attr "href"
    if target.length
      e.preventDefault()
      $('html, body').animate
          scrollTop: $(target).offset().top
      , 1000
  
  targets = []
  $(".navigation--link").each ->
    target = $(this).attr "href"
    targets.push target
  
  $(window).scroll ->
    windowPos = $(window).scrollTop()
    windowHeight = $(window).height()
    docHeight = $(document).height()

    for target, i in targets
      theID = targets[i]
      divPos = $(theID).offset().top
      divHeight = $(theID).height()
      if windowPos >= divPos && windowPos < (divPos + divHeight)
        $(".navigation--link[href='#{ theID }']").attr "s-active", true
      else
        $(".navigation--link[href='#{ theID }']").removeAttr "s-active"

    if windowPos + windowHeight == docHeight
      if !$(".navigation--link:last-child").attr "s-active"
          $(".navigation--link").removeAttr "s-active"
          $("nav li:last-child a").attr "s-active", true

