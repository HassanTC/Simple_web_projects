require "awesome_print"
require 'rest-client'
require "colorize"
AwesomePrint.irb!
AwesomePrint.pry!
puts '======================================'.center(100).colorize(background: :light_blue , color: :black)
puts 'Welcome To Google search analyzer'.center(100).colorize(color: :red , background: :black)
puts '======================================'.center(100).colorize(background: :light_blue , color: :yellow)
puts '  E                                   S       '.center(100).yellow
puts '    N                               E         '.center(100).yellow
puts '      T   Enter What              A           '.center(100).yellow
puts '        E      you wanna        R             '.center(100).yellow
puts '          R         find      H               '.center(100).yellow
puts '                         ?  C                 '.center(100).yellow
print '                                        '
input = gets.chomp#.center(100)
input = input.gsub!(' ' , '+')
response = RestClient.get 'https://www.google.com.eg/search', {:params => {:q => input}}
ap response, :limit => true, :html => true ,:raw => true,:sort_keys  => true
ap response.code
ap response.headers
ap response.cookies