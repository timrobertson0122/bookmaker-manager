
#  checking what environment we're in, and defaulting to development:
env = ENV['RACK_ENV'] || 'development'
# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require_relative 'models/link.rb'
require_relative 'models/tag.rb'
require_relative 'models/user.rb'

DataMapper.finalize # After declaring your models, you should finalise them
# However, the database tables don't exist yet. Let's tell datamapper to create them

