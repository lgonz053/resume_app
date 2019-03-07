Rails.application.routes.draw do
  namespace :api do 
    get '/students' => 'students#index'
  end
end
