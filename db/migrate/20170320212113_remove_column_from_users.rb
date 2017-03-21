class RemoveColumnFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :last, :string
    remove_column :users, :password_digest, :string
  end
end
