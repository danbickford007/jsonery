require "jsonery/version"
require_relative 'Iterator'
JSON = {'users'=>[{'username'=>'bigs', 'password'=>'1234'}, {'username'=>'jimmy', 'password'=>'4567'}]}

module Jsonery
  puts "Please enter query:\n"
  query = gets
  while query != 'exit' or query != 'quit' do
    puts JSON.inspect
    JSON.each do |key, value|
      Iterator.iterate value 
    end
    query = gets
  end


end
