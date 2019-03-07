class AddStudentIdSkills < ActiveRecord::Migration[5.2]
  def change
    add_column :skills, :student_id, :integer
    rename_column :skills, :skill_name, :skill
  end
end
