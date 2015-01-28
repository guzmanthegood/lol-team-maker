Rails.application.routes.draw do

	root 'champions#index'
  resources :champions

	namespace 'api' do
		root 'api#index' 
	end

end