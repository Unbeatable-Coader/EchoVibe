class AddUserIdToUserDetails < ActiveRecord::Migration[7.1]
  def change
    add_reference :user_details, :user, null: true, foreign_key: true
  end
end
