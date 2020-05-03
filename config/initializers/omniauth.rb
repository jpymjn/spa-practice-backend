Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    ENV['SPA_PRACTICE_APP_GOOGLE_OAUTH_ID'],
    ENV['SPA_PRACTICE_APP_GOOGLE_OAUTH_SECRET'],
    path_prefix: '/users/auth'
end
