enable :sessions

get '/session_viewer' do
  session.inspect
end

get '/' do
  if session[:user_id]
    userid = session[:user_id]
    @username = User.find(userid).username
    @tweets = Tweet.all
    #sorting method goes here
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


