countdown = ->
  now     = moment()
  end     = moment( new Date("October 24, 2015 00:00:00") )
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
      $("[js-menu]").attr "s-active", true
  
  $("[js-close-navigation]").click ->
    $("[js-menu]").removeAttr "s-active"