Rails.application.routes.draw do
  get 'news', to: 'games#news', as:  :news
  post 'score', to: 'games#score', as: :score 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
