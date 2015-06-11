brian = User.create!(username: "bk", email: "bk1@gmail.com", password: "bk123")
arielle = User.create!(username: "ac", email: "ac1@gmail.com", password: "ac123")

Tweet.create!(user_id: 1, content: "Hi I'm Brian, and I'm tweeting.")
Tweet.create!(user_id: 1, content: "This is Brian's second tweet.")
Tweet.create!(user_id: 2, content: "Hi I'm Brian, and I'm tweeting.")
Tweet.create!(user_id: 2, content: "Hi Yo great revoker, and I'm tweeting.")
