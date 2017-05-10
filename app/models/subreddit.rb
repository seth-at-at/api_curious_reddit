class Subreddit < ApplicationRecord
  belongs_to :user
  validates :dn, uniqueness: true

  def initialize(display_name, url, subscribers)
    @dn = display_name
    @url = url
    @subscribers = subscribers
  end


  def self.all(token)
    serv = RedditService.new(token)
    serv.subreddits.map do |subreddit|
      Subreddit.create(dn: subreddit[:data][:display_name],
                       url: subreddit[:data][:url],
                       subscribers: subreddit[:data][:subscribers])
    end
  end

end
