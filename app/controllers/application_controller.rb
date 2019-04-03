
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

  end

  get '/' do
    erb :home
  end

  get '/articles' do
    @everything = Article.all

    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    var = Article.create(params)
    redirect "/articles/#{var.id}"
  end

  get '/articles/:id' do
    @instance = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @instance = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    var = Article.find(params[:id])
    var.update(title: params[:title], content: params[:content])
    redirect "/articles/#{var.id}"
  end

  delete '/articles/:id/delete' do
    @instance = Article.find(params[:id])
    @instance.delete
    redirect to "/articles"
  end

end
