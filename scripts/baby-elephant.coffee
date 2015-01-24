# Description:
#   Get a baby elephant
#
# Commands:
#   hubot baby elephant me - Grab a random GIF from http://www.reddit.com/r/babyelephantgifs/
#
# Author:
#   rowanmanning

request = require 'request'

module.exports = (robot) ->
  robot.hear /baby elephant/, (msg) ->
    request 'http://www.reddit.com/r/babyelephantgifs/hot.json', (err, res, body) ->
      results = JSON.parse(body).data
      resultIndex = Math.floor(Math.random() * (results.children.length - 0) + 0)
      whichResult = results.children[resultIndex].data

      msg.send whichResult.url
