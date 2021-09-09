Rails.application.routes.draw do
  get 'price/index'
  get 'price/get_quote_last_seven_days'
  root 'price#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
