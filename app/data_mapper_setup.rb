
env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{env}")


require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'

# After declaring your models you should finalize them
DataMapper.finalize

DataMapper.auto_upgrade!