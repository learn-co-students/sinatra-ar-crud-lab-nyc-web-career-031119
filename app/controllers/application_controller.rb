
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end
  # new
  get '/articles/new' do
    @new = Article.new
    erb :new
  end
  # create
  post '/articles' do
    @create = Article.create(params)
    redirect to "/articles/#{@create.id}"
  end
  # edit
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  # show
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  # update
  patch '/articles/:id' do
    @patch = Article.find(params[:id])
    @patch.update(params[:article])
    redirect to "/articles/#{@patch.id}"
  end
  # delete
  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to '/articles'
  end


end
