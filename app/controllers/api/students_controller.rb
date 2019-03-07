class Api::StudentsController < ApplicationController
  def index
    
  end

  def create
    @student = Student.new(
                            first_name: params[:first_name],
                            last_name: params[:last_name],
                            email: params[:email],
                            phone_number: params[:phone_number],
                            short_bio: params[:short_bio],
                            linkedin_url: params[:linkedin_url],
                            twitter_handle: params[:twitter_handle],
                            personal_blog: params[:personal_blog],
                            resume_url: params[:resume_url],
                            
                          )
  end
end
