require 'yaml'
require 'pry'

def load_library(file_path)
  emoticons_file = YAML.load_file(file_path)
  return_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  emoticons_file.each do |meaning, emoticons|
    return_hash["get_meaning"][emoticons[1]] = meaning
    return_hash["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  return_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emo_hash = load_library(file_path)
  if emo_hash["get_emoticon"].keys.include?(emoticon)
    emo_hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  emo_hash = load_library(file_path)
  if emo_hash["get_meaning"].keys.include?(emoticon)
    emo_hash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"  
  end
end
