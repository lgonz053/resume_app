Rails.application.routes.draw do
  namespace :api do 
    post "/sessions" => "sessions#create"
    
    get '/students' => 'students#index'
    post '/students' => 'students#create'
    get '/students/:id' => 'students#show'
    patch '/students/:id' => 'students#update'

    get '/educations' => 'educations#index'
    post '/educations' => 'educations#create'
    get '/educations/:id' => 'educations#show'
    patch '/educations/:id' => 'educations#update'
    delete '/educations/:id' => 'educations#destroy'

    get '/experiences' => 'experiences#index'
    post '/experiences' => 'experiences#create'
    get '/experiences/:id' => 'experiences#show'
    patch '/experiences/:id' => 'experiences#update'
    delete '/experiences/:id' => 'experiences#destroy'

    get '/capstones' => 'capstones#index'
    post '/capstones' => 'capstones#create'
    get '/capstones/:id' => 'capstones#show'
    patch '/capstones/:id' => 'capstones#update'
    delete '/capstones/:id' => 'capstones#destroy'
  end
end
