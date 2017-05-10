class Subreddit

  attr_reader :service

  attr_accessor :name,
                :url

  def initialize(name, url)
    @name = name
    @url  = url
  end

  def self.all(token)
    serv = RedditService.new(token)
    serv.subreddits.map do |subreddit|
      Subreddit.new(subreddit[:data][:display_name], subreddit[:data][:url])
    end
  end
end
