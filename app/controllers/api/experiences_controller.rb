class Api::ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all

    search_terms = params[:search]
    if search_terms
      @experiences = @experience.where("")
    end

    @experiences = @Experience.order(:id => :asc)
    render 'index.json.jbuilder'
  end

  def create
    @experience = Experience.new(
                                student_id: params[:student_id],
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
end
