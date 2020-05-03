Rails.application.routes.draw do
  #
  # GET /users/auth/google_oauth2 (omniauth自動生成パス)
  # GET /users/auth/google_oauth2/callback
  #
  namespace :users do
    get '/auth/google_oauth2/callback', to: 'omniauth_callbacks#google_oauth2'
  end

  namespace :api do
    #
    # DELETE   /api/user/session/destroy
    # GET      /api/user/profile
    #
    resource :user, module: :users do
      resource :session, only: [:destroy]
      resource :profile, only: [:show]
    end
  end

end
