# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a 
# newer version of cucumber-rails. Consider adding your own code to a new file 
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

require 'cucumber/rails'

Capybara.default_selector = :css
Capybara.default_driver = :selenium
ActionController::Base.allow_rescue = false

ActionController::Base.allow_rescue = true
Cucumber::Rails::World.use_transactional_fixtures = false
# Remove/comment out the lines below if your app doesn't have a database.
# For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
Before do
  Mongoid.master.collections.each(&:remove)
end