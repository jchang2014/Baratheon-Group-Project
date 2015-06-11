enable :sessions

get '/session_viewer' do
  session.inspect
end

get '/' do
  if session[:username]
    @username = session[:username]
    erb :logged_in
  else
    erb :login
  end
end

post '/' do
  user = User.find_by(username: params[:username])
  if user && (user.password == params[:password])
    session[:username] = user.username
    session[:user_id] = user.id
    redirect '/'
  else
    @error = "Username or password invalid."
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
