source "https://rubygems.org"

gem "rails", "~> 7.2.2"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "dotenv"
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails", "~> 7"
  gem "shoulda-matchers", "~> 6"
end