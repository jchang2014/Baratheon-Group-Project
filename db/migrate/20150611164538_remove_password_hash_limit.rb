class RemovePasswordHashLimit < ActiveRecord::Migration
  def change
    change_column(:users, :password_hash, :string)
  end
end
