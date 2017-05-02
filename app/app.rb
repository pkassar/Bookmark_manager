require 'sinatra/base'
require_relative 'models/link.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    'This is working'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end
end