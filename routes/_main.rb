class Vasanews < Sinatra::Base
  get "/" do
    haml :index
  end

  get "/prova" do
    haml :prova
  end
end