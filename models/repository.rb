require_relative 'database'
require_relative 'language'

class Repository
  attr_accessor :id, :name, :language, :description,
                :stars, :forks, :url, :last_updated

  def initialize id, name
    @id = id
    @name = name
    @stars = 0
    @forks = 0
    @language = Language.new 9, 'teste'
  end

  def save
    db = Database.new
    db.exec "INSERT INTO repositories (name,
          language_id, description,
          stars, forks, url, last_updated) VALUES
          ('#{name}',#{language.id},'#{description}',
          #{stars}, #{forks}, '#{url}', NOW())"
  end

  def self.find id
    search = Database.new.exec "SELECT * FROM repositories WHERE id = #{id}"
    search.map do |row|
      Repository.new row['id'], row['name']
    end
  end

  def self.list
    search = Database.new.exec "SELECT * FROM repositories"
    search.map do |row|
      Repository.new row['id'], row['name']
    end
  end

end