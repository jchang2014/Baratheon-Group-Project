
get '/profile/:username' do #visit a profile
  @user = User.where(username: params[:username]).first
  @usertweets = @user.tweets
  determine_follow_status
  erb :profile_view
end


post '/follow/:username' do
  @user = User.where(username: params[:username]).first
  follow_new_user
end


delete '/unfollow/:username' do
  following = User.where(username: params[:username]).first
  user = User.find(session[:user_id])
  p Relationship.where(follower_id: user.id, following_id: following.id).first.destroy
  redirect "/profile/#{params[:username]}"
end



#how to get the tweets! (feed is a list of all users following current_user)#
# feed.each{|person| person.tweets.each{|tweet| p tweet.content}}#
