# require modules here
require "yaml"
require "pry"
def load_library (yamlPath)
  # code goes here
  emotemp = YAML.load_file(yamlPath)
  emot = {}
  meaning = {}
  emoticon = {}
  emotemp.each do |key, emo|
    meaning[emo[1]] = key
    emoticon[emo[0]] = emo[1]
  end
  emot["get_meaning"] = meaning
  emot["get_emoticon"] = emoticon
  return emot
end

def get_japanese_emoticon (yamlPath, emo)
  # code goes here
  emot = load_library (yamlPath)
  if emot["get_emoticon"].key?(emo)
    return emot["get_emoticon"][emo]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning (yamlPath, emo)
  # code goes here
  emot = load_library (yamlPath)
  if emot["get_meaning"].key?(emo)
    return emot["get_meaning"][emo]
  else
    return "Sorry, that emoticon was not found"
  end
end
