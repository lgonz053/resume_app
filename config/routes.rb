Rails.application.routes.draw do
  namespace :api do 
    get '/students' => 'students#index'

    get '/experiences' => 'experiences#index'
    post '/experiences' => 'experiences#create'
    get '/experiences/:id' => 'experiences#show'
    patch '/experiences/:id' => 'experiences#update'
    delete '/experiences/:id' => 'experiences#destroy'
  end
end
