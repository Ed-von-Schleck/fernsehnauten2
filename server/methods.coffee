Meteor.methods
  like: (program_id, program_title) ->
    return if not @userId?
    query =
      _id: @userId
      "profile.history": $ne: program_id
    user = Meteor.users.findOne query
    return if not user?
    unless "history" of user.profile
      user.profile.history = []
    user.profile.history.push program_id
    unless "program_title_counter" of user.profile
      user.profile.program_title_counter = {}
      user.profile.program_title_counter[program_title] = 0
    user.profile.program_title_counter[program_title] += 1
    Meteor.users.update @userId, user




