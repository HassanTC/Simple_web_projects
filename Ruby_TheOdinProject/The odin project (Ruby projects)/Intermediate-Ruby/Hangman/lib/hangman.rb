require 'csv'
def get_data
  lines = File.readlines "5desk.txt"
  File.open("data.txt",'w') do |file|
    lines.each { |line| file.puts line if line.to_s.length.between?(5,12) }
  end
end

def get_secret_word
  lines = File.readlines "data.txt"
  lines[rand(0...lines.length)].strip
end
def save_game(secret_word,wrong_gusess,user_gusess)
  lines = File.readlines "saved_games.csv"
  File.open("saved_games.csv",'a') do |file|
    file.puts [lines.length,secret_word,wrong_gusess,user_gusess]
  end
end
def update_game(secret_word,wrong_gusess,user_gusess)
  table = CSV.table(saved_games.csv)
  i = 1
  table.delete_if do |row|
    i == table.length
    i+=1
  end
  File.open(saved_games.csv, 'w') do |f|
    f.write(table.to_csv)
  end
end
def enc_secret word
  secret_word = "_" * (word.length - 1)
end
def add(chr, secret_word, user_gusess)
  for i in 0...secret_word.length
    user_gusess[i] = chr if secret_word[i] == chr
  end
  user_gusess
end
def save?
  puts "Please enter 'yes' if u wanna save the game."
  puts "Or press any other word for cancel"
  save = gets.chomp
  save.downcase == 'yes'
end
def print_to_choose
  games = CSV.open 'saved_games.csv' , headers: true, header_converters: :symbol
  games.each do
    puts "#{row[0]} #{row[:user_gusess]}"
  end
end
get_data unless File.exists?("data.txt")
secret_word = get_secret_word.downcase
user_gusess = enc_secret secret_word
wrong_gusess = []
save = save?
puts secret_word
save_game(secret_word,wrong_gusess,user_gusess)
loop do
  if wrong_gusess.length >= 6 || user_gusess == secret_word
    puts wrong_gusess.length >= 6 ? "You're Dead!" : "Congrats You Won!"
    break
  end
  csv_out = CSV::Writer.generate(File.open('saved_games.csv', 'ab'))
  puts user_gusess
  puts "#{secret_word},#{user_gusess}"
  chr = gets.chomp.downcase
  user_gusess = add(chr,secret_word ,user_gusess)
  wrong_gusess.push chr unless user_gusess.include? chr
  puts wrong_gusess.join(" ")
  wrong_gusess.uniq!
  update_game(secret_word,wrong_gusess,user_gusess)
end
