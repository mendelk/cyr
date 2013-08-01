#!/usr/bin/env ruby

require 'optparse'
require_relative 'lib/users_parser'
require_relative 'lib/user'

options = {}

optparse = OptionParser.new do|opts|

  opts.banner = "Usage: app.rb [options] file"

  opts.on('-d', '--delimiter DELIMITER', 'Set which delimiter to use') do |delimiter|
    options[:delimiter] = delimiter
  end

  opts.on( '-h', '--help', "You're here." ) do
    puts opts
    exit
  end

end

optparse.parse!
file = ARGV.first

if file.nil?
  puts "Nothing to scrape! Please pass in a file. See -h for help."
  exit
end

msg = options[:delimiter] ? "" : "No delimiter passed. "
options[:delimiter] ||= ','
puts msg + "Delimiter has been set to '#{options[:delimiter]}'"

puts "Beginning parse..."

UsersParser.parse_file(file, options[:delimiter])

puts "Parse complete.\n\n"

puts "Output 1:"
User.sort_by(:gender, :last_name).each { |user| puts user }
puts ""

puts "Output 2:"
User.sort_by(:date_of_birth).each { |user| puts user }
puts ""

puts "Output 3:"
User.sort_by(:last_name ).reverse.each { |user| puts user }
puts ""