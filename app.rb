require 'sinatra'
require 'sinatra/reloader'
require './models/repository.rb'

set :bind, '0.0.0.0'
set :port, '3000'

get '/' do
  @repositories = Repository.list
  erb :index
end

get '/update' do
end
