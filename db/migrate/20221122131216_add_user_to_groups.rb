class AddUserToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :user, :integer
  end
end
