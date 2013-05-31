class Iterator

  attr_accessor :tables

  def initialize
    @tables = []
  end

  def iterate json
    if json.class == Array
      array json
    elsif json.class == Hash
      hash json
    end
  end

  def array json
    puts "array"
    json.each do |obj|
      iterate obj
    end
  end

  def hash json
    puts 'json'
    json.each do |key, value|
      #puts "KEY: #{key}"
      #puts "VALUE: #{value}"
      if value.class == Hash or value.class == Array
        @tables << key
      end
      iterate value
    end
  end

end
