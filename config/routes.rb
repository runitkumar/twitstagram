Twitstagram::Application.routes.draw do
  get "pages/home"
  get "pages/about"
  devise_for :users
  resources :people

  root 'people#index'
  get "about" => "pages#about"
  get 'search' => 'people#search'
end
