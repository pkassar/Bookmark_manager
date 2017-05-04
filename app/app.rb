ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'

require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new_link'
  end

  # post '/links/saved' do
  #   link = Link.create(title: params[:title], url: params[:url])
  #   tag = Tag.create(name: params[:tag])
  #   link.tags << tag
  #   link.save
  #   redirect '/links'
  # end

  post '/links/saved' do
     link = Link.create(title: params[:title], url: params[:url])
     params[:tag].split.each do |tag|
       link.tags << Tag.first_or_create(name: tag)
     end
     link.save
     redirect to('/links')
   end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end
end
