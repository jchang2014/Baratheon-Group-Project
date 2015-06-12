class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true

  has_many :tweets

  has_many :follower_relationships, :foreign_key => 'follower_id', :class_name => 'Relationship'
  has_many :following_relationships, :foreign_key => 'following_id', :class_name => 'Relationship'
  has_many :followers, :through => :following_relationships
  has_many :followings, :through => :follower_relationships

end
