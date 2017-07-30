#require "mastermind/version"

module Mastermind
  # Your code goes here...
end
lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + "/mastermind/**/*.rb"].each { |file| require file }
