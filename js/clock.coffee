Clock = do ($) ->
  $ ->
    Clock.initialize()
  console.log "Tick-TOCK"

  $minutesOnes: null
  $minutesTens: null
  $hoursTens: null
  $hoursOnes: null

  initialize: ->
    @$minutesOnes = $(".minutes-ones")
    @$minutesTens = $(".minutes-tens")
    @$hoursOnes = $(".hours-ones")
    @$hoursTens = $(".hours-tens")

    date = new Date
    @_populateMinutes date.getMinutes()
    @_populateHours date.getHours()

  _populateMinutes:(minutes) ->
    minutesString = minutes.toString()
    if minutesString.length == 1
      @$minutesOnes.text minutesString
      @$minutesTens = 0
    else
      @$minutesOnes.text minutesString[1]
      @$minutesTens.text minutesString[0]

  _populateHours:(hours) ->
    hoursString = hours.toString()
    if hoursString.length == 1
      @$hoursOnes.text hoursString
      console.log hoursString

    else if hours == 12
      @$hoursOnes.text hoursString[1]
      @$hoursTens.text hoursString[0]

    else if hours > 12
      hoursString = (hours = hours - 12).toString()
      @$hoursOnes.text hoursString if hoursString.length == 1
    else
      @$hoursTens.text hoursString[0]
      @$hoursOnes.text hoursString[1]
(jQuery)
