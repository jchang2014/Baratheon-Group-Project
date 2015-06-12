class User < ActiveRecord::Base
  include BCrypt

  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true

  has_many :tweets

  has_many :follower_relationships, :foreign_key => 'follower_id', :class_name => 'Relationship'
  has_many :following_relationships, :foreign_key => 'following_id', :class_name => 'Relationship'
  has_many :followers, :through => :following_relationships
  has_many :followings, :through => :follower_relationships


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
