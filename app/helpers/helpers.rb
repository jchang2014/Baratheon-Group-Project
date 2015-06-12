helpers do
  def get_tweets_from_those_im_following (user)
    interesting = []
    those_im_following = user.followings + [user]

    those_im_following.each do |followed|
        followed.tweets.each { |tweet| interesting << tweet }
    end
    interesting
  end

  def determine_follow_status
    if Relationship.where(follower_id: session[:user_id], following_id: @user.id).first
      @follows = true
    else
      @follows = false
    end
  end


  def follow_new_user
    #@user is user you're following
    #acting_user is current_user
    acting_user = User.find(session[:user_id])
    @user.followers << acting_user
    redirect to("/profile/#{@user.username}")
  end



end
