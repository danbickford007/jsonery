require 'json'

class Query

  def initialize
    puts "Please enter a query:\n"
    get_json
  end 

  def get_json
    file = File.open("example1.json", "r")
    data = file.read
    file.close
    @json = JSON.parse(data)
  end

  def server
    @db = Database.new
    @query = STDIN.gets
    tables = []
    while @query.to_s != 'exit' and @query.to_s != 'quit' do
      iterator = Iterator.new
      iterator.iterate @json
      tables += iterator.tables
      @db.create_tables tables
      @db.pull_information @query
      @query = STDIN.gets
    end
    return
  end

end
