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
        hash = {'name'=>key}
        hash[key] = []#{'columns'=>[], 'values'=>[]}
        if value.class == Array
          value.each do |val|
            hash[key] << {'columns'=>val.keys, 'values'=>val.values}
          end
        else
          hash[key]['columns'] = value.keys
          hash[key]['values'] = value.values
        end
        @tables << hash
      end
      iterate value
    end
  end

end
