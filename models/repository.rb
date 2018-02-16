require_relative 'database'
require_relative 'language'

class Repository
  attr_accessor :id, :name, :language, :description,
                :stars, :forks, :last_updated

  def save
    db = Database.new
    if !exists? @name
      db.exec "INSERT INTO repositories (name,
            language_id, description,
            stars, forks, last_updated) VALUES
            ('#{name}',#{language.id},'#{description}',
            #{stars}, #{forks}, NOW())"
    end
  end

  def exists? name
    search = Database.new.exec "SELECT id
      FROM repositories r WHERE r.name = '#{name}'"

    search.any?
  end

  def self.find id
    search = Database.new.exec "SELECT
      r.id, r.name, r.language_id, l.name as language_name,
      r.description, r.stars, r.forks, r.url
      FROM repositories r
      INNER JOIN languages l on l.id = r. language_id WHERE r.id = #{id}"
    search.first do |row|
      build row
    end
  end

  def self.list
    search = Database.new.exec "SELECT
    r.id, r.name, r.language_id, l.name as language_name,
    r.description, r.stars, r.forks, r.url
    FROM repositories r
    LEFT JOIN languages l on l.id = r. language_id"
    search.map do |row|
      build row
    end
  end

  def self.build input
    l = Language.new input['language_id'], input['language_name']
    r = Repository.new
    r.id = input['id']
    r.name = input['name']
    r.language = Language.new input['language_id'], input['language_name']
    r.description = input['description']
    r.stars = input['stars']
    r.forks = input['forks']
    r
  end

end