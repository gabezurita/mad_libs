Madlibs::Application.routes.draw do
  root to: 'mad_libs#new'
  resources :mad_libs, only: [:new, :create, :show] do
    resources :solutions, only: [:create, :show]
  end
end
