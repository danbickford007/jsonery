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
    json.each do |obj|
      iterate obj
    end
  end

  def hash json
    json.each do |key, value|
      if value.class == Hash or value.class == Array
        hash = {'name'=>key, 'columns'=>[]}
        if value.class == Array
          hash['columns'] = value.first.keys
        else
          hash['columns'] = value.keys
        end
        @tables << hash
      end
      iterate value
    end
  end

end
