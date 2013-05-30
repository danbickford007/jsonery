class Iterator

  def iterate json
    if json.class == Array
      array json
    elsif json.class == Hash
      hash json
    else
      puts 'this doesnt look like json?'
    end
  end

  def array json
    puts "array"
    json.each do |key, value|
      puts "KEY: #{key}"
      puts "VALUE: #{value}"
      iterate value
    end
  end

  def hash json
    puts 'json'
    json.each do |key, value|
      puts "KEY: #{key}"
      puts "VALUE: #{value}"
      iterate value
    end
  end

end
