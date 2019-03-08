class Api::EducationsController < ApplicationController
  before_action :authenticate_student, except: [:index, :show]

  def index
    @educations = Education.all

    render 'index.json.jbuilder'
  end
  
  def create
    @education = Education.new(
                               student_id: current_student.id,
                               start_date: params[:start_date],
                               end_date: params[:end_date],
                               degree: params[:degree],
                               university_name: params[:university_name],
                               details: params[:details]
                              )
    if @education.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @education.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @education = Education.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @education = Education.find(params[:id])

    @education.student_id = params[:student_id] || @education.student_id
    @education.start_date = params[:start_date] || @education.start_date
    @education.end_date = params[:end_date] || @education.end_date
    @education.degree = params[:degree] || @education.degree
    @education.university_name = params[:university_name] || @education.university_name
    @education.details = params[:details] || @education.details

    if @education.student_id == current_student.id
      @education.save
      render 'show.json.jbuilder'
    else  
      render json: {errors: @education.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    education = Education.find(params[:id])

    if @education.student_id == current_student.id
      education.destroy
      render json: {message: "Successfully removed education."}
    else  
      render json: {errors: @education.errors.full_messages}, status: :unprocessable_entity
    end


  end
end
