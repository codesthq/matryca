require 'sinatra/json'

class MyApp < Sinatra::Base
  use Rack::PostBodyContentTypeParser

  get '/' do
    @saved_pictures = SavedFramesFetcher.new.call
    erb :'index.html'
  end

  get '/new' do
    erb :'form.html'
  end

  get '/edit/:frame_id' do
    @frame = FrameFetcher.new(params[:frame_id]).call
    erb :'form.html'
  end

  post '/new' do
    MatrixSaveService.new(params[:data], params[:name]).call
    nil
  end

  post '/show' do
    MatrixUploadService.new(params[:data]).call
    nil
  end

  get '/delete' do
    FrameDeletionService.new(params[:frame_id]).call
    redirect '/'
  end

  post '/graphql' do
    json MatrixAppSchema.execute(
      params[:query],
      variables: params[:variables],
    )
  end
end
