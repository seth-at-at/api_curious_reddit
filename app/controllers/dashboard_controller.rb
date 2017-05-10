class DashboardController < ApplicationController
  before_action :authorize!
  def index
    if current_user
      @services = RedditService.new(current_user.token)
    end
  end
end
