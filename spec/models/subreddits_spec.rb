require 'rails_helper'

describe Subreddit do
  before(:each) do
    user = User.create(username: 'AcidicBread',
                       uid: "2juwkw",
                       link_karma: 1,
                       comment_karma: 0,
                       token: "9QDY2Zr8jruQQuHla5vgoCjoUF0")
    VCR.use_cassette("services") do
      user.token
    end
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    @service = RedditService.new(user.token)
  end

  describe "#user_subreddits" do
    it "returns list of user subreddits" do
      VCR.use_cassette("services/subreddits") do
        subreddits = @service.subreddits

        first_sub = subreddits.first
        expect(first_sub[:data][:display_name]).to eq("shittyaskscience")
        expect(subreddits.count).to eq(1)
      end
    end
  end
end
