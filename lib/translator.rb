require "yaml"
require "pry"

def load_library(path)
  path = YAML.load_file('./lib/emoticons.yml')
  new_hash = Hash.new
  new_hash['get_meaning'] = Hash.new
  new_hash['get_emoticon'] = Hash.new
  path.each do |meaning, emoticon|
    new_hash['get_meaning'][emoticon[1]] = meaning
    new_hash['get_emoticon'][emoticon[0]] = emoticon[1]
  end
  new_hash
end

def get_japanese_emoticon(path, your_emoticon)
  translator = load_library(path)
  if !translator['get_emoticon'].keys.include?(your_emoticon)
    return "Sorry, that emoticon was not found"
  else
    translator['get_emoticon'][your_emoticon]
  end
end

def get_english_meaning(path, your_emoticon)
  store_meaning = ""
  translator = load_library(path)
  if !translator['get_meaning'].keys.include?(your_emoticon)
    return "Sorry, that emoticon was not found"
  else
    translator['get_meaning'][your_emoticon]
  end
end

load_library(YAML.load_file('./lib/emoticons.yml'))
