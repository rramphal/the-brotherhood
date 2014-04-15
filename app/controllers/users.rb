# =========== USERS ===========

get '/users/new/?' do
  if current_user
    redirect "/missions/?"
  else
    erb :_new_user, layout: false
  end
end

post '/users/?' do
  newuser = User.create(params)
  session[:user_id] = newuser.id
  redirect "/missions/?"
end
