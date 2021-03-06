Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root to: "home#index"

  resources :posts do
    get 'page/:page', :action => :index, :on => :collection
  end
end
