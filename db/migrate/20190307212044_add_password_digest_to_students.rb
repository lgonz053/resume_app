class AddPasswordDigestToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :password, :string
    add_column :students, :password_confirmation, :string
  end
end
