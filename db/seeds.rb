brian = User.create!(username: "bk", email: "bk1@gmail.com", password: "bk123")
arielle = User.create!(username: "ac", email: "ac1@gmail.com", password: "ac123")


Tweet.create!(user_id: 1, content: "Hi I'm Brian, and I'm tweeting.")
Tweet.create!(user_id: 1, content: "This is Brian's second tweet.")
Tweet.create!(user_id: 2, content: "Hi I'm Arielle, and I'm tweeting.")
Tweet.create!(user_id: 2, content: "This is Arielle's second tweet.")


User.create!(username: "aw", email: "ac1@gmail.com", password: "ac123")
User.create!(username: "am", email: "am1@gmail.com", password: "am123")
User.create!(username: "ab", email: "ab1@gmail.com", password: "ab123")
User.create!(username: "at", email: "at1@gmail.com", password: "at123")




