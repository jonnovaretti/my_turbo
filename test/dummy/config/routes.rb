Rails.application.routes.draw do
  resources :articles
  mount MyTurbo::Engine => "/my_turbo"
end
