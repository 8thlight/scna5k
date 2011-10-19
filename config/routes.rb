Scna5k::Application.routes.draw do

  resources :runners

  match "/times", :to => "runners#edit_collection"
  match "/update_times", :to => "runners#update_collection"

  root :to => "runners#index"

end
