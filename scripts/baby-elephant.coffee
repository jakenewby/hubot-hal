# Description:
#   Get a baby elephant
#
# Author:
#   anthonator

request = require 'request'

GFYCAT_REGEX = /https?:\/\/(www\.)?gfycat\.com\//i

module.exports = (robot) ->
  robot.hear /baby elephant/, (msg) ->
    request 'http://www.reddit.com/r/babyelephantgifs/hot.json', (err, res, body) ->
      doGif JSON.parse(body).data, (gif) ->
        msg.send gif

doGif = (results, done) ->
  resultIndex = Math.floor(Math.random() * (results.children.length - 0) + 0)
  whichResult = results.children[resultIndex].data
  gif = whichResult.url
  #gif = 'https://gfycat.com/FatalFluidHarrier'

  if gif.match GFYCAT_REGEX
    request gif.replace(GFYCAT_REGEX, 'http://gfycat.com/cajax/get/'), (err, res, body) ->
      done JSON.parse(body).gfyItem.gifUrl
  else if gif.match /\.gif$/
    done gif
  else
    doGif results, done
