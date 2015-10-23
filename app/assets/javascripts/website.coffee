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

  $("[js-toggle-menu]").click ->
    if $("[js-menu]").attr "s-active"
      $("[js-menu]").removeAttr "s-active"
    else
      $("[js-mobile-navigation]").css "top", $(window).scrollTop() + "px"
      $("[js-menu]").attr "s-active", true
  
  $("[js-close-navigation], [js-menu-link]").click ->
    $("[js-menu]").removeAttr "s-active"

  $('a[href*=#]:not([href=#])').click ->
    console.log "boom"
    if location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname
      target = $( this.hash)
      target = target.length ? target : $('[name=' + this.hash.slice(1))
      if target.length
        $('html, body').animate
          scrollTop: target.offset().top
        , 1000 
        false