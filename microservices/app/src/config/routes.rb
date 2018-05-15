Rails.application.routes.draw do

  root :to => 'welcome#index'
  get 'welcome/index'
  get '/get_articles', :to => 'welcome#get_articles'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
