Rails.application.routes.draw do
  get '/login',to: 'sessions#new'
  post    '/login',to: 'sessions#create'
  delete  '/logout',to: 'sessions#destroy'
  resources :users
  resources :collections do
    member do
      delete :delete_image_attachment
    end
end
end
