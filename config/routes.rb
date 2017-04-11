Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :rest do
      namespace :v1 do
        resources :pages, only: [:index, :show, :create]
      end
    end
  end
end
