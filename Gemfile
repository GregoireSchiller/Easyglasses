source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '4.2.6'
gem 'puma'
gem 'pg'
gem 'figaro'
gem 'jbuilder', '~> 2.0'
gem 'devise'
gem 'redis'
gem "pundit"

gem 'sass-rails'
gem 'jquery-rails'
gem 'uglifier'
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem "font-awesome-rails"
gem 'simple_form'
gem 'autoprefixer-rails'
gem 'jquery-ui-rails'
gem 'wicked_pdf'
#we need the new binary here, so that we can be OS independent
gem 'wkhtmltopdf-binary', github: 'pallymore/wkhtmltopdf-binary-edge', tag: 'v0.12.2'

gem 'pusher'
gem 'twilio-ruby', '~> 4.11.1'

gem "letter_opener", group: :development

group :development, :test do
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'quiet_assets'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'spring'


end

group :production do
  gem 'rails_12factor'
end
