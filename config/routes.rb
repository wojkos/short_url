Rails.application.routes.draw do
  root 'urls#new'
  resource :urls, only: [:new, :create]
  get '/:url_short', to: 'urls#show'
  get '*path', to: redirect('/')
end
