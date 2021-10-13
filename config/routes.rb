Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hello/index' => 'hello#index'
  root 'tweets#index'
  get 'hello/link' => 'hello#link'
  #get 'tweets' => 'tweets#index'
  #get 'tweets/new' => 'tweets#new'
  #post 'tweets' => 'tweets#create'
  #get 'tweets/:id' => 'tweets#show',as: 'tweet'
  resources :tweets do
    collection do
      get 'about'
    end
    resources :likes, only: [:create]
  end
  
end
