Blog::Application.routes.draw do

  resources :posts do
    resources :comments, :only => [:create, :destroy]
  end
  get 'favorite_posts' => 'posts#favorite_posts', :as => "favorite_posts"
  get 'vote_up/:id' => 'posts#vote_up', :as => "vote_up"
  get 'vote_down/:id' => 'posts#vote_down', :as => "vote_down"

  devise_for :bloggers, :controllers => { :omniauth_callbacks => "bloggers/omniauth_callbacks" }  
  match 'bloggers/add_to_favorites/:id' => 'bloggers#add_to_favorites', :as => "add_to_favorites"
  match 'bloggers/remove_from_favorites/:id' => 'bloggers#remove_from_favorites', :as => "remove_from_favorites"
  match 'bloggers/:provider/:nickname' => 'bloggers#show', :as => "show_blogger_profile"

  root to: "welcome#index"  
  
  get ':action' => 'pages#:action'
  
end
