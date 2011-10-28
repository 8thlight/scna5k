Scna5k::Application.routes.draw do

  resources :runners

  match "/times", :to => "runners#edit_times"
  match "/update_times", :to => "runners#update_times"
  match "/input_times", :to => "runners#input_times"
  match "/input_times_submit", :to => "runners#input_times_submit"

  root :to => "runners#index"

end
