require "checky/version"
require 'httparty'

module Checky
end

lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + "/checky/**/*.rb"].each { |file| require file }
