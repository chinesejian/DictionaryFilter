fs = require 'fs'
path = require 'path'
sys = require 'sys'

filePath = "#{__dirname}/wordlist.txt"

foo = ->
  fs.readFileSync filePath, 'utf8'

exports.generate = (messageLength, letterNumber) ->
  console.log "message length: #{messageLength}", "letter number:#{letterNumber}"
  
  wordlist = foo().split "\n"
  
  targetList = wordlist.filter (x) ->
    if x.length == Number(messageLength)
      unique = {}
      for i in [0 .. x.length - 1]
        key = x.charAt i
        if((key>='a'&&key<='z')||(key>='A'&&key<='Z'))
          unique[key] = key 
      Object.keys(unique).length == Number(letterNumber)
    else false
  
  console.log "targetList length: #{targetList.length}"
  if targetList?.length > 0
    wordString = targetList.join "\n"
    fs.writeFileSync "#{messageLength}_#{letterNumber}.txt", wordString, 'utf8'
