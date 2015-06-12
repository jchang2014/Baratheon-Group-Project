enable :sessions

post '/tweets' do
  userid = session[:user_id]
  Tweet.create!(content: params[:content], user_id: userid)
  redirect to '/'
end
