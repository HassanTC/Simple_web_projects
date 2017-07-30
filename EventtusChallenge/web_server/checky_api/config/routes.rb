Rails.application.routes.draw do
  get 'checky'  => 'checks#find'
  post 'checky' => 'checks#add'
  root "checks#home"
end
