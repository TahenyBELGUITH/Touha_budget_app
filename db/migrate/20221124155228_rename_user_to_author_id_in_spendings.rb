class RenameUserToAuthorIdInSpendings < ActiveRecord::Migration[7.0]
  def change
    rename_column :spendings, :user_id, :author_id
  end
end
