require 'json'

class Query

  def initialize
    puts "Please enter a query:\n"
    @query = gets
    get_json
    Database.new
  end 

  def get_json
    file = File.open("example1.json", "r")
    data = file.read
    file.close
    @json = JSON.parse(data)
    server
  end

  def server
    while @query.to_s != 'exit' and @query.to_s != 'quit' do
      Iterator.new.iterate @json
      @query = gets
    end
    return
  end

end
