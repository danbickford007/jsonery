require 'sqlite3'
class Database

  attr_accessor :db

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
      t = table['name'].gsub('-','')
      columns = parse_columns(t,table)
      @db.execute %Q{
        CREATE TABLE IF NOT EXISTS #{t} (
        id integer primary key,
        #{columns})
      }
      insert_column_names(t, table)
      read_table(t, table)
    end
  end

  def parse_columns(name, table)
    columns = ''
    table[name].each do |t|
      columns = t['columns'].join(' varchar(100), ')
      columns += " varchar(100)"
    end
    columns
  end

  def parse_values(name, table)
    values = []
    table[name].each do |t|
      vals = "'"
      vals += t['values'].join("','")
      vals += "'"
      values << vals
    end
    values
  end

  def insert_column_names(name, table)
    values = parse_values(name, table)
    values.each do |val|
      @db.execute "INSERT INTO #{name} (#{table[name][0]['columns'].join(',')}) VALUES (#{val})"
    end
  end

  def read_table(name, table)
    stm = @db.prepare "SELECT * FROM #{name} LIMIT 5" 
    rs = stm.execute 
  
    rs.each do |row|
        puts row.join "\s"
    end
  end

  def pull_information query
    stm = @db.prepare query 
    rs = stm.execute 
    puts "----------------------------\n"
    puts "DATA RESULT:\n"  
    rs.each do |row|
        puts row.join "\s"
    end
    puts "----------------------------\n"

  end

end
