
env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

# After declaring your models you should finalize them
DataMapper.finalize

# Tell the datamapper to create the database tables
DataMapper.auto_upgrade!