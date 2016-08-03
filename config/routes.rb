Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    get 'posts', to: 'posts#index'
    # post 'cards', to: 'cards#create'
    # put "review" => "trainer#review_card"
    # get "train" => "trainer#index"
  end
end
