class RedditService
  def initialize(token)
    @token = token
  end

  def subreddits
    parse(HTTParty.get("https://oauth.reddit.com/subreddits/mine/subscriber",
          :headers => { :Authorization => "bearer #{@token}",
                      "User-Agent": "api_curious by AcidicBread"}))[:data][:children]
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
