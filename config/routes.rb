Scna5k::Application.routes.draw do

  resources :runners

  root :to => "runners#index"

end
