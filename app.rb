#!/usr/bin/env ruby

require 'optparse'
require_relative 'lib/app'
require_relative 'lib/user'

options = {}

optparse = OptionParser.new do|opts|

  opts.banner = "Usage: ruby PATH/TO/app.rb PATH/TO/file_1 delimiter_1 PATH/TO/file_n delimiter_n"

  opts.on( '-h', '--help', "You're here." ) do
    puts opts
    exit
  end

end

optparse.parse!

app = App.instance

puts "parsing options..."
app.parse_options(ARGV)
puts "#{app.files.count} file(s) found."

puts "parsing files..."
app.parse_files if app.files.any?
puts "Done parsing \n\n"

puts "Output 1:"
User.sort_by(:gender, :last_name).each { |user| puts user }
puts ""

puts "Output 2:"
User.sort_by(:date_of_birth).each { |user| puts user }
puts ""

puts "Output 3:"
User.sort_by(:last_name ).reverse.each { |user| puts user }
puts ""