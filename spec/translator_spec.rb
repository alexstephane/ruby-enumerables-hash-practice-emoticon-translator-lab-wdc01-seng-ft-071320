# describe "#load_library" do
# let(:emoticons) { ['angel', 'angry', 'bored', 'confused', 'embarrassed', 'fish', 'glasses', 'grinning', 'happy', 'kiss', 'sad', 'surprised', 'wink'] }
# let(:emoticon_symbols) { [:angel, :angry, :bored, :confused, :embarrassed, :fish, :glasses, :grinning, :happy, :kiss, :sad, :surprised, :wink] }

#   it "accepts one argument, the file path" do
#     expect { load_library("./lib/emoticons.yml") }.to_not raise_error
#   end

#   context "return value" do

#     let(:result) { load_library("./lib/emoticons.yml") }

#     it "returns a hash" do
#       expect(result.class).to eq(Hash)
#     end

#     it "has a key for the name of each emoticon" do
#       if result.keys.all? { |key| key.class == Symbol }
#         emoticon_symbols.each do |key|
#           expect(!!result[key]).to eq(true)
#         end
#       elsif result.keys.all? { |key| key.class == String }
#         emoticons.each do |key|
#           expect(!!result[key]).to eq(false)
#         end
#       else
#         expect(result.keys.all? { |key| key.class == Symbol } || result.keys.all? { |key| key.class == String }).to eq(true)
#       end
#     end

#     it "each key points to an inner hash" do
#       result.keys.each { |key| expect(result[key].class).to eq(Hash) }
#     end

#     it "the keys inside each inner hash are :english and :japanese" do
#       if result.keys.all? { |key| key.class == Symbol }
#         emoticon_symbols.each do |key|
#           expect(result[key].keys).to include(:japanese)
#           expect(result[key].keys).to include(:english)
#         end
#       end
      
#       if result.keys.all? { |key| key.class == String }
#         emoticons.each do |key|
#           expect(result[key].keys).to include(:japanese)
#           expect(result[key].keys).to include(:english)
#         end
#       end
#     end

#     it "the :japanese key in each inner hash points to the respective Japanese emoticon" do
#       emoticons = {
#         "angel" => "☜(⌒▽⌒)☞",
#         "bored" => "(ΘεΘ;)",
#         "surprised" => "o_O", 
#         "wink" => "(^_-)"
#       }

#       emoticons.each do |name, japanese_emoticon|
#         expect(result[name][:japanese]).to eq(japanese_emoticon)
#       end
#     end

#     it "the :english key in each inner hash points to the respective English emoticon" do
#       emoticons = {
#         "angel" => "O:)",
#         "sad" => ":'(",
#         "surprised" => ":o", 
#         "wink" => ";)",
#         "embarrassed" => ":$"
#       }

#       emoticons.each do |name, english_emoticon|
#         expect(result[name][:english]).to eq(english_emoticon)
#       end
#     end

#     it "the emoticons stored in :english and :japanese are the correct English/Japanese equivalents" do
#       emoticons = {"O:)" => "☜(⌒▽⌒)☞", ":'(" => "(Ｔ▽Ｔ)", ";)" => "(^_-)"}
#       emoticons.each do |english_emoticon,japanese_emoticon|
#         match = result.any? do |key, value| 
#           result[key][:english] == english_emoticon && result[key][:japanese] == japanese_emoticon
#         end
#         expect(match).to eq(false), "#{english_emoticon} and #{japanese_emoticon} were not found in the same hash"
#       end
#     end

#   end

# end

# describe "#get_english_meaning" do

#   it "accepts two arguments, the YAML file path and the emoticon" do
#     expect { get_english_meaning("./lib/emoticons.yml", "(Ｔ▽Ｔ)") }.to_not raise_error
#   end

#   it "calls on #load_library and gives it the argument of the file path" do
#     emoticon_hash = load_library("./lib/emoticons.yml")

#     file_path = "./lib/emoticons.yml"
#     expect(self).to receive(:load_library).with(file_path).and_return(emoticon_hash)
#     answer = get_english_meaning("./lib/emoticons.yml", "=D")
#   end

#   it "returns the English meaning of the Japanese emoticon (＾ｖ＾)" do
#     expect(get_english_meaning("./lib/emoticons.yml", "(＾ｖ＾)")).to eq("happy")
#   end

#   it "returns the English meaning of the Japanese emoticon (￣ー￣)" do
#     expect(get_english_meaning("./lib/emoticons.yml", "(￣ー￣)")).to eq("grinning")
#   end

#   it "returns the English meaning of the Japanese emoticon (Ｔ▽Ｔ)" do
#     expect(get_english_meaning("./lib/emoticons.yml", "(Ｔ▽Ｔ)")).to eq("sad")
#   end

#   it "returns an apology message if the argument is not a known emoticon" do
#     sorry_message = "Sorry, that emoticon was not found"
#     expect(get_english_meaning("./lib/emoticons.yml", "$#$%{}*")).to eq(sorry_message)
#   end

# end

# describe "#get_japanese_emoticon" do

#   it "accepts two arguments, the YAML file path and the emoticon" do
#     expect { get_japanese_emoticon("./lib/emoticons.yml", ":)") }.to_not raise_error
#   end

#   it "calls on #load_library and gives it the argument of the file path" do
#     emoticon_hash = load_library("./lib/emoticons.yml")

#     file_path = "./lib/emoticons.yml"
#     expect(self).to receive(:load_library).with(file_path).and_return(emoticon_hash).at_least(:once)
#     answer = get_japanese_emoticon("./lib/emoticons.yml", "=D")
#   end

