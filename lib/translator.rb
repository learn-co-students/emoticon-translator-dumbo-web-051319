# require modules here
require "yaml"
def load_library(file_patch)
emoticons = YAML.load_file(file_patch)
library={
'get_meaning' => {},
'get_emoticon' => {}
 }
 emoticons.each do |feeling, e_j|
   library['get_meaning'][e_j[1]] = feeling
   library['get_emoticon'][e_j[0]] = e_j[1]
end
library
end

def get_japanese_emoticon(file_path, emoticon)
  load = load_library(file_path)
  load["get_emoticon"].each do |american_emoticon, japanese_emoticon|
  if american_emoticon == emoticon
    return japanese_emoticon
  end
end
      return "Sorry, that emoticon was not found"
end

def get_english_meaning(path,emoticon)
  # code goes here
  load = load_library(path)
  load["get_meaning"].each do |japanese_emoticon, meaning|
    if emoticon == japanese_emoticon
      return meaning
    end
  end
  return "Sorry, that emoticon was not found"
end
