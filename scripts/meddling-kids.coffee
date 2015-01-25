# Description:
#   Post a villain
#
# Author:
#   jakenewby


module.exports = (robot) ->
  robot.hear /meddling kids/, (msg) ->
        msg.send 'http://memecrunch.com/image/52581a521605fb72a20000bb.jpg'
