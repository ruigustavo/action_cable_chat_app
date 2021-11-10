App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert("You have a new mention") if data.mention
    if (data.message && data.message?)
      $('#messages-table').append data.message
      scroll_bottom()

$(document).on 'turbolinks:load', ->
  submit_message()
  scroll_bottom()

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey
      $('input').click()
      event.target.value = ""
      event.preventDefault()
    
    
    # Called when there's incoming data on the websocket for this channel
scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)


