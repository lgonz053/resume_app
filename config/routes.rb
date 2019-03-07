Rails.application.routes.draw do
  namespace :api do 
    get '/students' => 'students#index'

    post "/sessions" => "sessions#create"
  end
end
