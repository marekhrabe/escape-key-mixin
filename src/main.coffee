listeners = []

window?.addEventListener 'keydown', (e) ->
  if e.keyCode is 27
    callback?(e) for callback in listeners


module.exports =
  componentDidMount: ->
    callback = @onEscapeKeyPressed
    if typeof callback is 'function'
      listeners.push callback.bind(this)
    else
      console.error 'You need to implement onEscapeKeyPressed when you use EscapeKeyMixin.'

  componentWillUnmount: ->
    index = listeners.indexOf @onEscapeKeyPressed
    if index > -1
      listeners.splice index, 1
