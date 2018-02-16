require 'git-trend'

class Import

  def run
    repos = GitTrend.get 'ruby'
    l = Language.new 9, 'teste'
    repos.each do |row|
      r = Repository.new
      r.language = l
      r.name = row.name
      r.description = row.description
      r.stars = row.star_count
      r.forks = row.fork_count
      r.save
    end
  end

end