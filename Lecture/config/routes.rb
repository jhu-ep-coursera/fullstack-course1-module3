Rails.application.routes.draw do
  # get 'greeter/hello'

  # SAME AS ABOVE
  get 'greeter/hello' => "greeter#hello"
  get 'greeter/goodbye'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
end





