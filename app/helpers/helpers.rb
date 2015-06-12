helpers do
  def get_tweets_from_those_im_following (user)
    interesting = []
    those_im_following = user.followings
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

  def sort_tweets(tweet_array)
    @tweets = tweet_array.sort { |tweet1, tweet2| tweet2.created_at <=> tweet1.created_at }
  end

  def get_counts
    if @user
      @followers = @user.followers.count
      @following = @user.followings.count
    else
      @username = User.find(session[:user_id])
      @followers = @username.followers.count
      @following = @username.followings.count
    end

  end




end
