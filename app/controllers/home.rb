enable :sessions

get '/home' do
  if session[:username]
    @username = session[:username]
  else
    redirect to '/signup'
  end
  @tweets = Tweet.all
  erb :home
end

post '/home' do

end

put '/home' do

end

