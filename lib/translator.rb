require "yaml"
require "pry"

def load_library(path)
  j_emoticons = YAML.load_file(path)
  get_emoticon = {}
  get_meaning = {}
  j_emoticons.each do |meaning, emoto_hash|
    get_emoticon[emoto_hash[0]] = emoto_hash[1]
    get_meaning[emoto_hash[1]] = meaning
  end
  new_hash = {"get_emoticon" => get_emoticon, "get_meaning" => get_meaning}
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  if !library["get_emoticon"][emoticon]
    "Sorry, that emoticon was not found"
  else
    library["get_emoticon"][emoticon]
  end
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
    if !library["get_meaning"][emoticon]
    "Sorry, that emoticon was not found"
  else
    library["get_meaning"][emoticon]
  end
end