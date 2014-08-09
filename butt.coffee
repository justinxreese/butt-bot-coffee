# Description:
#   Replaces words with "butt"
#
# Commands
#   hubot butt me <sentence> - will buttify a given sentence
#
# Dependencies
#   "underscore": "1.3.3",
#
# Author
#   Justin Reese - @justinxreese

_ = require("underscore")

module.exports = (robot) ->
  # list of stopwords to ignore for butting
  stopwords = [ ".", "a", "about", "above", "absent", "across", "after",
  "against", "all", "along", "among", "an", "and", "are", "around", "as", "at",
  "atop", "be", "before", "behind", "below", "beneath", "beside", "besides",
  "between", "beyond", "but", "by", "can", "could", "couldnt", "couldn't",
  "do", "dont", "don't", "down", "during", "each", "except", "for", "from",
  "had", "has", "have", "he", "he'll", "her", "him", "his", "how", "i", "I",
  "I'm", "i'm", "im", "if", "in", "inside", "into", "is", "it", "it's", "I've", "ive",
  "i've", "least", "like", "many","might", "must", "near", "need", "next", "not",
  "of", "off", "on", "one", "onto",
  "opposite", "or", "other", "out", "outside", "over", "past", "per", "plus",
  "round", "said", "she", "should", "shouldnt", "shouldn't", "since", "so",
  "some", "than", "that", "the", "their", "them", "then", "there", "these",
  "they", "they'll", "they're", "this", "think", "through", "till", "times",
  "to", "toward", "towards", "under", "unlike", "until", "up", "upon", "via",
  "was", "we", "we'll", "we're", "were", "what", "when", "which", "will",
  "with", "within", "without", "word", "won't", "wont", "worth", "would",
  "you", "you'll", "you're", "your" ]

  # main script runner
  buttify = (str) ->
    words = _.uniq str.split(' ')
    words = _.difference words, stopwords
    word_to_butt = words[Math.floor(Math.random() * words.length)]
    re = new RegExp(word_to_butt, "g")
    butt_word = "butt"
    if word_to_butt.slice(-3) == "ing"
      butt_word = "butting"
    if word_to_butt.slice(-2) == "ed"
      butt_word = "butted"
    if word_to_butt.slice(-1) == "s"
      butt_word = "butts"
    str = str.replace(re, butt_word)
    if str == "butt"
      str = "butts lol"
    str

  # On demand butts
  robot.respond /butt me (.*)/i, (msg) ->
    msg.send buttify(msg.match[1])
