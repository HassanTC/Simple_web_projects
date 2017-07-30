  require 'jumpstart_auth'
  require 'bitly'
  Bitly.use_api_version_3
  class MicroBlogger
  attr_reader :client
# to initialize your Tweeter account 
  def initialize
    puts "MicroBlogger is get Start in"
    @client = JumpstartAuth.twitter
  end

  def shorten(original_url)
    bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
    puts "Shortening this URL: #{original_url}"
    bitly.shorten(original_url).short_url
  end
# the function to post your tweets 
  def tweet(message)
    if message.length <= 140
      @client.update(message)
    else
      puts "Your Message Must be less than or equal 140 char" 
    end
  end
# let's gets statet in any make a chooce 
  def run
    puts "Welcome to the JSL Twitter Client!"
    printf "enter command: (t)weet , (q)uit ,(dm)DirectMessage "
    command = ""
    command = gets.chomp
    case command
    when 't' then printf "Entre your Tweet." 
      t = gets.chomp
      tweet(t)
      puts "Your Tweet Succefully Published"
    when 'q' then puts "Goodbye!"
    when 'dm' then printf"Enter Your Target:- "
      target = gets.chomp
      puts ""
      printf "Enter Your Message :- "
      message = gets.chomp
      dm(target,message)
    else
      puts "Sorry, I don't know how to #{command}"
    end
  end
  #what about Direct Message 
  def dm(target, message)
    puts "Trying to send #{target} this direct message:"
    puts message

    if is_there.include?(target)
      str = "d #{target} #{message}"
      tweet(str)
    else
      puts "You can only DM your followers!"
    end
  end
# check for valid follwer 
  def is_there
    screen_names = @client.followers.collect{|follower| follower.screen_name}
  end

  def spam_my_followers(message)
  followers = is_there
  followers.each { |f| dm(f, message) }
end
# my frineds is tweets 
def everyones_last_tweet
  friends = @client.friends
  friends.each do |friend|
    tstamp = friend.status.created_at
    puts "#{friend.screen_name} said the following on #{tstamp.strftime("%A, %b %d")}... #{friend.status.text}"
    puts " "
  end
end
  end
  blogger = MicroBlogger.new
  blogger.run
