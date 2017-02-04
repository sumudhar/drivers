Rails.application.routes.draw do
  #resources :drivers
    get 'drivers' => 'drivers#drivers_list', as: :drivers ,defaults: {format: 'json'}
    put 'drivers/:id/location' => 'drivers#location_update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
