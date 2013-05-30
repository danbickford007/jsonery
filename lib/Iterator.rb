class Iterator

  def iterate json
    json.each do |key, value|
      puts "KEY: #{key}"
      puts "VALUE: #{value}"
      iterate value
    end
  end

  def array

  end

  def hash

  end

end
