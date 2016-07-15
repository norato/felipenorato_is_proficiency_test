Rails.application.routes.draw do
  resources :courses do
    get :classroom
  end
  resources :students
end
