get '/home' do
  @name = User.find_by(id: sessions[:user]).name
  @tweets = Tweet.all
  erb :home
end

post '/home' do

end

put '/home' do

end

