
get '/profile/:username' do #visit a profile
  @user = User.where(username: params[:username]).first
  @usertweets = @user.tweets
  determine_follow_status
  get_counts
  erb :profile_view
end


post '/follow/:username' do
  @user = User.where(username: params[:username]).first
  follow_new_user
end

post '/search' do
  find_user = User.where(:username => params[:username]).first
  # if params[:username] == something activerord
  if find_user
    redirect "/profile/#{find_user.username}"
  else
    @current_user = User.find(session[:user_id])
    @search_error = "User not found"
    # redirect "/profile/#{current_user.username}"
    erb :'/partials/search'
  end
    # reroute the person to /profile/username
  # else (not found)
    # give an error of not found?

end


delete '/unfollow/:username' do
  following = User.where(username: params[:username]).first
  user = User.find(session[:user_id])
  p Relationship.where(follower_id: user.id, following_id: following.id).first.destroy
  redirect "/profile/#{params[:username]}"
end



#how to get the tweets! (feed is a list of all users following current_user)#
# feed.each{|person| person.tweets.each{|tweet| p tweet.content}}#
