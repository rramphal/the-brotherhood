# =========== USERS ===========

get '/users/new/?' do
  if current_user
    redirect "/missions/?"
  else
    erb :_new_user, layout: false
  end
end

post '/users/?' do
  password_salt = BCrypt::Engine.generate_salt
  password_hash = BCrypt::Engine.hash_secret(params[:password], password_salt)

  newuser = User.new(
    username: params[:username],
    password_hash: password_hash,
    password_salt: password_salt
  )

  if newuser.save
    session[:user_id] = newuser.id
    redirect "/missions/?"
  else
    redirect "/"
  end
end
