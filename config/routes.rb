Rails.application.routes.draw do
  root 'page#index'
  get '*path', to: redirect('/')
end
