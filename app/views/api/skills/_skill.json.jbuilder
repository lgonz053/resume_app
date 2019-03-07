json.skills do 
  json.array! student.skills.each do |skill|
    json.id skill.id
    json.student_id skill.student_id
    json.skill skill.skill
  end
end