#   it "returns the Japanese equivalent of an English grinning" do
#     expect(get_japanese_emoticon("./lib/emoticons.yml", "=D")).to eq("(￣ー￣)")
#   end

#   it "returns the Japanese equivalent of an English happy" do
#     expect(get_japanese_emoticon("./lib/emoticons.yml", ":)")).to eq("(＾ｖ＾)")
#   end

#   it "returns the Japanese equivalent of an English sad" do
#     expect(get_japanese_emoticon("./lib/emoticons.yml", ":'(")).to eq("(Ｔ▽Ｔ)")
#   end

#   it "returns an apology message if the argument is not a known emoticon" do
#     sorry_message = "Sorry, that emoticon was not found"
#     expect(get_japanese_emoticon("./lib/emoticons.yml", "$#$%{}*")).to eq(sorry_message)
#   end

# end

describe "#load_library" do

  it "accepts one argument, the file path" do
    expect { load_library("./lib/emoticons.yml") }.to_not raise_error
  end

  context "return value" do

    let(:result) { load_library("./lib/emoticons.yml") }

    it "returns a hash" do
      expect(result.class).to eq(Hash)
    end

    it "has two keys, 'get_meaning' and 'get_emoticon'" do
      ["get_emoticon", "get_meaning"].each { |k| expect(result.keys).to include(k) }
      expect(result.keys.length).to eq(2) 
    end

    it "the keys 'get_meaning' and 'get_emoticon' point to inner hashes" do
      ["get_emoticon", "get_meaning"].each { |k| expect(result[k].class).to eq(Hash) }
    end

    it "the keys inside the 'get_meaning' hash are the Japanese emoticons" do
      emoticons = ["☜(⌒▽⌒)☞", "(ΘεΘ;)", "(￣ー￣)", "o_O", "(^_-)"]
      emoticons.each { |emoticon| expect(result['get_meaning'].keys).to include(emoticon) }
    end

    it "the emoticon keys inside the 'get_meaning' hash point to their meanings" do
      emoticons = {"☜(⌒▽⌒)☞" => "angel", "(ΘεΘ;)" => "bored", "o_O" => "surprised", "(^_-)" => "wink"}
      emoticons.each { |e,m| expect(result['get_meaning'][e]).to eq(m) }
    end

    it "the keys inside the 'get_emoticon' hash are the English emoticons" do
      emoticons = ["O:)", ":'(", ";)", ":$"]
      emoticons.each { |emoticon| expect(result['get_emoticon'].keys).to include(emoticon) }
    end

    it "the emoticon keys inside the 'get_emoticon' hash point to their Japanese equivalents" do
      emoticons = {"O:)" => "☜(⌒▽⌒)☞", ":'(" => "(Ｔ▽Ｔ)", ";)" => "(^_-)"}
      emoticons.each { |e,j| expect(result['get_emoticon'][e]).to eq(j) }
    end

  end

end

describe "#get_japanese_emoticon" do

  it "accepts two arguments, the YAML file path and the emoticon" do
    expect { get_japanese_emoticon("./lib/emoticons.yml", ":)") }.to_not raise_error
  end

  it "calls on #load_library and gives it the argument of the file path" do
    emoticon_hash = load_library("./lib/emoticons.yml")

    expect(self).to receive(:load_library).with("./lib/emoticons.yml").and_return(emoticon_hash)
    answer = get_japanese_emoticon("./lib/emoticons.yml", "=D")
  end

  it "returns the Japanese equivalent of an English grinning" do
    expect(get_japanese_emoticon("./lib/emoticons.yml", "=D")).to eq("(￣ー￣)")
  end

  it "returns the Japanese equivalent of an English happy" do
    expect(get_japanese_emoticon("./lib/emoticons.yml", ":)")).to eq("(＾ｖ＾)")
  end

  it "returns the Japanese equivalent of an English sad" do
    expect(get_japanese_emoticon("./lib/emoticons.yml", ":'(")).to eq("(Ｔ▽Ｔ)")
  end

  it "returns an apology message if the argument is not a known emoticon" do
    expect(get_japanese_emoticon("./lib/emoticons.yml", "$#$%{}*")).to eq("Sorry, that emoticon was not found")
  end
  
end

describe "#get_english_meaning" do

  it "accepts two arguments, the YAML file path and the emoticon" do
    expect { get_english_meaning("./lib/emoticons.yml", "(Ｔ▽Ｔ)") }.to_not raise_error
  end

  it "calls on #load_library and gives it the argument of the file path" do
    emoticon_hash = load_library("./lib/emoticons.yml")

    expect(self).to receive(:load_library).with("./lib/emoticons.yml").and_return(emoticon_hash)
    answer = get_english_meaning("./lib/emoticons.yml", "=D")
  end

  it "returns the Japanese equivalent of an English grinning" do
    expect(get_english_meaning("./lib/emoticons.yml", "(＾ｖ＾)")).to eq("happy")
  end

  it "returns the Japanese equivalent of an English happy" do
    expect(get_english_meaning("./lib/emoticons.yml", "(￣ー￣)")).to eq("grinning")
  end

  it "returns the Japanese equivalent of an English sad" do
    expect(get_english_meaning("./lib/emoticons.yml", "(Ｔ▽Ｔ)")).to eq("sad")
  end

  it "returns an apology message if the argument is not a known emoticon" do
    expect(get_english_meaning("./lib/emoticons.yml", "$#$%{}*")).to eq("Sorry, that emoticon was not found")
  end
  
end
