source "http://www.rubygems.org"

rails_version = ENV["RAILS_VERSION"] || "default"

rails = case rails_version
when "master"
  {github: "rails/rails"}
when "default"
  ">= 6.0"
else
  "~> #{rails_version}"
end

gemspec

group :development, :test do
  gem 'appraisal'
  gem 'standard'

  gem 'pg'
  gem 'mysql2'
  gem 'sqlite3'

  gem 'pry-byebug'
  gem 'mocha', '~> 1.14.0', :require => false
  gem 'rspec-rails', '~> 5.1.2'
  gem 'factory_bot_rails', '~> 6.2.0'
end


