class User
  attr_reader :id, :username, :email, :created_at
  def initialize(params={})
    @id = params[:id]
    @username = params[:username]
    @email = params[:email]
    @created_at = params[:created_at]
  end
end

get '/profile/:username' do
  user = {id: 1, username: "letran", email: "lele@twitter.com", created_at: "12/31/2009"}
  @user = User.new(user)
  erb :profile
end

post '/follow/:id' do
  #current_user follows params[:user.id]
  direct :follow
end

delete '/unfollow/:id' do
  relationship = followers.where(following = @user.id, follower == current.id)
end

#delete following_id
#user-id   |   following-id
# 1                 4
#
