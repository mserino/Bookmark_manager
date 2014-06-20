require 'sinatra'
require 'sinatra/flash'
require 'data_mapper'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

require_relative 'controllers/application'
require_relative 'controllers/links'
require_relative 'controllers/sessions'
require_relative 'controllers/tags'
require_relative 'controllers/users'

enable :sessions
set :session_secret, 'super secret'
set :views, Proc.new{ File.join(root, 'views') }