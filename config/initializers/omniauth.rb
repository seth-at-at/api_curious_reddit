Rails.application.config.middleware.use OmniAuth::Builder do
  provider :reddit, ENV['reddit_client_key'], ENV['reddit_client_secret'], scope: 'identity, mysubreddits'
end
