class CreateUserDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :user_details do |t|
      t.string :name
      t.string :userName
      t.date :DOB
      t.string :email
      t.string :gender
      t.string :mobile

      t.timestamps
    end
  end
end
