class Api::SkillsController < ApplicationController
  before_action :authenticate_student, except: [:index, :show]

  def index
    @skills = Skill.all 
    render 'index.json.jbuilder'
  end

  def create
    @skill = Skill.new(
                       skill: params[:skill],
                       student_id: current_student.id
                      )
    
    if @skill.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @skill.errors.full_messages}, status: :unprocessable_entity
    end  
  end

  def show
    @skill = Skill.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @skill = Skill.find(params[:id])

    @skill.skill = params[:skill] || @skill.skill

    if @skill.student_id == current_student.id
      @skill.save
      render 'show.json.jbuilder'
    else  
      render json: {errors: @skill.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    skill = Skill.find(params[:id])

    if skill.student_id == current_student.id
      skill.destroy
      render json: {message: "Successfully removed skill."}
    else  
      render json: {errors: @skill.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
