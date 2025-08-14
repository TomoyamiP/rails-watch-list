Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks, only: [:new, :create, :destroy]
    resources :movies, only: [:show]   # <-- this is what creates list_movie_path
  end

  root "lists#index"
end
