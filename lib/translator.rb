# require modules here
require "yaml"
require 'pry'

#load_library
  #accepts one argument, the file path
  #return value
    #returns a hash
    #has two keys, 'get_meaning' and 'get_emoticon' (FAILED - 1)
    #the keys 'get_meaning' and 'get_emoticon' point to inner hashes (FAILED - 2)
    #the keys inside the 'get_meaning' hash are the Japanese emoticons (FAILED -3)
    #the emoticon keys inside the 'get_meaning' hash point to their meanings (FAILED - 4)
    #the keys inside the 'get_emoticon' hash are the English emoticons (FAILED -5)
    #the emoticon keys inside the 'get_emoticon' hash point to their Japanese equivalents (FAILED - 6)

def load_library(path)
  # code goes here
  data = YAML.load_file(path)
  
  YAML.dump("foo")
    { :a => 'b'}.to_yaml
  #data.map do |english, japanese|
  #  binding.pry
  #end
  binding.pry
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end