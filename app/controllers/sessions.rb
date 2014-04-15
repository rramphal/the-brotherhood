# =========== SESSIONS ===========

['/', '/sessions/new/?'].each do |path|
  get path do
    if current_user
      redirect "/missions/?"
    else
      erb :_login
    end
  end
end

post '/sessions/?' do
  username = params[:username]
  password = params[:password]

  user = User.find_by_username(username)

  redirect "/" if user.nil? # username incorrect

  if user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    session[:user_id] = user.id
    redirect "/missions/?"
  end

    redirect "/" # password incorrect
end

delete '/sessions/:id/?' do
  session[:user_id] = nil
  session.clear
  session.destroy
  redirect "/"
end
