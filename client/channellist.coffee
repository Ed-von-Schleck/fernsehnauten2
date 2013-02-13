Template.channellist.helpers
  channels: ->
    return Channels.find()

Template.channellist.events
  "click button.channelbutton": (event) ->
    now = +new Date / 1000 | 0
    program = Programs.findOne
      channel: event.target.id
      start: $lt: now
      stop: $gt: now
    Meteor.call "like", program._id, program.title[0][0]
