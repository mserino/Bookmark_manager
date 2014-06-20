
env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{env}")

# After declaring your models you should finalize them
DataMapper.finalize