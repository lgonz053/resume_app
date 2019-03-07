Rails.application.routes.draw do
  namespace :api do 
    post "/sessions" => "sessions#create"
    
    get '/students' => 'students#index'
    get '/students/:id' => 'students#show'
    patch '/students/:id' => 'students#update'

    get '/experiences' => 'experiences#index'
    post '/experiences' => 'experiences#create'
    get '/experiences/:id' => 'experiences#show'
    patch '/experiences/:id' => 'experiences#update'
    delete '/experiences/:id' => 'experiences#destroy'

    get'/skills' => 'skills#index'
    post'/skills' => 'skills#create'
    get '/skills/:id' => 'skills#show'
    patch '/skills/:id' => 'skills#update'
    delete '/skills/:id' n=> 'skills#destroy'
  end
end
