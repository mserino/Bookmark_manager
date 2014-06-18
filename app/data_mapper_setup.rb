
env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

enable :sessions
set :session_secret, 'super secret'
set :views, Proc.new{ File.join(root, 'views') }

# After declaring your models you should finalize them
DataMapper.finalize

# Tell the datamapper to create the database tables
DataMapper.auto_upgrade!