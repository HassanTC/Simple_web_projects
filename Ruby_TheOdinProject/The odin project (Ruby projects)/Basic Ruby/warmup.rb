=begin
What You'll Be Building
In this project, we'll build a program that takes a user's input,
then builds a hash from that input.
Each key in the hash will be a word from the user;
each value will be the number of times that word occurs.
For example, if our program gets the string
"the rain in Spain falls mainly on the plain", it will return
the 2
falls 1
on 1
mainly 1
in 1
rain 1
plain 1
Spain 1
A visual representation of data like this is called a histogram.
=end

puts "Welcome to histogram game".center(75)
puts "=========================".center(75)
puts "Please enter a string and the programme,".center(75)
puts "will calucalate how many time each word repeated.".center(75)

#### user input
print "Please Enter a text: "
text = gets.chomp

## the programm process
stat = Hash.new(0) #initialize new hash each value assigne to zero
text = text.split(" ") # split the text per space
text.each { |key| stat[key]+=1 } # count how many each word repeated

## output to user
stat.each {|key,value| puts "#{key} #{value}"}
