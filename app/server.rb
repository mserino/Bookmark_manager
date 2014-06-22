require 'sinatra'
require 'sinatra/flash'
require 'data_mapper'
require 'sinatra/partial'

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
set :partial_template_engine, :erb