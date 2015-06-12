enable :sessions

get '/home' do
  if session[:user_id]
    userid = session[:user_id]
    @username = User.find(userid).username
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
  interesting = []
  those_im_following = user.followings
  those_im_following.each do |followed|
      followed.tweets.each { |tweet| interesting << tweet }
  end
  interesting
end
