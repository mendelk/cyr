require 'singleton'
require_relative 'users_parser'


class App

  include Singleton

  attr_reader :files

  def parse_options(args)
    @files = []
    while args.any?
      file = {}
      file[:path], file[:delimiter] = args.shift(2)
      @files.push(file)
    end
  end

  def parse_files
    @files.each do |file|
      begin
        File.open(file[:path], "r").each_line do |line|
          UsersParser.parse line, file[:delimiter]
        end
      rescue Exception => e
        puts "Parse Failed! #{e.message}"
      end
    end
  end

end