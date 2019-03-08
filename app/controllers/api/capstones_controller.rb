class Api::CapstonesController < ApplicationController
  before_action :authenticate_student, except: [:index, :show]

  def index
    @capstones = Capstone.all

    render 'index.json.jbuilder'
  end
  
  def create
    @capstone = Capstone.new(
                              student_id: current_student.id,
                              name: params[:name],
                              description: params[:description],
                              url: params[:url]
                             )

    if @capstone.save 
      render 'show.json.jbuilder'
    else
      render json: { errors: @capstone.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @capstone = Capstone.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @capstone = Capstone.find(params[:id])

    @capstone.name = params[:name] || @capstone.name
    @capstone.description = params[:description] || @capstone.description
    @capstone.url = params[:url] || @capstone.url

    if @capstone.student_id == current_student.id
      @capstone.save
      render 'show.json.jbuilder'
    else  
      render json: {errors: @capstone.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    capstone = Capstone.find(params[:id])

    if @capstone.student_id == current_student.id
      capstone.destroy
      render json: {message: "Successfully removed capstone."}
    else  
      render json: {errors: @capstone.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
