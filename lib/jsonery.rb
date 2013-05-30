require "jsonery/version"
require 'json'
require_relative 'Iterator'

module Jsonery
  puts "Please enter query:\n"
  query = gets
  file = File.open("example1.json", "r")
  data = file.read
  file.close
  json = JSON.parse(data)
  while query.to_s != 'exit' and query.to_s != 'quit' do
    Iterator.new.iterate json
    query = gets
  end


end
