# =========== MISSIONS ===========

get '/missions/?' do # lists all missions
  redirect "/" unless current_user

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

  redirect '/missions' if mission.user_id != current_user.id

  erb :_update_mission, locals: { mission: mission }, layout: false
end

put '/missions/:id/?' do # update a mission
  redirect "/" unless current_user

  mission = Mission.find(params[:id])
  
  redirect '/missions' if mission.user_id != current_user.id
  
  mission.target = params[:target]
  mission.location = params[:location]
  mission.mo = params[:mo]
  mission.save
  erb :_mission, locals: { mission: mission }, layout: false
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

  redirect '/missions' if mission.user_id != current_user.id

  mission.completed = true
  mission.save
  erb :_mission, locals: { mission: mission }, layout: false
end
