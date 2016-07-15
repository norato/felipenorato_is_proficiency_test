Rails.application.routes.draw do
  resources :courses do
    resources :classrooms
  end
  resources :students
end
