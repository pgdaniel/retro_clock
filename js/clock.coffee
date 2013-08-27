Clock = do ($) ->
  $ ->
    Clock.initialize()
  console.log "Tick-TOCK"

  $minutesOnes: null
  $minutesTens: null
  $hoursTens: null
  $hoursOnes: null
  time: null

  initialize: ->
    @time = [0, 0, 0, 0]
    @$minutesOnes = $(".minutes-ones")
    @$minutesOnesBack = $(".minutes-ones-back")
    @$minutesTens = $(".minutes-tens")
    @$minutesTensBack = $(".minutes-tens-back")
    @$hoursOnes = $(".hours-ones")
    @$hoursOnesBack = $(".hours-ones-back")
    @$hoursTens = $(".hours-tens")
    @$hoursTensBack = $(".hours-tens-back")
    @_getTime()

    delay = 1000 * 60
    setTimeout((=>
      setTimeout arguments.callee, delay
      @_getTime()
      ), delay)

  _getTime: ->
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
    if hours <= 12
      hoursString = hours.toString()
      @time[1] = hoursString if hoursString.length == 1
      [ @time[0], @time[1] ] = ["1","2"] if hours == 0
      [ @time[0], @time[1] ] = [ hoursString[0], hoursString[1] ] if hoursString.length == 2

    if hours > 12
      hoursString = (hours - 12).toString()
      if hoursString.length == 1
        @time[1] = hoursString
      else
       [ @time[0], @time[1] ] = [ hoursString[0], hoursString[1] ]

  _populateDigits: ->
    timeMinsOnes = parseInt(@time[3])
    timeMinsOnesBack = if timeMinsOnes < 8  then timeMinsOnes + 1 else  0
    timeMinsTens = parseInt(@time[2])
    timeMinsTensBack = if timeMinsTens < 4 then timeMinsTens + 1 else 0
    timeHoursOnes = parseInt(@time[1])
    timeHoursOnesBack = if timeHoursOnes < 8 then timeHoursOnes + 1 else 0
    timeHoursTens = parseInt(@time[0])
    timeHoursTensBack = if timeHoursTens < 1 then timeHoursTens + 1 else 0

    @$minutesOnes.text(timeMinsOnes)
    @$minutesOnesBack.text(timeMinsOnesBack)
    @$minutesTens.text(timeMinsTens)
    @$minutesTensBack.text(timeMinsTensBack)
    @$hoursOnes.text(timeHoursOnes)
    @$hoursOnesBack.text(timeHoursOnesBack)
    @$hoursTens.text(timeHoursTens)
    @$hoursTensBack.text(timeHoursTensBack)
