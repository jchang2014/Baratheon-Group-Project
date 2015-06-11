enable :sessions

get '/signup' do
  if session[:user_id]
    redirect to '/'
  else
    erb :signup
  end
end

post '/signup' do
  if params[:password] == params[:verify_password]
      new_user = User.new(
        username: params[:username],
        email: params[:email],
        password: params[:password])
      if new_user.save
        session[:user_id] = new_user.id
        redirect to '/'
      else
        @error = new_user.errors
        erb :signup
      end
  else
    @error = "Your passwords don't match."
    erb :signup
  end
end
