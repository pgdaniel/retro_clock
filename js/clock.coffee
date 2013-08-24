Clock = do ($) ->
  $ ->
    Clock.initialize()
  console.log "Tick-TOCK"

  $minutesOnes: null
  $minutesTens: null
  $hoursTens: null
  $hoursOnes: null

  initialize: ->
    @time = [0, 0, 0, 0]
    @$minutesOnes = $(".minutes-ones")
    @$minutesTens = $(".minutes-tens")
    @$hoursOnes = $(".hours-ones")
    @$hoursTens = $(".hours-tens")

    date = new Date
    @_populateMinutes date.getMinutes()
    @_populateHours date.getHours()
    @_populateDigits()

  _populateMinutes:(minutes) ->
    minutesString = minutes.toString()
    if minutesString.length == 1
      @time[3] = minutesString
    else
     [ @time[2], @time[3] ] = [ minutesString[0], minutesString[1] ]

  _populateHours:(hours) ->
    hoursString = hours.toString()
    @time[1] = hoursString if hoursString.length == 1
    [ @time[0], @time[1] ] = ["1","2"] if hours == 0

    if hours > 12
      hoursString = (hours - 12).toString()
      if hoursString.length == 1
        @time[3] = hoursString
      else
       [ @time[0], @time[1] ] = [ minutesString[0], minutesString[1] ]

  _populateDigits: ->
    @$minutesOnes.text @time[3]
    @$minutesTens.text @time[2]
    @$hoursOnes.text @time[1]
    @$hoursTens.text @time[0]
(jQuery)
