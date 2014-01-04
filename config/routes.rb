require "resque_web"

Flow::Application.routes.draw do
  resources :documents do
    post 'analyze', on: :member
    post 'extract', on: :member
  end

  root to: 'pages#root'

  mount ResqueWeb::Engine => "/resque_web"
end
