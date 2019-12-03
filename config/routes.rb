Rails.application.routes.draw do
  
  devise_for :users,
      path: '',
      :defaults => { :format => 'json' },
      path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        registration: 'signup'
      },
      controllers: {
        sessions: 'sessions',
        registrations: 'registrations'
      }

  resources :tweets
  scope 'users/:user_id' do
    get 'tweets', to: 'tweets#index_by_user'

    post 'follow', to: 'follows#create'
    delete 'unfollow', to: 'follows#destroy'
    get 'follow', to: 'follows#show'

    get 'followers', to: 'users#followers'
    get 'following', to: 'users#following'
    
    get '', to: 'users#show'
  end
  get 'following_tweets', to: 'tweets#following_tweets'
end
