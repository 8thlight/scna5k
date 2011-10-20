Scna5k::Application.routes.draw do

  resources :runners

  match "/times", :to => "runners#edit_times"
  match "/update_times", :to => "runners#update_times"

  root :to => "runners#index"

end
