require 'sinatra'
require 'sinatra/reloader'

set :bind, '0.0.0.0'
set :port, '3000'

get '/' do
  erb :index
end