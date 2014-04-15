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

  user = User.where("username = ?", username)

  if user.empty?
    redirect "/" # user not found
  else
    user = user.first
  end

  if user.password === password
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
