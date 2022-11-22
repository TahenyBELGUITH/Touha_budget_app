class AddUserToSpendings < ActiveRecord::Migration[7.0]
  def change
    add_column :spendings, :user, :integer
  end
end
