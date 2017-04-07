Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :rest do
      namespace :v1 do

      end
    end
  end
end
