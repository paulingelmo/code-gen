class ChangeEmailNotNullInUser < ActiveRecord::Migration
  def change
    # set a default email for users w/o an email
    User.where(email: nil).each do |user|
      user.email = "#{user.name}@wyncode.co"
      user.save
    end
    change_column :users, :email, :string, null: false
  end
end
