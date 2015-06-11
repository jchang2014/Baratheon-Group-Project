enable :sessions

get '/signup' do
  if session[:username]
    redirect to '/'
  else
    erb :signup
  end
end

post '/signup' do
  if params[:password] == params[:verify_password]
    new_user = User.create!(username: params[:username], email: params[:email], password: params[:password])
      session[:username] = new_user.username
      session[:user_id] = new_user.id
      redirect to '/'
  else
    @error = "Your passwords don't match."
    erb :signup
  end
end
