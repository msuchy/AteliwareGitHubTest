require 'sinatra'
require 'sinatra/reloader'
require './models/repository.rb'
require './models/import.rb'

set :bind, '0.0.0.0'
set :port, '3000'

get '/' do
  @repositories = Repository.list
  erb :index
end

get '/update' do
  Import.new.run
  @repositories = Repository.list
  erb :index
end

get '/details/:id' do
  @repository = Repository.find params['id']
  erb :detail
end