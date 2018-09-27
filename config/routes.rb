Rails.application.routes.draw do

  root "website#index"

  match '*path' => 'website#template', :via => "get"

end
