Rails.application.routes.draw do
  root 'page#index'
  post 'urls', to: 'url#create'
  get '*path', to: redirect('/')
end
