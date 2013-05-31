require 'sqlite3'
class Database

  def initalize
    begin
        db = SQLite3::Database.new ":memory:"
        puts db.get_first_value 'SELECT SQLITE_VERSION()'
    rescue SQLite3::Exception => e 
        puts "Exception occured"
        puts e
    ensure
        db.close if db
    end
  end

end
