Rails.application.routes.draw do

  
  devise_for :salahs
  #devise_for :authors
  root to: 'blog/posts#index'


  namespace :author do
     resources :posts do
      put 'publish' => 'posts#publish', on: :member
      put 'unpublish' => 'posts#unpublish', on: :member
     end
  end	

  scope module: 'blog' do
  	 	
  	 get 'posts' => 'posts#index', as: :posts
  	 get 'posts/:id' => 'posts#show', as: :post

  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
