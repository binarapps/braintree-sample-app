Rails.application.routes.draw do
  root 'payments#home'
  post 'charge_client' => 'payments#charge_client', as: :charge_client
end
