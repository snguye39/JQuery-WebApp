Rails.application.routes.draw do
  resources :courses do
    collection do
      get 'search'
    end
  end

  resources :sections do
    collection do
      get 'search'
    end
  end

  resources :students do
    collection do
      get 'search'
    end
  end

end
