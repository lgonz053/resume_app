Rails.application.routes.draw do
  namespace :api do 
    post "/sessions" => "sessions#create"
    
    get '/students' => 'students#index'
    post '/students' => 'students#create'
    get '/students/:id' => 'students#show'
    patch '/students/:id' => 'students#update'

    get '/experiences' => 'experiences#index'
    post '/experiences' => 'experiences#create'
    get '/experiences/:id' => 'experiences#show'
    patch '/experiences/:id' => 'experiences#update'
    delete '/experiences/:id' => 'experiences#destroy'
  end
end
