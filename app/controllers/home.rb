enable :sessions

get '/home' do
  if session[:user_id]
    @username = session[:user_id]
  else
    @username = 'Ralph'
  end
  tweets = Tweet.all
  div_items = []
  tweets.each do |tweet|
    tweeter_name = tweet.user.username
    content = tweet.content
    div_item = "<div class='tweet_item'> <strong>#{tweeter_name} </strong><br> \
                #{content} </div>"
    div_items << div_item
  end
  @div_string = div_items.join(" ")
  puts @div_string, "--------------------------------------------------"
  erb :home
end

post '/home' do

end

put '/home' do

end

