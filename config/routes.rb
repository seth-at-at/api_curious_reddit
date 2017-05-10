Rails.application.routes.draw do
  root 'home#index'

  get '/auth/reddit', as: 'reddit_login'

  get '/auth/reddit/callback',   to: 'sessions#create'
  get '/subreddits', to: 'subreddit#index', as: "my_subreddit"
  get '/:id/subreddit', to: 'subreddit#show',  as: "subreddit_show"

  resources :dashboard, only: [:index]
end
