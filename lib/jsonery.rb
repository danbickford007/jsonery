require "jsonery/version"
require_relative 'Iterator'
require_relative 'test_data/example1.json'


JSON = {'users'=>[{'username'=>'bigs', 'password'=>'1234'}, {'username'=>'jimmy', 'password'=>'4567'}]}

module Jsonery
  puts "Please enter query:\n"
  query = gets
  file = File.open("test_data/example1.json", "r")
  data = file.read
  file.close
  JSON = JSON.parse(data)
  while query.to_s != 'exit' and query.to_s != 'quit' do
    puts JSON.inspect
    Iterator.new.iterate JSON
    query = gets
  end


end
