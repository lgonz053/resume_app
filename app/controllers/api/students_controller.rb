class Api::StudentsController < ApplicationController
  before_action :authenticate_current_student, except: [:index, :show]
  
  def index
    @students = Student.all

    search_terms = params[:search]
    if search_terms
      @students = @student.where("title iLIKE ?", "%#{search_terms}%")
    end

    render 'index.json.jbuilder'
  end

  def show
    @student = Student.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @student = Student.find(params[:id])

    @student.first_name = params[:first_name] || @student.first_name
    @student.last_name = params[:last_name] || @student.last_name
    @student.email = params[:email] || @student.email
    @student.phone_number = params[:phone_number] || @student.phone_number
    @student.short_bio = params[:short_bio] || @student.short_bio
    @student.linkedin_url = params[:linkedin_url] || @student.linkedin_url
    @student.twitter_handle = params[:twitter_handle] || @student.twitter_handle
    @student.personal_blog = params[:personal_blog] || @student.personal_blog
    @student.resume_url = params[:resume_url] || @student.resume_url
    @student.github_url = params[:github_url] || @student.github_url
    @student.photo = params[:photo] || @student.photo

    @student.save
    render 'show.json.jbuilder'
  end
end