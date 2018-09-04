Madlibs::Application.routes.draw do
  root to: 'mad_libs#new'
  resources :mad_libs, only: [:index, :new, :create, :show] do
    resources :solutions, only: [:create, :show]
  end

  resources :reports, only: [:index] do
  end
end
