Clipbox::Application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:index] #do
  #   get 'send', :to => 'users#send_email'
  # end

  resources :topics do 
    resources :bookmarks
  end

  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy'#, as: => :destroy_user_session
  end

  post :incoming, to: 'incoming#create'

  get 'about' => 'welcome#about'

  root to: "welcome#index"
end
