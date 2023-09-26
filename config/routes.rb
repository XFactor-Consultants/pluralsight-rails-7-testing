Rails.application.routes.draw do
  resources :wiki_posts
  namespace :wiki_posts do 
    get 'example'
  end 
  namespace :welcome do 
    get 'index'
    get 'about'
    get 'archive'
  end 

  namespace :api do 
    namespace :v1 do 
      get 'wiki_posts/xml', to: 'wiki_posts#xml_index'
      get 'wiki_posts/csv', to: 'wiki_posts#csv_index'
      resources :wiki_posts 
    end 
    namespace :v2 do 
      resources :wiki_posts
    end 
  end 
  
  get '/about', to: redirect('/welcome/about')
  root "welcome#index"
end