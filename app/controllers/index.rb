get '/' do
  erb :index
end

get '/missions/?' do
  @missions = Mission.order(created_at: :desc)
  erb :missions
end

post '/missions/?' do
  Mission.create(params)
  redirect '/'
end