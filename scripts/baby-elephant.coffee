# Description:
#   Get a baby elephant
#
# Commands:
#   hubot baby elephant me - Grab a random GIF from http://www.reddit.com/r/babyelephantgifs/
#
# Author:
#   rowanmanning

request = require 'request'

GFYCAT_REGEX = /https?:\/\/(www\.)?gfycat\.com\//i

module.exports = (robot) ->
  robot.hear /baby elephant/, (msg) ->
    request 'http://www.reddit.com/r/babyelephantgifs/hot.json', (err, res, body) ->
      results = JSON.parse(body).data
      resultIndex = Math.floor(Math.random() * (results.children.length - 0) + 0)
      whichResult = results.children[resultIndex].data
      gif = whichResult.url
      #gif = 'http://www.gfycat.com/FirsthandGleefulHammerkop'

      if gif.match GFYCAT_REGEX
        request gif.replace(GFYCAT_REGEX, 'http://gfycat.com/cajax/get/'), (err, res, body) ->
          msg.send JSON.parse(body).gfyItem.gifUrl
      else
        msg.send gif
