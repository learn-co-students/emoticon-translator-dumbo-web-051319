# require modules here
require "yaml"

#############################################################
def load_library(library)
  file = YAML.load_file(library)

  eng_to_jap = {}
  jap_to_word = {}

  file.each { |meaning, emoticons|
    eng_to_jap[emoticons[0]] = emoticons[1]
    jap_to_word[emoticons[1]] = meaning
  }

  result = { "get_meaning" => jap_to_word, "get_emoticon" => eng_to_jap }

  return result
end

################################################################

def get_japanese_emoticon(library, emoji)
  emoticon_hash = load_library(library)
  eng_to_jap_hash = emoticon_hash["get_emoticon"]

  if eng_to_jap_hash.has_key?(emoji)
    puts "found"
    jap_emoji = eng_to_jap_hash[emoji]
    return jap_emoji
  else
    return "Sorry, that emoticon was not found"
  end
end

###############################################################

def get_english_meaning(library, emoji)
  emoticon_hash = load_library(library)
  jap_to_meaning_hash = emoticon_hash["get_meaning"]
  pp jap_to_meaning_hash

  if jap_to_meaning_hash.has_key?(emoji)
    puts "found"
    meaning = jap_to_meaning_hash[emoji]
    puts meaning
    return meaning
  else
    puts "not found"
    return "Sorry, that emoticon was not found"
  end
end