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

def get_tweets_from_those_im_following (user)
  those_im_following = user.followings
  those_im_following.each do |followed|
      interesting << @tweets.where(user_id: followed.id)
    end
  end
end
