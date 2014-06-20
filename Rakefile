require 'data_mapper'
require './app/data_mapper_setup'

task :auto_upgrade do
	# auto_upgrade makes non-destructive changes.
	# if your tables don't exist, they will be created
	# but if they do and you changed your schema
	# they will not be upgraded because that'd lead to data loss
	DataMapper.auto_upgrade!
	puts "Auto-upgrade complete (no data loss)"
end

task :auto_migrate do
	# to force the creation of all tables as they are described in your models, even if this may lead to data loss, use auto_migrate:
	DataMapper.auto_migrate!
	puts "Auto-migrate complete (data could have been lost)"
end