require 'yaml'
emoticons = YAML.load_file('./lib/emoticons.yml')

def load_library(file_path)
  require 'yaml'
  emoticons = YAML.load_file(file_path)
  new_hash = {}
  emoticons.each do |meaning, emoticon|
    us_emoticon = emoticon[0]
    jp_emoticon = emoticon[1]
    if new_hash.key?("get_meaning") == false
      new_hash["get_meaning"]= {}
      new_hash["get_emoticon"] = {}
      new_hash["get_meaning"] = new_hash["get_meaning"].merge("#{jp_emoticon}" => meaning)
      new_hash["get_emoticon"] = new_hash["get_emoticon"].merge("#{us_emoticon}"=> jp_emoticon)
    else
      new_hash["get_meaning"][jp_emoticon] = meaning
      new_hash["get_emoticon"][us_emoticon] = jp_emoticon
    end
  end
  new_hash
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  if !library["get_emoticon"][emoticon]
    "Sorry, that emoticon was not found"
  else
    library["get_emoticon"][emoticon]
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
    if !library["get_meaning"][emoticon]
    "Sorry, that emoticon was not found"
  else
    library["get_meaning"][emoticon]
  end
end
