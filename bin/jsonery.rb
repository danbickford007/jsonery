#!/usr/bin/env ruby
$LOAD_PATH << File.expand_path('../../lib', __FILE__)


case ARGV.first
when 'load'
  puts "loading..."
else
  puts "USAGE:\n"
end
