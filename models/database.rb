require 'pg'

class Database

  def exec command
    connect
    @conn.exec command

    rescue PG::Error => e
      puts e.message
    ensure
      @conn.close if @conn
  end

  private
  def connect
    @conn = PG.connect :host => 'database_srv', :port => 5432,
    :dbname => 'myDb', :user => 'myUser',
    :password => 'myPassword'
  end

end