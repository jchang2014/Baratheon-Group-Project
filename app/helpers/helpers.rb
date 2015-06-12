helpers do
  def get_tweets_from_those_im_following (user)
    interesting = []
    those_im_following = user.followings
    those_im_following.each do |followed|
        followed.tweets.each { |tweet| interesting << tweet }
    end
    interesting
  end
end
