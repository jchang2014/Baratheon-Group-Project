enable :sessions

get '/session_viewer' do
  session.inspect
end

get '/' do
  if session[:user_id]
    erb :logged_in
  else
    erb :login
  end
end

post '/' do
  user = User.find_by(username: params[:username])
  if user && (user.password == params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @error = "Username or password invalid."
    erb :login
  end
end


get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/profile/:username' do #visit a profile
  @user = User.find_by(username: params[:username])
  @usertweets = ["tweet1", "tweet2", "tweet3"]
  erb :profile_view
end
