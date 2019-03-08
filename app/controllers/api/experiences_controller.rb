class Api::ExperiencesController < ApplicationController
  before_action :authenticate_student, except: [:index, :show]
  
  def index
    @experiences = Experience.all

    render 'index.json.jbuilder'
  end

  def create
    @experience = Experience.new(
                                student_id: current_student.id,
                                start_date: params[:start_date],
                                end_date: params[:end_date],
                                job_title: params[:job_title],
                                company_name: params[:company_name],
                                details: params[:details]
                                )
    if @experience.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @experience.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @experience = Experience.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @experience = Experience.find(params[:id])

    @experience.student_id = params[:student_id] || @experience.student_id
    @experience.start_date = params[:start_date] || @experience.start_date
    @experience.end_date = params[:end_date] || @experience.end_date
    @experience.job_title = params[:job_title] || @experience.job_title
    @experience.company_name = params[:company_name] || @experience.company_name
    @experience.details = params[:details] || @experience.details

    @experience.save
    render 'show.json.jbuilder'
  end

  def destroy
    experience = Experience.find(params[:id])
    experience.destroy

    redner json: { message: "Successfully removed experience." }
  end
end
