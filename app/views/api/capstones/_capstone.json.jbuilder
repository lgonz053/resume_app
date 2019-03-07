json.capstones do
  json.array! student.capstones.each do |capstone|
    json.id capstone.id
    json.student_id capstone.student_id
    json.name capstone.name
    json.description capstone.description
    json.url capstone.degree
  end
end