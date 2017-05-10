class SubredditController < ApplicationController
  def index
    @service = RedditService.new(current_user.token)
  end
  def show
    service = RedditService.new(current_user.token)
    find_with(service)
  end

  private
    def find_with(service)
      service.subreddits.each do |sub|
        if sub[:data][:id] == params[:id]
          @subreddit = sub
        end
      end
    end
end
