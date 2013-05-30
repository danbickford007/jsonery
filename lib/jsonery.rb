require "jsonery/version"
require_relative 'Iterator'
JSON = {'users'=>[{'username'=>'bigs', 'password'=>'1234'}, {'username'=>'jimmy', 'password'=>'4567'}]}

module Jsonery
  puts "Please enter query:\n"
  query = gets
  while query.to_s != 'exit' and query.to_s != 'quit' do
    puts JSON.inspect
    Iterator.new.iterate value 
    query = gets
  end


end
