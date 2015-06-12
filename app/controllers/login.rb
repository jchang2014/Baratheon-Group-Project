enable :sessions

get '/session_viewer' do
  session.inspect
end

get '/' do
  if session[:user_id]
    user = User.find(session[:user_id])
    @username = user.username
    @tweets = get_tweets_from_those_im_following(user)
   sort_tweets(@tweets)
    erb :home
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


