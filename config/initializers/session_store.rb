if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: "_portfolio_api", domain: ENV['HEROKU_APP_DOMAIN']
else
  Rails.application.config.session_store :cookie_store, key: "_portfolio_api"
end
