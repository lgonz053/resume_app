class RemovePasswordAndPasswordConfirmationFromStudent < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :password, :string
    remove_column :students, :password_confirmation, :string
  end
end
