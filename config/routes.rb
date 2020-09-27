Rails.application.routes.draw do
  devise_for :authors, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  #get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

   root to: "authors/posts#index"
   scope module: 'authors' do
       resources :posts do
          collection do
            get :like
          end
       end
   end
end
