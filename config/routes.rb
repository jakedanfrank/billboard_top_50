Rails.application.routes.draw do
  root "billboards#index"
  
resources :billboards
end
