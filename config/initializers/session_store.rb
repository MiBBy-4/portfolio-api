# frozen_string_literal: true

if Rails.env.production?
  Rails.application.config.session_store :cookie_store, key: '_portfolio_api',
                                                        domain: ENV.fetch('HEROKU_APP_DOMAIN', nil)
else
  Rails.application.config.session_store :cookie_store, key: '_portfolio_api'
end
