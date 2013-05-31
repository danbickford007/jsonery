require 'sqlite3'
class Database

  def initialize
    begin
        @db = SQLite3::Database.new "json_database"
    rescue SQLite3::Exception => e 
        puts "Exception occured"
        puts e
    end
  end

  def create_tables tables
    tables.each do |table|
      table = table.gsub('-','')
      @db.execute %Q{
        CREATE TABLE IF NOT EXISTS #{table} (
        id integer primary key,
        term varchar(100),
        meaning varchar(100))
      }
      read_table table 
    end
  end

  def read_table table
    stm = @db.prepare "SELECT * FROM #{table} LIMIT 5" 
    rs = stm.execute 
  
    rs.each do |row|
        puts row.join "\s"
    end
  end

  def pull_information query
    stm = @db.prepare query 
    rs = stm.execute 
  
    rs.each do |row|
        puts row.join "\s"
    end

  end

end
