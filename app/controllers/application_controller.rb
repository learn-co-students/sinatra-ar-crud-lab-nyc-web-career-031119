
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  	# binding.pry
  	# erb(:index)
  end

  get '/articles/new' do
  	erb(:new)
  	
  end

  get '/articles' do
  	# binding.pry
  	@article = Article.all
  	erb(:index)
  end

  post '/articles' do
  	Article.create(params)
  	# @article = Article.last.id
  	redirect "/articles/#{Article.last.id}"
  end

  get '/articles/:id' do
  	# binding.pry
  	@article = Article.find(params["id"])
  	erb(:show)
  end

  get '/articles/:id/edit' do
  	# binding.pry
  	erb(:edit)
  end

  patch '/articles/:id' do 
  	# binding.pry
  	@article = Article.find(params["id"])
  	@article.update(id: params["id"], title: params["title"], content: params["content"])
  	redirect "/articles/#{@article.id}"
  end


end
  

