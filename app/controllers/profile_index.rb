
get '/:username' do #visit a profile
  @user = User.find_by(username: params[:username])
  @usertweets = ["tweet1", "tweet2", "tweet3"]
  erb :profile_view
end

post '/follow/:id' do #follow a profile
  current_user = session[:user_id]
  new_relationship = Follower.new(follower: current_user, following: params[:id])
  if new_relationship.save
    redirect to("/profile/#{params[:id]}")
  else
    redirect to("/profile/#{params[:id]}")
    #redirect but add error message to top of page
  end
end


# delete '/unfollow/:id' do
#   relationship = followers.where(following = @user.id, follower == current.id)
# end

#delete following_id
#user-id   |   following-id
# 1                 4
#


####### how to get the tweets! (feed is a list of all users following current_user)############
# feed.each{|person| person.tweets.each{|tweet| p tweet.content}}
##################################
