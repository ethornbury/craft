source 'https://rubygems.org'

ruby '2.1.5'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby #getting execjs::runtime error so installed this to fix
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
#provides the in place editing on the 'work' pages
gem 'best_in_place', '~> 3.0.3'
#provides the sign in engine
gem 'devise'
#bootstrap
gem 'bootstrap-sass', '~> 3.3.4'
gem 'bootstrap-generators', '~> 3.3.1'
# to create a listing in pages rather than endless scrolling
gem 'will_paginate',           '3.0.7'
gem 'bootstrap-will_paginate', '0.0.10'
gem 'spring', '1.1.3',         group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'quiet_assets'  #quiets assests in logs during development
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'shoulda-matchers'
  gem 'shoulda'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  gem 'sqlite3'
end

group:production do
    gem 'pg', '0.17.1'
    gem 'rails_12factor','0.0.2'
    #gem 'puma',           '2.11.1'   #need this as we set in config>environments>prodution ssl=true
end