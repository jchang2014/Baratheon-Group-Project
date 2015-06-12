class Relationship < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :follower, :class_name => "User"
  belongs_to :following, :class_name => "User"
end
