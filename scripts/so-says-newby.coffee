module.exports = (robot) ->
  robot.hear /./, (msg) ->
    praises = [
      'Praise be to The Newbs',
      'So it is written in the Book of Newby',
      'The Newbs has spoken',
      'So is the word of The Newb',
      'The Newbeth has pwned thee',
      'So sayeth the Book of Newby™'
    ]

    if msg.message.user.name == 'Jake Newby'
      probability = Math.floor(Math.random() * (10 - 1) + 1)
      praise = praises[Math.floor(Math.random() * (praises.length - 0) + 0)]

      if (probability == 1)
        msg.send praise
