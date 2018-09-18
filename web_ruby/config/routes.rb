Rails.application.routes.draw do
  get 'proyecto/index'
  root 'proyecto#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
