class Api::CapstonesController < ApplicationController
  before_action :authenticate_current_student, except: [:index, :show]
end
