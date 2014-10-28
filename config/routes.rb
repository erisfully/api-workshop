Rails.application.routes.draw do

  root 'projects#index'

  resources :projects do
    resources :comments
  end

end
