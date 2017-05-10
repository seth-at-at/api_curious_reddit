class SessionsController < ApplicationController
  def create
    auth_info = request.env['omniauth.auth']

    if user = User.from_omniauth(auth_info)
      session[:user_id] = user.id
      current_user
    end

    redirect_to dashboard_index_path
  end
end
