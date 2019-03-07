class AddStudentIdToCapstone < ActiveRecord::Migration[5.2]
  def change
    add_column :capstones, :student_id, :integer
  end
end
