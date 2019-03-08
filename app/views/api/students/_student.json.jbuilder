json.id student.id
json.first_name student.first_name
json.last_name student.last_name
json.email student.email
json.phone_number student.phone_number
json.short_bio student.short_bio
json.linkedin_url student.linkedin_url
json.twitter_handle student.twitter_handle
json.personal_blog student.personal_blog
json.resume_url student.resume_url
json.github_url student.github_url
json.photo student.photo
json.title student.title

json.educations do
  json.array! student.educations.each do |education|
    json.id education.id
    json.student_id education.student_id
    json.start_date education.start_date
    json.end_date education.end_date
    json.degree education.degree
    json.university_name education.university_name
    json.details education.details
  endr
end

json.experiences do
  json.array! student.experiences.each do |experience|
    json.id experience.id
    json.student_id experience.student_id
    json.start_date experience.start_date
    json.end_date experience.end_date
    json.job_title experience.job_title
    json.company_name experience.company_name
    json.details experience.details
  end
end

json.skills do 
  json.array! student.skills.each do |skill|
    json.id skill.id
    json.student_id skill.student_id
    json.skill skill.skill
  end
end

json.capstone do
  if student.capstone
    json.partial! student.capstone, partial: 'api/capstones/capstone', as: :capstone
  end
end

