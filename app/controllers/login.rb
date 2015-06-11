enable :sessions

get '/' do
  erb :login
end

post '/' do
  user = User.find_by(username: params[:username])
  if user && (user.password == params[:password])
    session[:username] = user.username
    session[:user_id] = user.id
    redirect '/home' #route tbd
  else
    @error = "Username or password invalid."
    erb :login
  end
end
