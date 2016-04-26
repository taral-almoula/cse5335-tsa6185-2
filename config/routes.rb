Rails.application.routes.draw do
  
  root 'welcome#index'
  get 'item/:Id' => 'welcome#datasend'

  end
