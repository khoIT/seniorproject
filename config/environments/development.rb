Rideshare::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  ENV['FACEBOOK_APP_ID'] = "559857074118686";
  ENV['FACEBOOK_SECRET'] = "a892c1eac456baa8af35bc9b79f0476c";
  ENV['GOOGLE_APP_ID'] = "934705303341-m29bpe28qipvre063g9m8t76r4qs8mfs.apps.googleusercontent.com";
  ENV['GOOGLE_SECRET'] = "MIltu11G3zqa4kcKycV5OZFq";
  ENV['VENMO_CLIENT_ID'] = "1946";
  ENV['VENMO_CLIENT_SECRET'] = "4BDh2qzFL6TjBRXYcM7YuT7FEnne734L";
  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: ENV["GMAIL_DOMAIN"],
  authentication: "plain",
  enable_starttls_auto: true,
  user_name: 'khoitran_2014@depauw.edu',
  password: 'd3t3rmination'
  }
end
