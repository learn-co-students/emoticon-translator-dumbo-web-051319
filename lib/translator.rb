# require modules here
require "yaml"
require "pry"

def load_library(library)
  emoticon_library = YAML.load_file(library)
  new_library = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
   emoticon_library.each do |meaning, emoticon|
  new_library["get_meaning"][emoticon[1]] = meaning
  new_library["get_emoticon"][emoticon[0]] = emoticon[1]
  end
  new_library
end

def get_japanese_emoticon(path, emoticon)
  new_library = load_library(path)
  new_library["get_emoticon"].each do |american_emoticon, japanese_emoticon|
    if american_emoticon == emoticon
      return japanese_emoticon
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  new_library = load_library(path)
  new_library["get_meaning"].each do |japanese_emoticon, meaning|
    if japanese_emoticon == emoticon
      return meaning
    end
  end
  return "Sorry, that emoticon was not found"
end
