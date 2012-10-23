Welcome::Application.routes.draw do
	devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"} do 
		get '/users/sign_out' => 'devise/sessions#destroy'
	end  

	root :to => "welcome#index"
end
