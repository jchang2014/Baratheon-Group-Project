enable :sessions

post '/tweets' do
  userid = session[:user_id]
  50.times {print "*"}
  p params[:content]
  p params[:content].length
  p params[:content].class

  if params[:content].length == 0
    user = User.find(session[:user_id])
    puts "OMG THSI ISNT A CONTENT"
    @tweet_error = "You didn't tweet anything!"
    @tweets = get_tweets_from_those_im_following(user)
    erb :home
  else
    puts "THIS CONTENT IS GOOD"
    tweet = Tweet.create!(content: params[:content], user_id: userid)
    redirect to '/'
  end
end
