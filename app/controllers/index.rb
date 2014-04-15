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
  else
    redirect "/" # password incorrect
  end
end

delete '/sessions/:id/?' do
  session[:user_id] = nil
  session.clear
  redirect "/"
end

# =========== USERS ===========

get '/users/new/?' do
  if current_user
    redirect "/missions/?"
  else
    erb :_new_user
  end
end

post '/users/?' do
  newuser = User.create(params)
  session[:user_id] = newuser.id
  redirect "/missions/?"
end

# =========== MISSIONS ===========

get '/missions/?' do # lists all missions
  redirect "/" unless current_user

  user = current_user
  missions = current_user.missions.order(updated_at: :desc)
  erb :_missions, locals: { missions: missions }
end

get '/missions/new/?' do # returns a form to create a new missions
  redirect "/" unless current_user

  redirect "/missions"
end

post '/missions/?' do # creates a new mission
  redirect "/" unless current_user

  params[:user_id] = current_user.id

  mission = Mission.create(params)

  erb :_mission, locals: { mission: mission }, layout: false
end

get '/missions/:id/?' do # view a specific mission
  redirect "/" # unless current_user

  redirect "/missions"
end

get '/missions/:id/update/?' do # return a form to edit mission
  redirect "/" unless current_user

  mission = Mission.find(params[:id])

  if mission.user_id != current_user.id
    redirect '/missions'
  else
    erb :_update_mission, locals: { mission: mission }
  end
end

put '/missions/:id/?' do # update a mission
  redirect "/" unless current_user

  mission = Mission.find(params[:id])

  if mission.user_id != current_user.id
    redirect '/missions'
  else
    mission.target = params[:target]
    mission.location = params[:location]
    mission.mo = params[:mo]
    mission.save
    redirect "/missions/#{params[:id]}"
  end
end

delete '/missions/:id/delete/?' do # delete a mission
  redirect "/" unless current_user

  mission = Mission.find(params[:id])

  if mission.user_id != current_user.id
    redirect '/missions'
  else
    mission.destroy
  end
end

put '/missions/:id/complete/?' do # complete a mission
  redirect "/" unless current_user

  mission = Mission.find(params[:id])

  if mission.user_id != current_user.id
    redirect '/missions'
  else
    mission.completed = true
    mission.save
    erb :_mission, locals: { mission: mission }, layout: false
  end
end