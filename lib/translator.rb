require 'yaml'
require 'pry'

# def load_library(yaml_file)
#   response = {"get_meaning" => {}, "get_emoticon" => {}}
#   library = YAML.load_file(yaml_file)
#   library.each do |trans, emos|
#     response["get_meaning"][emos[1]] = trans
#     response["get_emoticon"][emos[0]] = emos[1]
#   end
#   response
# end






# def load_library(emoticon_file)

#   emoticons = YAML.load_file('./lib/emoticons.yml')

#   emoticon_lib = {'get_meaning'  => {},
#                   'get_emoticon' => {} }

#   emoticons.each do |meaning, value|  # meaning= "surprised"   # value= [":o", "o_O"]  <-(e,j)
#     english = value[0]
#     japanese = value[1]
#     emoticon_lib['get_meaning'][japanese] = meaning
#     emoticon_lib['get_emoticon'][english] = japanese
#   end
#   emoticon_lib
# end


# def get_japanese_emoticon(yaml_file, emoticon)
#   library = load_library(yaml_file)
#   response = nil
#   library["get_emoticon"].each do |english, japanese|
#     if emoticon == english
#       response = japanese
#     end
#   end
#   if response == nil
#     return "Sorry, that emoticon was not found"
#   else
#     return response
#   end
# end

# def get_english_meaning(yaml_file, emoticon)
#   library = load_library(yaml_file)
#   response = nil
#   library["get_meaning"].each do |emo, trans|
#     if emo == emoticon
#       response = trans
#     end
#   end
#   if response == nil
#     return "Sorry, that emoticon was not found"
#   else
#     return response
#   end
# end

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = Hash.new

  emoticon_hash["get_emoticon"] = Hash.new
  emoticon_hash["get_meaning"] = Hash.new

  emoticons.each do |english_word, emoticon_set|
    emoticon_hash["get_emoticon"][emoticon_set.first] = emoticon_set.last
    emoticon_hash["get_meaning"][emoticon_set.last] = english_word
  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end



