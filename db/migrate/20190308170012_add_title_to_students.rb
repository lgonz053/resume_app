class AddTitleToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :title, :string
  end
end
