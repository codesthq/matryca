class MyApp < Sinatra::Base
  get '/' do
    @saved_pictures = SavedFramesFetcher.new.call
    erb :'index.html'
  end

  get '/new' do
    erb :'new.html'
  end

  get '/new/:frame_id' do
    @frame = FrameFetcher.new(params[:frame_id]).call
    erb :'new.html'
  end

  post '/new' do
    MatrixSaveService.new(params[:data], params[:name]).call
    redirect '/'
  end

  post '/show' do
    MatrixUploadService.new(params[:data]).call
    nil
  end
end