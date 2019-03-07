class Api::ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all

    @experiences = @Experience.order(:id => :asc)
    render 'index.json.jbuilder'
  end
end
